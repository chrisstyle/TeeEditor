//
//  CString.m
//  Big
//
//  Created by chrisstyle on 1/30/15.
//  Copyright (c) 2015 fastquick. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NSString (CString)

#pragma mark - 属性

// 字符串是否非空
@property (nonatomic, readonly) BOOL nonempty;


#pragma mark - 静态方法

#pragma mark 从 UTF8 方式编码的 NSData 对象数据中返回解码后的字符串
+ (NSString*)stringWithUTF8Data:(NSData*)data;

#pragma mark 从更新日期中返回更新日期的字符串，基本专用于下拉刷新的更新日期
+ (NSString*)stringWithUpdateDate:(NSDate*)date;


#pragma mark - 方法

- (NSString*)appendURLParam:(NSString*)param;
- (NSString*)appendURLParam:(NSString*)param value:(NSString*)value;

#pragma mark unicode解码
- (NSString*)decodeUnicode;

#pragma mark - 用于在http请求中对参数值编码
- (NSString*)httpEncoding;

#pragma mark - http请求中对参数值解码
- (NSString*)httpDecoding;

#pragma mark 判断字符串是否为空
//- (BOOL)isEmpty;

#pragma mark 判断字符串排除指定的字符集后是否为空
- (BOOL)isEmptyByTrimmingCharactersInSet:(NSCharacterSet *)set;

#pragma mark 判断字符串排除空白字符集后是否为空
- (BOOL)isEmptyByTrimmingWhitespaceCharacterSet;


#pragma mark 输出字符串的MD5码
- (NSString *)md5;

- (NSString*)unicodeDecode;

@end
