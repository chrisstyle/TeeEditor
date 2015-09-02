//
//  CApplication.h
//  Big
//
//  Created by iOS121 on 1/30/15.
//  Copyright (c) 2015 fastquick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CApplication : NSObject

/**
 *  应用主窗口
 */
+ (UIWindow*)mainWindow;

/**
 *  应用主试图控制器
 */
+ (UIViewController*)mainViewController;

/**
 *  应用主试图控制器
 */
+ (void)remoteNotificationRegister:(BOOL)bRegister;

/**
 *  从系统返回的远程推送通知数据中获得令牌
 */
+ (NSString*)remoteNotificationTokenWithData:(NSData*)deviceToken;

#pragma mark - NSUserDefault
/**
 *  从用户默认数据获得对象
 */
+ (id)loadFromUserDefault:(NSString*)strKey;

/**
 *  从用户默认数据获得自定义对象
 */
+ (id)loadObjectFromUserDefault:(NSString*)strKey;

/**
 *  保存对象到用户默认数据
 */
+ (void)saveToUserDefault:(id)object key:(NSString*)strKey;

/**
 *  保存自定义对象到用户默认数据
 */
+ (void)saveObjectToUserDefault:(id)object key:(NSString*)strKey;

@end
