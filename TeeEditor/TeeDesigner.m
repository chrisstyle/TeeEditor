//
//  TeeDesigner.m
//  TeeEditor
//
//  Created by iOS121 on 9/2/15.
//  Copyright (c) 2015 fastquick. All rights reserved.
//

#import "TeeDesigner.h"
#import "TeeDesign.h"

@implementation TeeDesigner

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.userId = [aDecoder decodeObjectForKey:KEY_Tee_DESIGNER_USER_ID];
        self.userName = [aDecoder decodeObjectForKey:KEY_Tee_DESIGNER_USER_USERNAME];
        self.displayName = [aDecoder decodeObjectForKey:KEY_Tee_DESIGNER_USER_DISPLAYNAME];
        self.firstName = [aDecoder decodeObjectForKey:KEY_Tee_DESIGNER_USER_FIRSTNAME];
        self.lastName = [aDecoder decodeObjectForKey:KEY_Tee_DESIGNER_USER_LASTNAME];
        self.profileUrlStr = [aDecoder decodeObjectForKey:KEY_Tee_DESIGNER_USER_PROFILE_URLSTR];
        self.descriptionDetail = [aDecoder decodeObjectForKey:KEY_Tee_DESIGNER_USER_DESCRIPTION_DETAIL];
        self.designs = [aDecoder decodeObjectForKey:KEY_Tee_DESIGNER_USER_DESIGNS];
        for (TeeDesign *design in self.designs) {
            design.designer = self;
        }
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.userId forKey:KEY_Tee_DESIGNER_USER_ID];
    [aCoder encodeObject:self.userName forKey:KEY_Tee_DESIGNER_USER_USERNAME];
    [aCoder encodeObject:self.displayName forKey:KEY_Tee_DESIGNER_USER_DISPLAYNAME];
    [aCoder encodeObject:self.firstName forKey:KEY_Tee_DESIGNER_USER_FIRSTNAME];
    [aCoder encodeObject:self.lastName forKey:KEY_Tee_DESIGNER_USER_LASTNAME];
    [aCoder encodeObject:self.profileUrlStr forKey:KEY_Tee_DESIGNER_USER_PROFILE_URLSTR];
    [aCoder encodeObject:self.descriptionDetail forKey:KEY_Tee_DESIGNER_USER_DESCRIPTION_DETAIL];
    [aCoder encodeObject:self.designs forKey:KEY_Tee_DESIGNER_USER_DESIGNS];
}


@end
