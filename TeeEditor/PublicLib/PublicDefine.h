//
//  PublicDefine.h
//  Big
//
//  Created by chrisstyle on 1/30/15.
//  Copyright (c) 2015 fastquick. All rights reserved.
//

#ifndef Big_PublicDefine_h
#define Big_PublicDefine_h

#define NULL_OBJECT [NSNull null]

#pragma mark - 应用相关宏定义

#define ISIOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

#define BigAppdelegate ((AppDelegate *)([[UIApplication sharedApplication]delegate]))
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kScreenStatusBarHeight ([UIApplication sharedApplication].statusBarFrame.size.height)
#pragma mark 获得应用版本号

#define APP_DISPLAY_NAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]

#ifdef DEBUG
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#else
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#endif

#define APP_BUNDLE_ID [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]

#define APP_STORE_URL(theAppID) [NSString stringWithFormat: @"https://itunes.apple.com/us/app/id%@", theAppID]

#pragma mark - 线程相关宏定义

#pragma mark 线程开始，结束

#pragma mark - 结束后台执行任务
#define BACKGROUND_TASK_CANCEL(taskID) if (taskID != UIBackgroundTaskInvalid) \
{ dispatch_async(dispatch_get_main_queue(), ^{\
[[UIApplication sharedApplication] endBackgroundTask:taskID];\
taskID = UIBackgroundTaskInvalid; }); }

#pragma mark - 申请后台执行
#define BACKGROUND_TASK_WITH_EXPIRATION_HANDLER(taskID) taskID = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{ BACKGROUND_TASK_CANCEL(taskID); }];

/*
 priority 值如下：
 
 DISPATCH_QUEUE_PRIORITY_HIGH        2
 DISPATCH_QUEUE_PRIORITY_DEFAULT     0
 DISPATCH_QUEUE_PRIORITY_LOW         (-2)
 DISPATCH_QUEUE_PRIORITY_BACKGROUND  INT16_MIN
 */
#define THREAD_PROCESS_BEGIN(priority) dispatch_async(dispatch_get_global_queue(priority, 0), ^{
#define THREAD_PROCESS_END     })


// 主线程开始，结束
#define MAIN_THREAD_PROCESS_BEGIN   dispatch_async(dispatch_get_main_queue(), ^{
#define MAIN_THREAD_SYNC_PROCESS_BEGIN   dispatch_sync(dispatch_get_main_queue(), ^{
#define MAIN_THREAD_PROCESS_END     })


#pragma mark - 网络相关宏定义

#pragma mark 网络活动指示器（ios设备状态栏上）

#define NETWORK_ACTIVITY_INDICATOR_VISIBLE  [UIApplication sharedApplication].networkActivityIndicatorVisible = YES; @try{

#define NETWORK_ACTIVITY_INDICATOR_HIDDEN  }@finally{[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;}



#pragma mark - 调试相关宏定义

#pragma mark 调试输出NSLog，在release模式下这些代码不会生成

#ifdef DEBUG
#define LOG(format, ...) NSLog(format, ## __VA_ARGS__)
#else
#define LOG(format, ...)

#endif

#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define DLog(...)
#endif

#pragma mark - 界面相关相关宏定义

#define DEGREES_TO_RADIANS(x) (M_PI * (x) / 180.0)

#pragma mark - 字符串相关宏
#define L(x) NSLocalizedString(x, @"")

#pragma mark 系统预定高宽定义

#define TITLE_HEIGHT        44
#define TOOLBAR_HEIGHT      44
#define TABLEBAR_HEIGHT     49
#define STATUSBAR_HEIGHT    20

#pragma mark - 字符串定义

#define STRING_NO_NETWORK       L(@"检测不到网络！")


#endif
