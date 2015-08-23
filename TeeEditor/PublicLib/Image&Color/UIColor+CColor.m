//
//  UIColor+CColor.m
//  Big
//
//  Created by chrisstyle on 1/30/15.
//  Copyright (c) 2015 fastquick. All rights reserved.
//

#import "PublicDefine.h"
#import "NSString+CString.h"
#import "UIColor+CColor.h"

static void RGBtoHSV( CGFloat r, CGFloat g, CGFloat b, CGFloat *h, CGFloat *s, CGFloat *v )
{
    float min, max, delta;
    min = MIN(r, MIN(g, b));
    max = MAX(r, MAX(g, b));
    *v = max;
    delta = max - min;
    if( max != 0 )
        {
        *s = delta / max;
        }
    else
        {
        // r = g = b = 0        // s = 0, v is undefined
        *s = 0;
        *h = -1;
        return;
        }
    
    if( r == max )
        {
        *h = ( g - b ) / delta;     // between yellow & magenta
        }
    else if( g == max )
        {
        *h = 2 + ( b - r ) / delta; // between cyan & yellow
        }
    else
        {
        *h = 4 + ( r - g ) / delta; // between magenta & cyan
        }
    
    *h *= 60;               // degrees
    if( *h < 0 ) *h += 360;
}

//static void HSVtoRGB( float *r, float *g, float *b, float h, float s, float v )
//{
//    int i;
//    float f, p, q, t;
//    if( s == 0 )
//        {
//        // achromatic (grey)
//        *r = *g = *b = v;
//        return;
//        }
//    
//    h /= 60;            // sector 0 to 5
//    i = floor( h );
//    f = h - i;          // factorial part of h
//    p = v * ( 1 - s );
//    q = v * ( 1 - s * f );
//    t = v * ( 1 - s * ( 1 - f ) );
//    switch( i )
//    {
//        case 0:
//        *r = v;
//        *g = t;
//        *b = p;
//        break;
//        
//        case 1:
//        *r = q;
//        *g = v;
//        *b = p;
//        break;
//        
//        case 2:
//        *r = p;
//        *g = v;
//        *b = t;
//        break;
//        
//        case 3:
//        *r = p;
//        *g = q;
//        *b = v;
//        break;
//        
//        case 4:
//        *r = t;
//        *g = p;
//        *b = v;
//        break;
//        
//        default:        // case 5:
//        *r = v;
//        *g = p;
//        *b = q;
//        break;
//    }
//}


@implementation UIColor (CColor)

@dynamic hexString;

//字符串转颜色
+ (UIColor*)colorWithHexString:(NSString*)strColor
{
    if (!strColor.nonempty) return nil;
    NSString *strProcess = [[strColor stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    
    if ([strProcess length] < 6)
        return [UIColor whiteColor];
    if ([strProcess hasPrefix:@"#"])
        strProcess = [strProcess substringFromIndex:1];
    if ([strProcess length] != 6)
        return [UIColor whiteColor];
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *strRed = [strProcess substringWithRange:range];
    
    range.location = 2;
    NSString *strGreen = [strProcess substringWithRange:range];
    
    range.location = 4;
    NSString *strBlue = [strProcess substringWithRange:range];
    
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:strRed] scanHexInt:&r];
    [[NSScanner scannerWithString:strGreen] scanHexInt:&g];
    [[NSScanner scannerWithString:strBlue] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

//颜色转字符串
- (NSString*)hexString
{
    CGColorRef color = self.CGColor;
    size_t n = CGColorGetNumberOfComponents(color);
    const CGFloat *cs = CGColorGetComponents(color);
    
    NSString *r = @"FF", *g = @"FF", *b = @"FF";
    if (n == 2)
        {
        r = [NSString stringWithFormat:@"%.2X", (int)(cs[0]*255)];
        g = r;
        b = r;
        }
    else if (n >= 3)
        {
        r = [NSString stringWithFormat:@"%.2X", (int)(cs[0]*255)];
        g = [NSString stringWithFormat:@"%.2X", (int)(cs[1]*255)];
        b = [NSString stringWithFormat:@"%.2X", (int)(cs[2]*255)];
        }
    
    return [NSString stringWithFormat:@"#%@%@%@",r,g,b];
}

#pragma mark 获得颜色的色度、彩度、亮度信息
- (void)hue:(CGFloat *)hue saturation:(CGFloat *)saturation brightness:(CGFloat *)brightness alpha:(CGFloat *)alpha
{
    CGColorRef color = self.CGColor;
    size_t n = CGColorGetNumberOfComponents(color);
    const CGFloat *cs = CGColorGetComponents(color);
    CGFloat r = 0, g = 0, b = 0, a = 1;
    if (n == 2)
        {
        r = cs[0];
        g = r;
        b = r;
        a = cs[1];
        }
    else if (n >= 3)
        {
        r = cs[0];
        g = cs[1];
        b = cs[2];
        a = cs[3];
        }
    
    *alpha = a;
    RGBtoHSV(r, g, b, hue, saturation, brightness);
}

@end