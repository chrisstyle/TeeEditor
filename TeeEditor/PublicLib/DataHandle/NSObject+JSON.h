//
//  NSObject+JSON.h
//  Big
//
//  Created by chrisstyle on 1/29/15.
//  Copyright (c) 2015 fastquick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JSON)

+ (id)jsonDecodedWithString:(NSString *)jsonString;
+ (NSString*)jsonEncodedKeyValueString:(id)jsonObj;

@end
