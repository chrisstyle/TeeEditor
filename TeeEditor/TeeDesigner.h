//
//  TeeDesigner.h
//  TeeEditor
//
//  Created by iOS121 on 9/2/15.
//  Copyright (c) 2015 fastquick. All rights reserved.
//

#import <Foundation/Foundation.h>

#define KEY_Tee_DESIGNER_USER_ID                        @"keyBigDesignUserID"
#define KEY_Tee_DESIGNER_USER_USERNAME                  @"keyBigDesignUserName"
#define KEY_Tee_DESIGNER_USER_DISPLAYNAME               @"keyBigDesignUserDisplayName"
#define KEY_Tee_DESIGNER_USER_FIRSTNAME                 @"keyBigDesignUserFirstName"
#define KEY_Tee_DESIGNER_USER_LASTNAME                  @"keyBigDesignUserLastName"
#define KEY_Tee_DESIGNER_USER_PROFILE_URLSTR            @"keyBigDesignUserProfileUrlStr"
#define KEY_Tee_DESIGNER_USER_DESCRIPTION_DETAIL        @"keyBigDesignUserDescriptionDetail"
//#define KEY_Tee_DESIGNER_USER_DESIGN_COUNT              @"keyBigDesignUserDesignCount"
#define KEY_Tee_DESIGNER_USER_DESIGNS                   @"keyBigDesignUserDesigns"


@interface TeeDesigner : NSObject<NSCoding>

@property (nonatomic, copy)     NSString        *userId;
@property (nonatomic, copy)     NSString        *userName;
@property (nonatomic, copy)     NSString        *displayName;
@property (nonatomic, copy)     NSString        *firstName;
@property (nonatomic, copy)     NSString        *lastName;
@property (nonatomic, copy)     NSString        *profileUrlStr;
@property (nonatomic, copy)     NSString        *descriptionDetail;     // 自我描述

@property (nonatomic, strong)   NSArray         *designs;               //设计作品

@end