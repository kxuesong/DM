//
//  OnLinePublicModel.h
//  DM
//
//  Created by tepusoft on 15/12/28.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PartTimeInfoModel : NSObject

@property (nonatomic, strong) NSString *Id; //信息ID
@property (nonatomic, strong) NSString *userId; //客户ID
@property (nonatomic, strong) NSString *companyId; //广告商ID
@property (nonatomic, strong) NSString *companyName; //广告商名称
@property (nonatomic, strong) NSString *areaId;  //区域ID
@property (nonatomic, strong) NSString *areaName;  //区域名称
@property (nonatomic, strong) NSString *rootId;  //栏目根级ID
@property (nonatomic, strong) NSString *parentids;  //栏目所有父级ID
@property (nonatomic, strong) NSString *channelid;  //栏目ID
@property (nonatomic, strong) NSString *channelName;  //栏目名称
@property (nonatomic, strong) NSString *releaseTime;  //发布时间
@property (nonatomic, strong) NSString *gongsi;  //公司名称
@property (nonatomic, strong) NSString *title; //标题
@property (nonatomic, strong) NSString *desc;  //描述
@property (nonatomic, strong) NSString *personName;  //联系人名称
@property (nonatomic, strong) NSString *personPhone;  //联系方式
@property (nonatomic, strong) NSString *imageURL;  //
@property (nonatomic, strong) NSString *infotype; //

@end
