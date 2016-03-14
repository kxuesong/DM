//
//  OffLinePublicModel.h
//  DM
//
//  Created by tepusoft on 16/1/7.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PartTimeInfoModel  : NSObject



@property (nonatomic, strong) NSString *orderno;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *statusflag;
@property (nonatomic, strong) NSString *Id;
@property (nonatomic, strong) NSString *userid;
@property (nonatomic, strong) NSString *companyid;
@property (nonatomic, strong) NSString *companyname;
@property (nonatomic, strong) NSString *areaid;
@property (nonatomic, strong) NSString *areaname;
@property (nonatomic, strong) NSString *rootid;
@property (nonatomic, strong) NSString *parentids;
@property (nonatomic, strong) NSString *channelid;
@property (nonatomic, strong) NSString *channelname;
@property (nonatomic, strong) NSString *isfinish;
@property (nonatomic, strong) NSString *releasetime;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *gongsi;
@property (nonatomic, strong) NSString *imageurl;
@property (nonatomic, strong) NSString *infotype;;
@property (nonatomic, strong) NSString *personname;
@property (nonatomic, strong) NSString *personphone;
@property (nonatomic, strong) NSArray *imagesList;
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
@property (nonatomic, strong) NSString *ispersonal;
@property (nonatomic, strong) NSString *money;
@property (nonatomic, strong) NSString *qq;
@property (nonatomic, strong) NSString *usage;
@property (nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSString *mode ;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
