//
//  CFileTools.m
//  Big
//
//  Created by chrisstyle on 1/30/15.
//  Copyright (c) 2015 fastquick. All rights reserved.
//

#import "PublicDefine.h"
#import "NSString+CString.h"
#import "CFileTools.h"

@implementation CFileTools

#pragma mark 获得app的缓存路径
+ (NSString*)appCachePath
{
    // 编写类似方法时请在路径串结尾处加上‘／’字符，以免和文件名称组合时导致产生的不是你期待的文件，例如/Users/..../Library/Caches/xx.xx 变成：/Users/..../Library/Cachesxx.xx
    return [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex: 0] stringByAppendingString:@"/"];
}

#pragma mark 获得app的文档路径
+ (NSString*)appDocumentPath
{
    // 编写类似方法时请在路径串结尾处加上‘／’字符，以免和文件名称组合时导致产生的不是你期待的文件，例如/Users/..../Library/Caches/xx.xx 变成：/Users/..../Library/Cachesxx.xx
    return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex: 0] stringByAppendingString:@"/"];
}

#pragma mark － 路径相关

#pragma mark 指定路径包含文件的大小总和
+ (unsigned long)dirSize:(NSString*)strDir
{
    NSArray *aryFiles = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:strDir error:NULL];
    int result = 0;
    
    for (NSString *strFile in aryFiles)
        {
        result += [CFileTools fileSize:[NSString stringWithFormat:@"%@/%@", strDir, strFile]];
        }
    
    return result;
}


#pragma mark 容量的字符串表示
+ (NSString*)stringWithSize:(unsigned long)nSize
{
    int unit = 0;
    unsigned long nPrevSize = 0;
    while (nSize >= 1024)
        {
        nPrevSize = nSize;
        nSize = (nSize / 1024);
        unit ++;
        }
    
    NSString *strUnit = @"B";
    switch (unit)
    {
        case 1: strUnit = @"KB";
        break;
        
        case 2: strUnit = @"MB";
        break;
        
        case 3: strUnit = @"GB";
        break;
        
        case 4: strUnit = @"TB";
        break;
        
        default:
        break;
    }
    
    NSString *strFractionalPart = @"";
    if (unit >= 1)
        {
        unsigned long f = (nPrevSize - nSize * 1024);
        if (f > 0) strFractionalPart = [NSString stringWithFormat:@".%d", (int)(((float)f/(float)1024) * 100)];
        }
    return [NSString stringWithFormat:@"%ld%@%@", nSize, strFractionalPart, strUnit];
}

#pragma mark - 文件夹相关

#pragma mark 清理指定目录下的所有文件
+ (void)pathClear:(NSString*)strPath
{
    if (![CFileTools fileExistsAtPath:strPath]) return;
    
    // 清理文件
    NSArray *aryFiles = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:strPath error:NULL];
    
    NSDictionary * dicAttributes = nil;
    NSString * strType;
    
    for (NSString *strFile in aryFiles)
        {
        NSString * _strFile = [strPath stringByAppendingString:strFile];
        
        // 获取文件属性
        dicAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:_strFile error:nil];
        if (dicAttributes != nil)
            {
            // 判断是不是文件夹，若是则递归处理
            strType = [dicAttributes objectForKey:NSFileType];
            if ([strType isEqualToString:NSFileTypeDirectory])
                {
                [CFileTools pathClear:_strFile];
                }
            else
                {
                // 删除文件
                [[NSFileManager defaultManager] removeItemAtPath:_strFile error:NULL];
                }
            }
        }
}


#pragma mark 文件夹是否存在
+ (BOOL)pathExists:(NSString *)strPath
{
    return [CFileTools fileExistsAtPath:strPath];
}

#pragma mark 文件夹是否存在，若不存在则创建
+ (BOOL)pathExistsWithCreate:(NSString *)strPath
{
    if ([CFileTools pathExists:strPath]) return YES;
    
    // 判断结尾是否带'/'
    if (![strPath hasSuffix:@"/"])
        {
        strPath = [strPath stringByAppendingString:@"/"];
        }
    
    return [[NSFileManager defaultManager] createDirectoryAtPath:strPath withIntermediateDirectories:YES attributes:nil error:nil];
}

#pragma mark 路径添加反斜杠
+ (NSString*)pathBackslash:(NSString*)strPath
{
    if (![strPath hasSuffix:@"/"])
        {
        strPath = [strPath stringByAppendingString:@"/"];
        }
    return strPath;
}

#pragma mark - 文件相关

#pragma mark 枚举指定位置的所有文件，包括子文件夹
+ (NSString*)enumerationFiles:(NSString*)strPath
{
    NSString* strResult = [NSString stringWithFormat:@"\r\n%@\r\n", strPath];
    return [strResult stringByAppendingString:[CFileTools enumerationFiles:strPath level:0]];
}

+ (NSString*)enumerationFiles:(NSString*)strPath level:(int)nLevel
{
    if (strPath == nil) return 0;
    strPath = [CFileTools pathBackslash:strPath];
    NSString *strResult = @"";
    NSString *strPrefix = @"";
    
    for (int i = 0; i <= nLevel; i++) strPrefix = [strPrefix stringByAppendingString:@"    "];
    
    NSError *error;
    NSArray *aryFiles = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:strPath error:&error];
    NSNumber *numSize = nil;
    NSDictionary * dicAttributes = nil;
    NSString * strType;
    NSString *strFile;
    
    for (NSString *strFileName in aryFiles)
        {
        strFile = [strPath stringByAppendingString:strFileName];
        
        // 获取文件属性
        dicAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:strFile error:nil];
        if (dicAttributes != nil)
            {
            // 判断是不是文件夹，若是则递归处理
            strType = [dicAttributes objectForKey:NSFileType];
            if ([strType isEqualToString:NSFileTypeDirectory])
                {
                strResult = [strResult stringByAppendingString:[NSString stringWithFormat:@"%@%@/\r\n", strPrefix, strFileName]];
                strResult = [strResult stringByAppendingString:[CFileTools enumerationFiles:strFile level:nLevel+1]];
                }
            else
                {
                // 是文件，则获得文件大小，并记录文件全路径并记录到数组中
                numSize = [dicAttributes objectForKey:NSFileSize];
                strResult = [strResult stringByAppendingString:[NSString stringWithFormat:@"%@%@ 修改日期：%@ 大小：%d\r\n", strPrefix, strFileName, [dicAttributes objectForKey:NSFileModificationDate], [numSize intValue]]];
                }
            }
        }
    
    return strResult;
}

#pragma mark 指定的文件是否存在

+ (BOOL)fileExistsAtPath:(NSString *)strFile
{
    return [[NSFileManager defaultManager] fileExistsAtPath:strFile];
}

#pragma mark 指定的文件的大小
+ (unsigned long)fileSize:(NSString*)strFile
{
    if (strFile == nil) return 0;
    NSDictionary * dicAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:strFile error:nil];
    if (dicAttributes == nil) return 0;
    
    // 判断是否路径，若是则检查路径包含所有文件的大小
    NSString * strType = [dicAttributes objectForKey:NSFileType];
    if ([strType isEqualToString:NSFileTypeDirectory])
        {
        return [CFileTools dirSize:strFile];
        }
    
    NSNumber *numSize = [dicAttributes objectForKey:NSFileSize];
    if (numSize == nil) return 0;
    
    return [numSize intValue];
}

+ (NSString*)fileToFileURL:(NSString*)file;
{
    NSString *url = [@"file://localhost" stringByAppendingString:file];
    return [url httpEncoding];
}

+ (NSString*)fileURLTofile:(NSString*)url
{
    NSString *file = nil;
    if ([url hasPrefix:@"file://localhost"])
        {
        file = [url stringByReplacingOccurrencesOfString:@"file://localhost" withString:@""];
        }
    return [file httpDecoding];
}

#pragma mark 将url转换成文件名
+ (NSString *)urlToFileName:(NSString*)strUrl
{
    
    NSString *strFileName = [strUrl stringByReplacingOccurrencesOfString:@"http:" withString:@""];
    
    strFileName = [strFileName stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    strFileName = [strFileName stringByReplacingOccurrencesOfString:@"?" withString:@"_"];
    
    return strFileName;
}

#pragma mark 将数据写入文件
+ (unsigned long)write:(NSData *)data file:(NSString *)strFile
{
    if([CFileTools fileExistsAtPath:strFile] == NO)
        {
        [[NSFileManager defaultManager] createFileAtPath:strFile contents:nil attributes:nil];
        }
    
    FILE *f = fopen([strFile UTF8String], [@"ab+" UTF8String]);
    
    if (f == NULL) return 0;
    
    fseek(f, 0, SEEK_END);
    unsigned long nLength = [data length];
    size_t written = fwrite((const void *)[data bytes], nLength, 1, f);
    fclose(f);
    
    if (written == 0) return 0;
    return nLength;
}


@end
