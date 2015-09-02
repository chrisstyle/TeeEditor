//
//  DesignPhoneShell.h
//  Big
//
//  Created by iOS121 on 1/14/15.
//  Copyright (c) 2015 BlackBox. All rights reserved.
//

#import "TeeDesign.h"

typedef NS_ENUM(NSUInteger, PhoneShellStyle)
{
    kPhoneShellStyleIphone6Rubber,             //橡胶
    kPhoneShellStyleIphone6PlusLeather            //牛皮
};


@interface TeeDesignPhoneShell : TeeDesign<NSCoding>

@property (nonatomic, assign)       PhoneShellStyle     style;      //手机壳材质类型

@end
