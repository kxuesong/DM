//
//  ScheduleModel.h
//  DM
//
//  Created by tepusoft on 16/1/10.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScheduleModel : NSObject

@property (nonatomic, strong) NSString *companyid;
@property (nonatomic, strong) NSString *Id;
@property (nonatomic, strong) NSString *year;
@property (nonatomic, strong) NSString *yearperiods;
@property (nonatomic, strong) NSString *allperiods;
@property (nonatomic, strong) NSString *releasetime;
@property (nonatomic, strong) NSString *stoptime;
@property (nonatomic, strong) NSString *y;
@property (nonatomic, strong) NSString *m;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *ispublish;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
