//
//  ResumeModel.h
//  DM
//
//  Created by tepusoft on 15/12/29.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResumeModel : NSObject

@property (nonatomic, strong) NSString *userId; //用户ID
@property (nonatomic, strong) NSString *companyId;  //广告商ID
@property (nonatomic, strong) NSString *name;  //姓名
@property (nonatomic, strong) NSString *sex;  //性别0:男 1:女
@property (nonatomic, strong) NSString *birthday;  //出生日期
@property (nonatomic, strong) NSString *edu;  //最高学历
@property (nonatomic, strong) NSString *year;  //工作年限
@property (nonatomic, strong) NSString *phone;  //联系方式
@property (nonatomic, strong) NSString *email;  //邮箱
@property (nonatomic, strong) NSString *workarea;  //工作区域
@property (nonatomic, strong) NSString *worksalary;  //期望薪资
@property (nonatomic, strong) NSString *workPosition;  //期望职位
@property (nonatomic, strong) NSString *jobDesc;  //求职宣言
@property (nonatomic, strong) NSString *isPublic;  //是否公开 0:否  1:是


@end
