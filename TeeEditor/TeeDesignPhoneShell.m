//
//  DesignPhoneShell.m
//  Big
//
//  Created by iOS121 on 1/14/15.
//  Copyright (c) 2015 BlackBox. All rights reserved.
//

#import "TeeDesignPhoneShell.h"

@implementation TeeDesignPhoneShell

- (DesignCategory)designType
{
    return kDesignCategoryPhoneShell;
}


#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
       self.style = [[aDecoder decodeObjectForKey:@"PhoneShellStyle"]integerValue];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:@(self.style) forKey:@"PhoneShellStyle"];
    
}
@end
