//
//  BelowLinePublicModel.h
//  DM
//
//  Created by tepusoft on 15/12/28.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BelowLinePublicModel : NSObject

@property (nonatomic, strong) NSString *Id; //订单ID
@property (nonatomic, strong) NSString *type; //0:线下发布 1:线上发布
@property (nonatomic, strong) NSString *contenType; //广告类型 0:文字 1:图片 2:版面
@property (nonatomic, strong) NSString *companyId; //广告商ID
@property (nonatomic, strong) NSString *columnId;  //栏目ID
@property (nonatomic, strong) NSString *spectype;  //1:行 2:块 3:版
@property (nonatomic, strong) NSString *specid;  //发布形式ID
@property (nonatomic, strong) NSString *releaseTimeId;  //发布期数ID（开始时间）
@property (nonatomic, strong) NSString *releaseTime;  //发布期数第几期
@property (nonatomic, strong) NSString *customerId;  //客户ID
@property (nonatomic, strong) NSString *title;  //首行内容
@property (nonatomic, strong) NSString *content;  //内容详细
@property (nonatomic, strong) NSString *image; //图片
@property (nonatomic, strong) NSString *rownum;  //行数
@property (nonatomic, strong) NSString *orderperods;  //发布期数
@property (nonatomic, strong) NSString *stick;  //是否置顶 0:否 1:是
@property (nonatomic, strong) NSString *additionSetting;  //附加条件 0:无 1:加红线 2:加黑线
@property (nonatomic, strong) NSString *paymentno; //交易号


@end
