//
//  CPublic.m
//  Big
//
//  Created by iOS121 on 1/30/15.
//  Copyright (c) 2015 fastquick. All rights reserved.
//

#import "CPublic.h"

@implementation CPublic

// 对象空（NSNull）判断
+ (id)nullDetection:(id)obj
{
    if ([obj isKindOfClass:[NSNull class]])
        {
        return nil;
        }
    
    return obj;
}
@end
