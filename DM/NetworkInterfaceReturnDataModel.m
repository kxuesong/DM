//
//  NetworkInterfaceReturnDataModel.m
//  DM
//
//  Created by tepusoft on 15/12/28.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import "NetworkInterfaceReturnDataModel.h"
#import "NSDictionary+StringValue.h"

@implementation NetworkInterfaceReturnDataModel

-(instancetype)initWithDictionary:(NSDictionary *)dictrionary
{
    self.status = [((NSNumber *)[dictrionary objectForKey:@"status"]) integerValue];
    self.message = [dictrionary stringValueForKey:@"message"];
    self.data = [dictrionary objectForKey:@"data"];
    return self;
}

@end
