//
//  DesignClothes.m
//  Big
//
//  Created by iOS121 on 1/14/15.
//  Copyright (c) 2015 BlackBox. All rights reserved.
//

#import "TeeDesignClothes.h"

@implementation TeeDesignClothes

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.transform = CGAffineTransformIdentity;
        self.brightness = 0;
        self.contrast = 1;
        self.saturation = 1;
    }
    return self;
}

- (instancetype)initWithJsonDict:(NSDictionary *)dict
{
    if (![dict isKindOfClass:[NSDictionary class]] || dict.count == 0) {
        return nil;
    }
    self = [super init];
    if (self) {
        self.transform = CGAffineTransformIdentity;
        self.brightness = 0;
        self.contrast = 1;
        self.saturation = 1;
        self.color = [dict[@"color"]integerValue];
        self.dId = [NSString stringWithFormat:@"%ld", (long)[dict[@"id"] integerValue]];
        if ([self.dId isEqualToString:[TeeUserCenter standardUserCenter].userId]) {
            self.designer = [TeeUserCenter standardUserCenter];
        }
        self.designerId = [NSString stringWithFormat:@"%ld", (long)[dict[@"uid"] integerValue]];
        self.captureCanvasImageId = [NSString stringWithFormat:@"%ld", (long)[dict[@"pic"] integerValue]];
        self.captureCanvasImageUrlStr = dict[@"picpath"];
        self.canvasImageUrlStr = dict[@"original_picpath"];
        self.canvasImageId = [NSString stringWithFormat:@"%ld", (long)[dict[@"original_pic"] integerValue]];
        if (!dict[@"style"] || ![dict[@"style"] nonempty]) {
            self.style = kClothesStyleManTshirt;
        } else {
            self.style = [dict[@"style"]integerValue];
        }
        self.allowSell = [dict[@"allowSell"]boolValue];
        self.redesignEnabled = [dict[@"redesignEnabled"]boolValue];
        self.shapeType = kCanvasShapeTypeOriginal;
        

    }
    return self;
}

- (DesignCategory)designType
{
    return kDesignCategoryClothes;
}

- (void)setupDefaultParams
{
    [super setupDefaultParams];
    self.style = kClothesStyleManTshirt;
    self.color = kClothesColorWhite;
    self.shapeType = kCanvasShapeTypeOriginal;
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.shapeType = [[aDecoder decodeObjectForKey:@"CanvasShapeType"]integerValue];
        self.style = [[aDecoder decodeObjectForKey:@"ClothesStyle"]integerValue];
        self.color = [[aDecoder decodeObjectForKey:@"ClothesColor"]integerValue];
        self.transform = CGAffineTransformIdentity;
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:@(self.shapeType) forKey:@"CanvasShapeType"];
    [aCoder encodeObject:@(self.style) forKey:@"ClothesStyle"];
    [aCoder encodeObject:@(self.color) forKey:@"ClothesColor"];

}
@end
