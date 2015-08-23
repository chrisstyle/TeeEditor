//
//  UIColor+CColor.h
//  Big
//
//  Created by chrisstyle on 1/30/15.
//  Copyright (c) 2015 fastquick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CColor)

@property (nonatomic, readonly) NSString* hexString;

//字符串转颜色
+ (UIColor*)colorWithHexString:(NSString*)strColor;

#pragma mark - 方法

#pragma mark 获得颜色的色度、彩度、亮度信息
- (void)hue:(CGFloat *)hue saturation:(CGFloat *)saturation brightness:(CGFloat *)brightness alpha:(CGFloat *)alpha;

@end
