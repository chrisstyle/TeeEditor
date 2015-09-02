//
//  TeeUserCenter.h
//  TeeEditor
//
//  Created by iOS121 on 9/2/15.
//  Copyright (c) 2015 fastquick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TeeDesigner.h"

#define KEY_Tee_USER_CENTER                                 @"keyBigUserCenter"
#define KEY_Tee_USER_CENTER_USER_PASSWORD                   @"keyBigUserCenterUserPassword"
#define KEY_Tee_USER_CENTER_PHONE_NUMBER                    @"keyBigUserCenterPhoneNumber"
#define KEY_Tee_USER_CENTER_PHONE_AREA_CODE                 @"keyBigUserCenterPhoneAreaCode"
#define KEY_Tee_USER_CENTER_REMOTE_NOTIFICATION_TOKENT      @"keyBigUserCenterRemoteNotificationToken"

@interface TeeUserCenter : TeeDesigner<NSCoding>

#pragma mark - 用户属性
@property (nonatomic, readonly)     BOOL        isLogined;
@property (nonatomic, copy)         NSString    *userPassword;
@property (nonatomic, copy)         NSString    *phoneNumber;
@property (nonatomic, copy)         NSString    *phoneAreaCode;//手机区号
@property (nonatomic, copy)         NSString    *remoteNotificationToken;
@property (nonatomic, strong)       UIImage     *userImage;


+ (TeeUserCenter *)standardUserCenter;
/**
 *  读取存储在默认用户的数据中得用户信息
 */
- (void)loadCache;

/**
 *  保存用户信息到默认用户数据中
 */
- (void)save;

/**
 *  用户退出
 */
- (void)logOut;

@end
