//
//  OwnInfoSingleton.m
//  DM
//
//  Created by tepusoft on 15/12/29.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import "OwnInfoSingleton.h"
#import "NSDictionary+StringValue.h"


static OwnInfoSingleton  *ownInfoSingleton;

@implementation OwnInfoSingleton

+(instancetype)sharedManager
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        ownInfoSingleton = [[self alloc]init];
    });
    return ownInfoSingleton;
}

+(void)initWihtDictionary:(NSDictionary *)dictionary
{
    ownInfoSingleton.address = [dictionary stringValueForKey:@"address"];
    ownInfoSingleton.areacode = [dictionary stringValueForKey:@"areacode"];
    ownInfoSingleton.businessimg = [dictionary stringValueForKey:@"businessimg"];
    ownInfoSingleton.categoryid = [dictionary stringValueForKey:@"categoryid"];
    ownInfoSingleton.codetype = [dictionary stringValueForKey:@"codetype"];
    ownInfoSingleton.companyid = [dictionary stringValueForKey:@"companyid"];
    ownInfoSingleton.email = [dictionary stringValueForKey:@"email"];
    ownInfoSingleton.headimg = [dictionary stringValueForKey:@"headimg"];
    ownInfoSingleton.Id = [dictionary stringValueForKey:@"id"];
    ownInfoSingleton.idcardimg = [dictionary stringValueForKey:@"idcardimg"];
    ownInfoSingleton.idnum = [dictionary stringValueForKey:@"idnum"];
    ownInfoSingleton.jifen = [dictionary stringValueForKey:@"jifen"];
    ownInfoSingleton.keycode = [dictionary stringValueForKey:@"keycode"];
    ownInfoSingleton.legaladdress = [dictionary stringValueForKey:@"legaladdress"];
    ownInfoSingleton.legalname = [dictionary stringValueForKey:@"legalname"];
    ownInfoSingleton.legaltel = [dictionary stringValueForKey:@"legaltel"];
    ownInfoSingleton.name = [dictionary stringValueForKey:@"name"];
    ownInfoSingleton.newpassword = [dictionary stringValueForKey:@"newpassword"];
    ownInfoSingleton.nickname = [dictionary stringValueForKey:@"nickname"];
    ownInfoSingleton.no = [dictionary stringValueForKey:@"no"];
    ownInfoSingleton.oldpassword = [dictionary stringValueForKey:@"oldpassword"];
    ownInfoSingleton.password = [dictionary stringValueForKey:@"password"];
    ownInfoSingleton.phone = [dictionary stringValueForKey:@"phone"];
    ownInfoSingleton.remarks = [dictionary stringValueForKey:@"remarks"];
    ownInfoSingleton.sex = [dictionary stringValueForKey:@"sex"];
    ownInfoSingleton.tel = [dictionary stringValueForKey:@"tel"];
    ownInfoSingleton.upgrade = [dictionary stringValueForKey:@"upgrade"];
    ownInfoSingleton.upstatus = [dictionary stringValueForKey:@"upstatus"];
    ownInfoSingleton.usergrade = [dictionary stringValueForKey:@"usergrade"];
    ownInfoSingleton.usertype = [dictionary stringValueForKey:@"usertype"];
}





@end
