//
//  OffLinePublicModel.m
//  DM
//
//  Created by tepusoft on 16/1/7.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import "OffLinePublicModel.h"
#import "NSDictionary+StringValue.h"
@implementation OffLinePublicModel


-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.orderno = [dictionary stringValueForKey:@"orderno"];
        self.status = [dictionary stringValueForKey:@"status"];
        self.statusflag = [dictionary stringValueForKey:@"statusflag"];
        self.Id = [dictionary stringValueForKey:@"id"];
        self.userid = [dictionary stringValueForKey:@"userid"];
        self.companyid = [dictionary stringValueForKey:@"companyid"];
        self.companyname = [dictionary stringValueForKey:@"companyname"];
        self.areaid = [dictionary stringValueForKey:@"areaid"];
        self.areaname = [dictionary stringValueForKey:@"areaname"];
        self.rootid = [dictionary stringValueForKey:@"rootid"];
        self.parentids = [dictionary stringValueForKey:@"parentids"];
        self.channelid = [dictionary stringValueForKey:@"channelid"];
        self.channelname = [dictionary stringValueForKey:@"channelname"];
        self.isfinish = [dictionary stringValueForKey:@"isfinish"];
        self.releasetime = [dictionary stringValueForKey:@"releasetime"];
        self.title = [dictionary stringValueForKey:@"title"];
        self.desc = [dictionary stringValueForKey:@"desc"];
        self.gongsi = [dictionary stringValueForKey:@"gongsi"];
        self.imageurl = [dictionary stringValueForKey:@"imageurl"];
        self.infotype = [dictionary stringValueForKey:@"infotype"];
        self.personname = [dictionary stringValueForKey:@"personname"];
        self.personphone = [dictionary stringValueForKey:@"personphone"];
        self.imagesList = [dictionary objectForKey:@"imagesList"];
        self.year = [dictionary stringValueForKey:@"year"];
        self.salary = [dictionary stringValueForKey:@"salary"];
        self.edu = [dictionary stringValueForKey:@"edu"];
        self.num = [dictionary stringValueForKey:@"num"];
        self.age = [dictionary stringValueForKey:@"age"];
        self.place = [dictionary stringValueForKey:@"place"];
        self.estate = [dictionary stringValueForKey:@"estate"];
        self.numshi = [dictionary stringValueForKey:@"numshi"];
        self.numting = [dictionary stringValueForKey:@"numting"];
        self.numwei = [dictionary stringValueForKey:@"numwei"];
        self.measure = [dictionary stringValueForKey:@"measure"];
        self.sheshi = [dictionary stringValueForKey:@"sheshi"];
        self.numlou = [dictionary stringValueForKey:@"numlou"];
        self.numall = [dictionary stringValueForKey:@"numall"];
        self.ispersonal = [dictionary stringValueForKey:@"ispersonal"];
        self.money = [dictionary stringValueForKey:@"money"];
        self.qq = [dictionary stringValueForKey:@"qq"];
        self.usage = [dictionary stringValueForKey:@"usage"];
        self.color = [dictionary stringValueForKey:@"color"];
        self.mode = [dictionary stringValueForKey:@"mode"];
    }
    return self;
}

@end
