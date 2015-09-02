//
//  Design.m
//  Big
//
//  Created by iOS121 on 1/14/15.
//  Copyright (c) 2015 BlackBox. All rights reserved.
//

#import "TeeDesign.h"
#import "TeeDesignPhoneShell.h"
#import "TeeDesignClothes.h"
#import <SDWebImage/SDWebImageManager.h>

@implementation TeeDesign

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupDefaultParams];
    }
    return self;
}

- (void)setupDefaultParams
{
    self.allowSell = YES;
    self.redesignEnabled = YES;
}

- (DesignCategory)designType
{
    return kDesignCategoryNone;
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.dId = [aDecoder decodeObjectForKey:@"designId"];
        self.designerId = [aDecoder decodeObjectForKey:@"designerId"];
        self.allowSell = [[aDecoder decodeObjectForKey:@"allowSell"]boolValue];
        self.redesignEnabled = [[aDecoder decodeObjectForKey:@"redesignEnabled"]boolValue];
        self.detail = [aDecoder decodeObjectForKey:@"detail"];

        self.canvasImageUrlStr = [aDecoder decodeObjectForKey:@"canvasImageUrlStr"];
        self.originalImageUrlStr = [aDecoder decodeObjectForKey:@"originalImageUrlStr"];
        self.captureCanvasImageUrlStr = [aDecoder decodeObjectForKey:@"captureCanvasImageUrlStr"];
        self.captureCanvasImageId = [aDecoder decodeObjectForKey:@"captureCanvasImageId"];
        self.canvasImageId = [aDecoder decodeObjectForKey:@"canvasImageId"];

        self.captureThumbnailImageId = [aDecoder decodeObjectForKey:@"captureThumbnailImageId"];
        self.captureThumbnailImageUrlStr = [aDecoder decodeObjectForKey:@"captureThumbnailImageUrlStr"];
        
        if (self.canvasImageUrlStr.nonempty) {
            [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:self.canvasImageUrlStr] options:SDWebImageHighPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                self.canvasImage = image;
                self.originalImage = image;
            }];
        }
#warning 可能使用原图
        if (self.originalImageUrlStr.nonempty) {
            [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:self.canvasImageUrlStr] options:SDWebImageHighPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                self.originalImage = image;
            }];
        }
        if (self.captureThumbnailImageUrlStr) {
            [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:self.canvasImageUrlStr] options:SDWebImageHighPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                self.captureThumbnailImage = image;
            }];
        }
        if (self.captureCanvasImageUrlStr) {
            [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:self.captureCanvasImageUrlStr] options:SDWebImageHighPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                self.captureCanvasImage = image;
            }];
        }
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.dId forKey:@"designId"];
    [aCoder encodeObject:self.designerId forKey:@"designerId"];
    [aCoder encodeObject:@(self.allowSell) forKey:@"allowSell"];
    [aCoder encodeObject:@(self.redesignEnabled) forKey:@"redesignEnabled"];
    [aCoder encodeObject:self.detail forKey:@"detail"];
    [aCoder encodeObject:self.canvasImageUrlStr forKey:@"canvasImageUrlStr"];
    [aCoder encodeObject:self.canvasImageId forKey:@"canvasImageId"];
    [aCoder encodeObject:self.captureCanvasImageUrlStr forKey:@"captureCanvasImageUrlStr"];

    [aCoder encodeObject:self.originalImageUrlStr forKey:@"originalImageUrlStr"];
    [aCoder encodeObject:self.captureCanvasImageId forKey:@"captureCanvasImageId"];
    [aCoder encodeObject:self.captureThumbnailImageId forKey:@"captureThumbnailImageId"];
    [aCoder encodeObject:self.captureThumbnailImageUrlStr forKey:@"captureThumbnailImageUrlStr"];

}
@end
