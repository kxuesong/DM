//
//  RecruitmentAdversModel.m
//  DM
//
//  Created by tepusoft on 16/1/5.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import "RecruitmentAdversModel.h"
#import "NSDictionary+StringValue.h"

@implementation RecruitmentAdversModel


-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _orderNo = [dictionary objectForKey:@"orderno"];
        _status = [dictionary objectForKey:@"status"];
        _statusFlag = [dictionary objectForKey:@"statusflag"];
        _Id = [dictionary objectForKey:@"id"];
        _userId = [dictionary objectForKey:@"userid"];
        _companyId = [dictionary objectForKey:@"companyid"];
        _companyName = [dictionary objectForKey:@"companyname"];
        _areaId = [dictionary objectForKey:@"areaid"];
        _areaName = [dictionary objectForKey:@"areaname"];
        _rootId = [dictionary objectForKey:@"rootid"];
        _parentIds = [dictionary objectForKey:@"parentids"];
        _channelId = [dictionary objectForKey:@"channelid"];
        _channelName = [dictionary objectForKey:@"channelname"];
        _isFinish = [dictionary objectForKey:@"isfinish"];
        _releaseTime = [dictionary objectForKey:@"releasetime"];
        _title = [dictionary objectForKey:@"title"];
        _desc = [dictionary objectForKey:@"desc"];
        _gongsi = [dictionary objectForKey:@"gongsi"];
        _imageURL = [dictionary objectForKey:@"imageurl"];
        _infoType = [dictionary objectForKey:@"infotype"];
        _personName = [dictionary objectForKey:@"personname"];
        _personPhone = [dictionary objectForKey:@"personphone"];
        _imagesList = [dictionary objectForKey:@"imagesList"];
        _year = [dictionary objectForKey:@"year"];
        _salary = [dictionary objectForKey:@"salary"];
        _edu = [dictionary objectForKey:@"edu"];
        _num = [dictionary objectForKey:@"num"];
        _age = [dictionary objectForKey:@"age"];
        _place = [dictionary objectForKey:@"place"];
        _estate = [dictionary objectForKey:@"estate"];
        _numshi = [dictionary objectForKey:@"numshi"];
        _numting = [dictionary objectForKey:@"numting"];
        _numwei = [dictionary objectForKey:@"numwei"];
        _measure = [dictionary objectForKey:@"measure"];
        _sheshi = [dictionary objectForKey:@"sheshi"];
        _numlou = [dictionary objectForKey:@"numlou"];
        _numall = [dictionary objectForKey:@"numall"];
        _isPersonal = [dictionary objectForKey:@"ispersonal"];
        _money = [dictionary objectForKey:@"money"];
        _qq = [dictionary objectForKey:@"qq"];
        _usage = [dictionary objectForKey:@"usage"];
        _color = [dictionary objectForKey:@"color"];
        _mode = [dictionary objectForKey:@"mode"];
    }
    return self;
}



@end
