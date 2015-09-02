//
//  DesignClothes.h
//  Big
//
//  Created by iOS121 on 1/14/15.
//  Copyright (c) 2015 BlackBox. All rights reserved.
//

#import "TeeDesign.h"

typedef NS_ENUM(NSUInteger, CanvasShapeType)
{
    kCanvasShapeTypeOriginal     = 1,           //原始
    kCanvasShapeTypeCircle       = 2,           //圆形
    kCanvasShapeTypeStar         = 3,           //五角星
    kCanvasShapeTypeSquare       = 4,           //正方形
    kCanvasShapeTypeTriangle     = 5,           //三角形
    kCanvasShapeTypeScary        = 6,           // keep calm
    kCanvasShapeTypeCat          = 7,           //cat
    kCanvasShapeTypeILU          = 8,           // I love you
    kCanvasShapeHalloween        = 9,           // halloween
    
};

typedef NS_ENUM(NSUInteger, ClothesStyle)
{
    kClothesStyleManTshirt = 1,              //T恤-男
    kClothesStyleManVest,                    //背心-男
    kClothesStyleWomanTshirt,                //T恤- 女
    kClothesStyleManSweatshirt,              //圆领运动衫（长袖）- 男
    kClothesStyleWomanPolyCotton,            //Poly衫       - 女
    kClothesStyleKidTshirt,                  //T恤 -儿童
};

typedef NS_ENUM(NSUInteger, ClothesColor)     //衣服颜色
{
    kClothesColorWhite = 1,
    kClothesStyleBlack,
};

@interface TeeDesignClothes : TeeDesign<NSCoding>

@property (nonatomic)             CGAffineTransform  transform;// 图片变换
@property (nonatomic, assign)     CGFloat            brightness;//亮度，对比度，饱和度
@property (nonatomic, assign)     CGFloat            contrast;
@property (nonatomic, assign)     CGFloat            saturation;

@property (nonatomic, assign)     CanvasShapeType    shapeType;                     //图案形状
@property (nonatomic, assign)     ClothesStyle       style;                         //衣服类型
@property (nonatomic, assign)     ClothesColor       color;                         //衣服颜色

- (instancetype)initWithJsonDict:(NSDictionary *)dict;

@end
