//
//  CApplication.m
//  Big
//
//  Created by iOS121 on 1/30/15.
//  Copyright (c) 2015 fastquick. All rights reserved.
//

#import "CApplication.h"

@implementation CApplication

#pragma mark 从用户默认数据获得对象
+ (id)loadFromUserDefault:(NSString*)strKey
{
    @try
    {
    return [[NSUserDefaults standardUserDefaults] objectForKey:strKey];
    }
    @catch (NSException *exception)
    {
    }
    return nil;
}

#pragma mark 从用户默认数据获得自定义对象
+ (id)loadObjectFromUserDefault:(NSString*)strKey
{
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:strKey];
    if (data == nil) return nil;
    
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

#pragma mark 保存对象到用户默认数据
+ (void)saveToUserDefault:(id)object key:(NSString*)strKey
{
    @try
    {
    [[NSUserDefaults standardUserDefaults] setObject:object forKey:strKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    }
    @catch (NSException *exception)
    {
    }
}

#pragma mark 保存自定义对象到用户默认数据
+ (void)saveObjectToUserDefault:(id)object key:(NSString*)strKey
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:
                    object];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:strKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


#pragma mark 应用主窗口
+ (UIWindow*)mainWindow
{
    NSArray *windows = [UIApplication sharedApplication].windows;
    if (windows.count == 0) return nil;
    
    return [windows objectAtIndex:0];
}

#pragma mark 应用主试图控制器
+ (UIViewController*)mainViewController
{
    return [CApplication mainWindow].rootViewController;
}

#pragma mark 注册远程推送通知
+ (void)remoteNotificationRegister:(BOOL)bRegister
{
    [[UIApplication sharedApplication] unregisterForRemoteNotifications];
    if (bRegister)
        {
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound];
        }
}

#pragma mark 从系统返回的远程推送通知数据中获得令牌
+ (NSString*)remoteNotificationTokenWithData:(NSData*)deviceToken
{
    NSString *inDeviceTokenStr = [deviceToken description];
    NSString *tokenString = [inDeviceTokenStr stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"< >"]];
    tokenString = [tokenString stringByReplacingOccurrencesOfString:@" " withString:@""];
    return tokenString;
}
@end
