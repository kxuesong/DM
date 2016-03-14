//
//  NSDictionary+StringValue.m
//  DM
//
//  Created by tepusoft on 15/12/30.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import "NSDictionary+StringValue.h"

@implementation NSDictionary (StringValue)

-(NSString *)stringValueForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [NSString stringWithFormat:@"%@",value];
    }else if([value isKindOfClass:[NSString class]]){
        return value;
    }else {
        return @"";
    }
}

@end
