//
//  UIImage+Ext.h
//  Big
//
//  Created by iOS121 on 1/14/15.
//  Copyright (c) 2015 fastquick. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ImageFormatType)
{
    ImageFormatTypePNG,
    ImageFormatTypeJPG,
};

@interface UIImage (Ext)

+ (UIImage*)fastImageWithData:(NSData*)data;
+ (UIImage*)fastImageWithContentsOfFile:(NSString*)path;

- (UIImage*)scaleRatio:(CGFloat)ratio;

#pragma mark UIView截图
+ (UIImage*)captureView:(UIView *)theView;
+ (UIImage*)captureView:(UIView *)theView cRect:(CGRect)rect;

+ (UIImage *)imageWithColor:(UIColor*)color size:(CGSize)size;

- (UIImage*)deepCopy;

- (UIImage*)grayScaleImage;

- (UIImage*)resize:(CGSize)size;
- (UIImage*)aspectFit:(CGSize)size;
- (UIImage*)aspectFill:(CGSize)size;
- (UIImage*)aspectFill:(CGSize)size offset:(CGFloat)offset;

- (UIImage*)crop:(CGRect)rect;

- (UIImage*)maskedImage:(UIImage*)maskImage;

- (UIImage*)gaussBlur:(CGFloat)blurLevel;       //  {blurLevel | 0 ≤ t ≤ 1}

/**
 *  还原图片方向
 *
 */
- (UIImage *)fixOrientation;

@end
