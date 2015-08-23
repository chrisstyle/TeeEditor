//
//  NSObject+JSON.m
//  Big
//
//  Created by chrisstyle on 1/29/15.
//  Copyright (c) 2015 fastquick. All rights reserved.
//

#import "NSObject+JSON.h"

@implementation NSObject (JSON)

+ (id)jsonDecodedWithString:(NSString *)jsonString
{
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
    if (!error) {
        return jsonObject;
    }
    DLog(@"Json error: %@", error);
    return nil;
}

+ (NSString*)jsonEncodedKeyValueString:(id)jsonObj
{
    
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:jsonObj
                                                   options:0 // non-pretty printing
                                                     error:&error];
    if(error)
        DLog(@"JSON Parsing Error: %@", error);
        ;
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end
