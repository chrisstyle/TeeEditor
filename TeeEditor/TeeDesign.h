//
//  Design.h
//  Big
//
//  Created by iOS121 on 1/14/15.
//  Copyright (c) 2015 BlackBox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TeeDesigner.h"


typedef NS_ENUM(NSInteger, DesignCategory)
{
    kDesignCategoryNone = 0,
    kDesignCategoryClothes = 1,          // 衣服
    kDesignCategoryPhoneShell = 2,       // 手机壳
};

@class DesignPhoneShell, DesignClothes;
@interface TeeDesign : NSObject<NSCoding>

@property (nonatomic, readonly)   DesignCategory     designType;
@property (nonatomic, copy)       NSString          *dId;                   // 作品ID
@property (nonatomic, copy)       NSString          *designerId;            // 设计师ID // NSCoding
@property (nonatomic, weak)       TeeDesigner       *designer;              // 不进入NSCoding
@property (nonatomic, assign)     BOOL               allowSell;
@property (nonatomic, assign)     BOOL               redesignEnabled;
@property (nonatomic, copy)       NSString          *detail;                //描述                 //optional

@property (nonatomic, strong)     UIImage           *originalImage;
@property (nonatomic, copy)       UIImage           *canvasImage;           //设计后的图片, 上传用于重新设计
//上传到服务器
@property (nonatomic, copy)       NSString          *canvasImageUrlStr;     //编辑后图案地址, 可能用于重新设计，也可能使用原图
@property (nonatomic, copy)       NSString          *canvasImageId;      //编辑后图案地址, 可能用于重新设计，也可能使用原图

@property (nonatomic, copy)       NSString          *captureCanvasImageUrlStr;    //截屏设计图片      用作打印&展示使用
@property (nonatomic, copy)       UIImage           *captureCanvasImage;    //截屏设计图片      用作打印&编辑使用
@property (nonatomic, copy)       NSString          *captureCanvasImageId;  //服务器返回的截屏图片ID
@property (nonatomic, copy)       UIImage           *captureThumbnailImage; //截屏设计页面的图片 用作展示使用
@property (nonatomic, copy)       NSString          *captureThumbnailImageId;  //服务器返回
@property (nonatomic, copy)       NSString          *captureThumbnailImageUrlStr;//设计展示用的图片地址，包含衣服背景
@property (nonatomic, copy)       NSString          *originalImageUrlStr;   //原图地址              //optional, 可能使用canvasImage，没有mask的图片用于重新设计，或者使用原图重新设计

// override
- (void)setupDefaultParams;

@end
