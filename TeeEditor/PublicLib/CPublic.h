//
//  CPublic.h
//  Big
//
//  Created by iOS121 on 1/30/15.
//  Copyright (c) 2015 fastquick. All rights reserved.
//

#import <Foundation/Foundation.h>

// 相关宏
#import "PublicDefine.h"

// 界面相关
#import "UIViewExt.h"
#import "PSTAlertController.h"

// 图形图像
#import "UIImage+Ext.h"

// 文件系统
#import "CFileTools.h"

// 数据处理
#import "NSString+CString.h"
#import "NSObject+JSON.h"

// 其他
#import "CApplication.h"

/**
 *  公共库的公共类，公共库的公共功能在此类中实现
 */

@interface CPublic : NSObject

/**
 * 对象空（NSNull）判断
 */
+ (id)nullDetection:(id)obj;


@end
