//
//  OwnInfoSingleton.h
//  DM
//
//  Created by tepusoft on 15/12/29.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OwnInfoSingleton : NSObject

+(instancetype)sharedManager;


@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *areacode;
@property (nonatomic, strong) NSString *businessimg;
@property (nonatomic, strong) NSString *categoryid;
@property (nonatomic, strong) NSString *codetype;

@property (nonatomic, strong) NSString *companyid;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *headimg;
@property (nonatomic, strong) NSString *Id;
@property (nonatomic, strong) NSString *idcardimg;

@property (nonatomic, strong) NSString *idnum;
@property (nonatomic, strong) NSString *jifen;
@property (nonatomic, strong) NSString *keycode;
@property (nonatomic, strong) NSString *legaladdress;
@property (nonatomic, strong) NSString *legalname;

@property (nonatomic, strong) NSString *legaltel;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *newpassword;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *no;

@property (nonatomic, strong) NSString *oldpassword;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *remarks;
@property (nonatomic, strong) NSString *sex;

@property (nonatomic, strong) NSString *tel;
@property (nonatomic, strong) NSString *upgrade;
@property (nonatomic, strong) NSString *upstatus;
@property (nonatomic, strong) NSString *usergrade;
@property (nonatomic, strong) NSString *usertype;


+(void)initWihtDictionary:(NSDictionary *)dictionary;


@end

