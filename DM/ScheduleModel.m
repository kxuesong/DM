//
//  ScheduleModel.m
//  DM
//
//  Created by tepusoft on 16/1/10.
//  Copyright © 2016年 tepusoft. All rights reserved.
//
#import "NSDictionary+StringValue.h"
#import "ScheduleModel.h"

@implementation ScheduleModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.companyid = [dictionary stringValueForKey:@"companyid"];
        self.Id = [dictionary stringValueForKey:@"id"];
        self.year = [dictionary stringValueForKey:@"year"];
        self.yearperiods = [dictionary stringValueForKey:@"yearperiods"];
        self.allperiods = [dictionary stringValueForKey:@"allperiods"];
        self.releasetime = [dictionary stringValueForKey:@"releasetime"];
        self.stoptime = [dictionary stringValueForKey:@"stoptime"];
        self.y = [dictionary stringValueForKey:@"y"];
        self.m = [dictionary stringValueForKey:@"m"];
        self.name = [dictionary stringValueForKey:@"name"];
        self.ispublish = [dictionary stringValueForKey:@"ispublish"];
    }
    return self;
}

@end
