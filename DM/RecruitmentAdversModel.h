//
//  RecruitmentAdversModel.h
//  DM
//
//  Created by tepusoft on 16/1/5.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecruitmentAdversModel : NSObject

@property (nonatomic, strong) NSString *orderNo;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *statusFlag;
@property (nonatomic, strong) NSString *Id;
@property (nonatomic, strong) NSString *userId;

@property (nonatomic, strong) NSString *companyId;
@property (nonatomic, strong) NSString *companyName;
@property (nonatomic, strong) NSString *areaId;
@property (nonatomic, strong) NSString *areaName;
@property (nonatomic, strong) NSString *rootId;
@property (nonatomic, strong) NSString *parentIds;

@property (nonatomic, strong) NSString *channelId;
@property (nonatomic, strong) NSString *channelName;
@property (nonatomic, strong) NSString *isFinish;
@property (nonatomic, strong) NSString *releaseTime;
@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *gongsi;
@property (nonatomic, strong) NSString *imageURL;
@property (nonatomic, strong) NSString *infoType;
@property (nonatomic, strong) NSString *personName;

@property (nonatomic, strong) NSString *personPhone;
@property (nonatomic, strong) NSString *imagesList;
@property (nonatomic, strong) NSString *year;
@property (nonatomic, strong) NSString *salary;
@property (nonatomic, strong) NSString *edu;

@property (nonatomic, strong) NSString *num;
@property (nonatomic, strong) NSString *age;
@property (nonatomic, strong) NSString *place;
@property (nonatomic, strong) NSString *estate;
@property (nonatomic, strong) NSString *numshi;

@property (nonatomic, strong) NSString *numting;
@property (nonatomic, strong) NSString *numwei;
@property (nonatomic, strong) NSString *measure;
@property (nonatomic, strong) NSString *sheshi;
@property (nonatomic, strong) NSString *numlou;

@property (nonatomic, strong) NSString *numall;
@property (nonatomic, strong) NSString *isPersonal;
@property (nonatomic, strong) NSString *money;
@property (nonatomic, strong) NSString *qq;
@property (nonatomic, strong) NSString *usage;

@property (nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSString *mode;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
