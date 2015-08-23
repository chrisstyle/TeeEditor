//
//  CFileTools.h
//  Big
//
//  Created by chrisstyle on 1/30/15.
//  Copyright (c) 2015 fastquick. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - 文件系统助手类

@interface CFileTools : NSObject

#pragma mark 获得app的缓存路径
+ (NSString*)appCachePath;

#pragma mark 获得app的文档路径
+ (NSString*)appDocumentPath;

#pragma mark － 路径相关

#pragma mark 指定路径包含文件的大小总和
+ (unsigned long)dirSize:(NSString*)strDir;

#pragma mark 容量的字符串表示
+ (NSString*)stringWithSize:(unsigned long)nSize;

#pragma mark - 文件夹相关

#pragma mark 清理指定目录下的所有文件
+ (void)pathClear:(NSString*)strPath;

#pragma mark 文件夹是否存在
+ (BOOL)pathExists:(NSString *)strPath;

#pragma mark 文件夹是否存在，若不存在则创建
+ (BOOL)pathExistsWithCreate:(NSString *)strPath;

#pragma mark - 路径添加反斜杠
+ (NSString*)pathBackslash:(NSString*)strPath;

#pragma mark － 文件相关

#pragma mark 枚举指定位置的所有文件，包括子文件夹
+ (NSString*)enumerationFiles:(NSString*)strPath;

#pragma mark 指定的文件是否存在
+ (BOOL)fileExistsAtPath:(NSString *)strFile;

#pragma mark 指定的文件的大小
+ (unsigned long)fileSize:(NSString*)strFile;

+ (NSString*)fileToFileURL:(NSString*)file;

+ (NSString*)fileURLTofile:(NSString*)url;

#pragma mark 将url转换成文件名
+ (NSString *)urlToFileName:(NSString*)strUrl;

#pragma mark 将数据写入文件，返回写入的数据的长度
+ (unsigned long)write:(NSData *)data file:(NSString *)strFile;
@end
