/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook, 3.0 Edition
 BSD License, Use at your own risk
 */

#import <UIKit/UIKit.h>

CGPoint CGRectGetCenter(CGRect rect);
CGRect  CGRectMoveToCenter(CGRect rect, CGPoint center);

@interface UIView (ViewFrameGeometry)
@property CGPoint origin;
@property CGSize size;

@property (readonly) CGPoint viewBottomLeft;
@property (readonly) CGPoint viewBottomRight;
@property (readonly) CGPoint viewTopRight;

@property CGFloat viewHeight;
@property CGFloat viewWidth;

@property CGFloat viewTop;
@property CGFloat viewLeft;

@property CGFloat viewBottom;
@property CGFloat viewRight;

- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;
@end