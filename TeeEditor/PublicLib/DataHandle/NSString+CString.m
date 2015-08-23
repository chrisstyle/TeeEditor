//
//  CString.h
//  Big
//
//  Created by chrisstyle on 1/30/15.
//  Copyright (c) 2015 fastquick. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>

#import "PublicDefine.h"

#import "NSString+CString.h"

@implementation NSString (CString)

#pragma mark - 属性

@dynamic nonempty;

#pragma mark 字符串是否非空
- (BOOL)nonempty
{
    return (self != nil) && (![self isEqualToString:@""]);
}



#pragma mark - 静态方法

#pragma mark 从 UTF8 方式编码的 NSData 对象数据中返回解码后的字符串
+ (NSString*)stringWithUTF8Data:(NSData*)data
{
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] ;
}

#pragma mark 从更新日期中返回更新日期的字符串，基本专用于下拉刷新的更新日期
+ (NSString*)stringWithUpdateDate:(NSDate*)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *strDay = @"";
    
    if ([[formatter stringFromDate:date] isEqual:[formatter stringFromDate:[NSDate date]]])
        {
        strDay = L(@"今天");
        }
    [formatter setAMSymbol:L(@"上午")];
    [formatter setPMSymbol:L(@"下午")];
    [formatter setDateFormat:L(@"最后更新：yyyy-MM-dd HH:mm")];
    if ([strDay isEqual:@""])
        {
        strDay = [formatter stringFromDate:date];
        }
    else
        {
        [formatter setDateFormat:L(@"最后更新：今天 HH:mm")];
        strDay = [formatter stringFromDate:date];
        }
    return strDay;
}

#pragma mark - 方法

- (NSString*)appendURLParam:(NSString*)param
{
    if (!param.nonempty) return self;
    
    NSRange range = [self rangeOfString:@"?"];
    NSString *link = (range.location == NSNotFound) ? @"?" : @"&";
    
    if ([self isEqualToString:@""]
        || ((range.location != NSNotFound) && [self hasSuffix:@"?"]))
        link = @"";
    
    NSString *result = [[self stringByAppendingString:link] stringByAppendingString:param];
    return [result httpEncoding];
}

- (NSString*)appendURLParam:(NSString*)param value:(NSString*)value
{
    if (!param.nonempty) return self;
    if (!value.nonempty) value = @"";
    
    NSString *append = [NSString stringWithFormat:@"%@=%@", param, value];
    NSRange range = [self rangeOfString:@"?"];
    NSString *link = (range.location == NSNotFound) ? @"?" : @"&";
    
    if ([self isEqualToString:@""]
        || ((range.location != NSNotFound) && [self hasSuffix:@"?"]))
        link = @"";
    
    NSString *result = [[self stringByAppendingString:link] stringByAppendingString:append];
    return [result httpEncoding];
}

#pragma mark unicode解码
- (NSString*)decodeUnicode
{
    NSString *strTemp1 = [self stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
    
    NSString *strTemp2 = [strTemp1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    
    NSString *strTemp3 = [[@"\"" stringByAppendingString:strTemp2] stringByAppendingString:@"\""];
    
    NSData *data = [strTemp3 dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString* strResult = [NSPropertyListSerialization propertyListFromData:data mutabilityOption:NSPropertyListImmutable format:NULL errorDescription:NULL];
    
    return strResult;
    //return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"\n"];
}

#pragma mark - 用于在http请求中对参数值编码
- (NSString*)httpEncoding
{
    return [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

#pragma mark - http请求中对参数值解码
- (NSString*)httpDecoding
{
    return [self  stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

#pragma mark 判断字符串是否为空
- (BOOL)isEmpty
{
    return (self == nil) || ([self isEqualToString:@""]);
}

#pragma mark 判断字符串排除指定的字符集后是否为空
- (BOOL)isEmptyByTrimmingCharactersInSet:(NSCharacterSet *)set
{
    NSString *strTemp = [self stringByTrimmingCharactersInSet:set];
    return [strTemp isEmpty];
}

#pragma mark 判断字符串排除空白字符集后是否为空
- (BOOL)isEmptyByTrimmingWhitespaceCharacterSet
{
    return [self isEmptyByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

#pragma mark 输出字符串的MD5码
- (NSString *)md5
{
    if(self == nil || [self length] == 0) return nil;
    
    const char *value = [self UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (unsigned int)strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++)
        {
        [outputString appendFormat:@"%02x", outputBuffer[count]];
        }
    
    return outputString ;
}

#pragma mark - 编码转换

- (NSString*)unicodeDecode
{
    NSString *tempStr1 = [self stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 = [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString* returnStr = [NSPropertyListSerialization propertyListFromData:tempData
                                                           mutabilityOption:NSPropertyListImmutable
                                                                     format:NULL
                                                           errorDescription:NULL];
    
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"\n"];
}

@end
