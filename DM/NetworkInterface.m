//
//  NetworkInterface.m
//  DM
//
//  Created by tepusoft on 15/12/28.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import "NetworkInterface.h"
#import "NetworkInterfaceReturnDataModel.h"
#import "BelowLinePublicModel.h"
#import "PullTimeInfoModel.h"
#import "ResumeModel.h"
#import "AFNetworking.h"

#define URL_Prefix @"http://210.44.64.48/dm/f/mobile/"

@implementation NetworkInterface




+(void)getScrollPicturelistWithAreacode:(NSString *)areacode
                           successBlock:(NetworkingSuccessBlock)sucessBlock
                           failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"platform/getScrollPicturelist";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager POST:urlString
       parameters:@{@"areacode":areacode}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              sucessBlock(model);
              NSLog(@"%@",responseObject);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
}
/**
 *  获取验证码
 *
 *  @param codeType  用户手机号
 *  @param companyid 广告商ID
 *
 *  @return 网络接口返回值对象
 */
+(void)commitKeycodeWithCodeType:(NSString *)codeType
                             tel:(NSString *)tel
                       companyid:(NSString *)companyId
                    successBlock:(NetworkingSuccessBlock)successBlock
                    failureBlock:(NetworkingFailureBlock)failureBlock
{
    
    NSString *postfixURL = @"customer/commitKeycode";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager POST:urlString parameters:@{@"codetype":codeType,@"tel":tel,@"companyid":companyId} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
        successBlock(model);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock();
    }];
}

/**
 *  登录
 *
 *  @param tel      电话号码
 *  @param password 密码
 *  @param areacode 地区（暂时无用）
 *
 *  @return 网络接口返回值
 */

+(void)commitLoginWithTel:(NSString *)tel
                 password:(NSString *)password
                 areaCode:(NSString *)areaCode
             successBlock:(NetworkingSuccessBlock)successBlock
             failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"customer/commitLogin";
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager POST:urlString
       parameters:@{@"areacode":areaCode,@"tel":tel,@"password":password}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *resultModel = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(resultModel);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }
     ];
}

/**
 *  客户注册
 *
 *  @param companyId 广告商ID
 *  @param tel       手机号
 *  @param keyCode   验证码
 *  @param password  客户登录密码（最少6位）
 *  @param emil      邮箱
 *  @param nickName  昵称
 *  @param no        邀请码
 *
 *  @return 网络接口返回值
 */
+(void)commitRegistWithCompanyId:(NSString *)companyId
                             tel:(NSString *)tel
                         keyCode:(NSString *)keyCode
                        password:(NSString *)password
                           email:(NSString *)emil
                        nickName:(NSString *)nickName
                              no:(NSString *)no
                    successBlock:(NetworkingSuccessBlock)successBlock
                    failureBlock:(NetworkingFailureBlock)failureBlock
{
    
    NSString *postfixURL = @"customer/commitRegist";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    mamager.requestSerializer = [AFJSONRequestSerializer serializer];
    mamager.responseSerializer = [AFJSONResponseSerializer serializer];
    [mamager POST:urlString
       parameters:@{@"companyid":companyId,@"tel":tel,@"keycode":keyCode,@"password":password,@"email":emil,@"nickname":nickName,@"no":no}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(model);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
    
}

/**
 *  客户完善信息
 *
 *  @param Id       客户ID
 *  @param userType 完善信息类型
 *
 *  @return 网络接口返回值
 */

+(void)commitPrefectionfoWithId:(NSString *)Id
                       userType:(NSString *)userType
                   successBlock:(NetworkingSuccessBlock)successBlock
                   failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"customer/commitPrefectinfo";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    mamager.requestSerializer = [AFJSONRequestSerializer serializer];
    mamager.responseSerializer = [AFJSONResponseSerializer serializer];
    [mamager POST:urlString
       parameters:@{}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(model);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
    
    
}

+(void)getAdversWithCode:(NSString *)code
            successBlock:(NetworkingSuccessBlock)successBlock
            failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"adver/getAdvers";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    [manager POST:urlString
       parameters:@{@"areacode":code}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(model);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
    
}


+(void)customerSigninWithCustomerid:(NSString *)customerid
                       successBlock:(NetworkingSuccessBlock)successBlock
                       failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"sys/customerSignin";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    mamager.requestSerializer = [AFJSONRequestSerializer serializer];
    mamager.responseSerializer = [AFJSONResponseSerializer serializer];
    [mamager POST:urlString
       parameters:@{@"customerid":customerid}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(model);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
}

/**
 *  获取所属行业（线下一级栏目）
 *
 *  @param companyId 企业ID
 *
 *  @return 网络接口返回值
 */

+(void)getCategorylist:(NSString *)companyId
          successBlock:(NetworkingSuccessBlock)successBlock
          failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"customer/getCategorylist/";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    mamager.requestSerializer = [AFJSONRequestSerializer serializer];
    mamager.responseSerializer = [AFJSONResponseSerializer serializer];
    [mamager POST:urlString
       parameters:@{}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(model);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
    
    
}

/**
 *  修改密码
 *
 *  @param Id          用户ID
 *  @param oldPassword 原密码
 *  @param newPassword 新密码
 *  @param keyCode     验证码
 *
 *  @return 网络接口返回值
 */

+(void)updatePasswordWithId:(NSString *)Id
                oldPassword:(NSString *)oldPassword
                newPassword:(NSString *)newPassword
                    keyCode:(NSString *)keyCode
               successBlock:(NetworkingSuccessBlock)successBlock
               failureBlock:(NetworkingFailureBlock)failureBlock
{
    
    NSString *postfixURL = @"customer/updatePassword/";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    mamager.requestSerializer = [AFJSONRequestSerializer serializer];
    mamager.responseSerializer = [AFJSONResponseSerializer serializer];
    [mamager POST:urlString
       parameters:@{}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(model);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
    
    
}


/**
 *  设置新密码(忘记密码)
 *
 *  @param Id       用户ID
 *  @param password 密码
 *  @param keyCode  验证码
 *
 *  @return 网络接口返回值
 */

+(void)setNewPwdWithId:(NSString *)Id
              password:(NSString *)password
               keyCode:(NSString *)keyCode
          successBlock:(NetworkingSuccessBlock)successBlock
          failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"customer/setNewpwd/";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    mamager.requestSerializer = [AFJSONRequestSerializer serializer];
    mamager.responseSerializer = [AFJSONResponseSerializer serializer];
    [mamager POST:urlString
       parameters:@{}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(model);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
    
    
}


/**
 *  修改信息
 *
 *  @param Id        用户ID
 *  @param fieldName 修改字段
 *  @param value     字段对应值
 *
 *  @return 网络接口返回值
 */

+(void)updateUserInfoWithId:(NSString *)Id
                  fieldName:(NSString *)fieldName
                      value:(NSString *)value
               successBlock:(NetworkingSuccessBlock)successBlock
               failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"customer/updateUserinfo/";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    mamager.requestSerializer = [AFJSONRequestSerializer serializer];
    mamager.responseSerializer = [AFJSONResponseSerializer serializer];
    [mamager POST:urlString
       parameters:@{}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(model);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
    
    
}

/**
 *  获取排期
 *
 *  @param companyId 广告商ID
 *
 *  @return 网络接口返回值
 */
+(void)getlistScheduleWithCompanyId:(NSString *)companyId
                       successBlock:(NetworkingSuccessBlock)successBlock
                       failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"release/getlistSchedule";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    mamager.requestSerializer = [AFJSONRequestSerializer serializer];
    mamager.responseSerializer = [AFJSONResponseSerializer serializer];
    [mamager POST:urlString
       parameters:@{@"companyid":companyId}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(model);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
    
    
}


/**
 *  获取广告商栏目
 *
 *  @param columnId  栏目ID
 *  @param companyId 广告商ID
 *  @param typeId    类型ID（0:文字  1:图片  2:版面）
 *
 *  @return 网络接口返回数据对象
 */

+(void)getColumnsByCompanyIdWithColumnId:(NSString *)columnId
                               companyId:(NSString *)companyId
                                  typeId:(NSString *)typeId
                            successBlock:(NetworkingSuccessBlock)successBlock
                            failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"release/getColumnsbycompanyid";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    mamager.requestSerializer = [AFJSONRequestSerializer serializer];
    mamager.responseSerializer = [AFJSONResponseSerializer serializer];
    [mamager POST:urlString
       parameters:@{@"columnid":columnId,@"companyid":companyId,@"typeid":typeId}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(model);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
    
    
}

/**
 *  获取栏目规格信息
 *
 *  @param columnId  栏目ID
 *  @param companyId 广告商ID
 *
 *  @return 网络接口返回数据对象
 */

+(void)getColumnspeclistWithColumnId:(NSString *)columnId
                           companyId:(NSString *)companyId
                        successBlock:(NetworkingSuccessBlock)successBlock
                        failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"release/getColumnspeclist";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    mamager.requestSerializer = [AFJSONRequestSerializer serializer];
    mamager.responseSerializer = [AFJSONResponseSerializer serializer];
    [mamager POST:urlString
       parameters:@{}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(model);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
    
    
}

/**
 *  线下发布
 *
 *  @param belowLinePublicModel 线下发布内容对象
 *
 *  @return 网络接口返回数据对象
 */
+(void)commitReleaseWithBelowLineModel:(BelowLinePublicModel *)belowLinePublicModel
                          successBlock:(NetworkingSuccessBlock)successBlock
                          failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"release/commitRelease";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    mamager.requestSerializer = [AFJSONRequestSerializer serializer];
    mamager.responseSerializer = [AFJSONResponseSerializer serializer];
    [mamager POST:urlString
       parameters:@{}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(model);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
    
    
}


/**
 *  线下确认提交
 *
 *  @param userId  用户ID
 *  @param orderId 订单ID
 *
 *  @return 网络接口返回数据对象
 */
+(void)secondCommitReleaseWithUserId:(NSString *)userId
                             orderId:(NSString *)orderId
                        successBlock:(NetworkingSuccessBlock)successBlock
                        failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"release/secondCommitRelease";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    mamager.requestSerializer = [AFJSONRequestSerializer serializer];
    mamager.responseSerializer = [AFJSONResponseSerializer serializer];
    [mamager POST:urlString
       parameters:@{}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(model);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
    
    
}


/**
 *  支付接口
 *
 *  @param Id        订单ID
 *  @param isnopay   是否支付（false为待支付）
 *  @param paymentNo 支付单号
 *  @param money     支付金额
 *  @param payType   0:支付宝 1:微信 2:银联
 *
 *  @return 网络接口返回数据对象
 */
+(void)paymentWithId:(NSString *)Id
             isnopay:(NSString *)isnopay
           paymentNo:(NSString *)paymentNo
               money:(NSString *)money
             payType:(NSString *)payType
        successBlock:(NetworkingSuccessBlock)successBlock
        failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"release/ payment/";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    mamager.requestSerializer = [AFJSONRequestSerializer serializer];
    mamager.responseSerializer = [AFJSONResponseSerializer serializer];
    [mamager POST:urlString
       parameters:@{}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(model);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
    
    
}


/**
 *  线上发布信息
 *
 *  @param onLinePublicModel 线上发布内容对象
 *
 *  @return 网络接口返回数据对象
 */

+(void)commitReleaseonlineWithOnLinePublic:(PullTimeInfoModel *)partTimeInfoModel
                              successBlock:(NetworkingSuccessBlock)successBlock
                              failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"release/commitReleaseonline/";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    mamager.requestSerializer = [AFJSONRequestSerializer serializer];
    mamager.responseSerializer = [AFJSONResponseSerializer serializer];
    [mamager POST:urlString
       parameters:@{@"id":partTimeInfoModel.Id,
                    @"userid":partTimeInfoModel.userId,
                    @"companyid":partTimeInfoModel.companyId,
                    @"companyname":partTimeInfoModel.companyName,
                    @"areaid":partTimeInfoModel.areaId,
                    @"areaname":partTimeInfoModel.areaName,
                    @"rootid":partTimeInfoModel.rootId,
                    @"parentids":partTimeInfoModel.parentids,
                    @"channelid":partTimeInfoModel.channelid,
                    @"channelname":partTimeInfoModel.channelName,
                    @"releasetime":partTimeInfoModel.releaseTime,
                    @"gongsi":partTimeInfoModel.gongsi,
                    @"title":partTimeInfoModel.title,
                    @"desc":partTimeInfoModel.desc,
                    @"personname":partTimeInfoModel.personName,
                    @"personphone":partTimeInfoModel.personPhone,
                    @"imageurl":partTimeInfoModel.imageURL,
                    @"infotype":partTimeInfoModel.infotype,
                    @"year":partTimeInfoModel.year,
                    @"salary":partTimeInfoModel.salary,
                    @"edu":partTimeInfoModel.edu,
                    @"num":partTimeInfoModel.num,
                    @"age":partTimeInfoModel.age,
                    @"place":partTimeInfoModel.place}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(model);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
}


/**
 *  提交简历
 *
 *  @param resumeModel 简历对象
 *
 *  @return 网络接口返回数据对象
 */

+(void)commitJianliWithResumeModel:(ResumeModel *)resumeModel
                      successBlock:(NetworkingSuccessBlock)successBlock
                      failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"jianli/commitJianli";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    mamager.requestSerializer = [AFJSONRequestSerializer serializer];
    mamager.responseSerializer = [AFJSONResponseSerializer serializer];
    [mamager POST:urlString
       parameters:@{@"userid":resumeModel.userId,@"companyid":resumeModel.companyId,@"name":resumeModel.name,@"sex":resumeModel.sex,@"birthday":resumeModel.birthday,@"edu":resumeModel.edu,@"year":resumeModel.year,@"phone":resumeModel.phone,@"email":resumeModel.email,@"workarea":resumeModel.workarea,@"worksalary":resumeModel.worksalary,@"workposition":resumeModel.workPosition,@"jobdesc":resumeModel.jobDesc,@"ispublic":resumeModel.isPublic}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(model);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
    
    
}



/**
 *  获取Top10列表
 *
 *  @param userId    用户的ID
 *  @param companyId 广告商ID
 *  @param areaCode  区域Code
 *
 *  @return 网络接口返回数据对象
 */
+(void)getToptenWithUserId:(NSString *)userId
                 companyId:(NSString *)companyId
                  areaCode:(NSString *)areaCode
              successBlock:(NetworkingSuccessBlock)successBlock
              failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"sys/getTopten";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    mamager.requestSerializer = [AFJSONRequestSerializer serializer];
    mamager.responseSerializer = [AFJSONResponseSerializer serializer];
    [mamager POST:urlString
       parameters:@{}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(model);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
    
    
}


/**
 *  提取信息列表
 *
 *  @param userId     用户ID
 *  @param companyId  广告商ID
 *  @param parafield  参数字段
 *  @param paramValue 参数值
 *  @param orderby    排序
 *  @param page       页码
 *  @param rows       多少条
 *
 *  @return 网络接口返回数据对象
 */

+(void)getPickInfoListWithUserId:(NSString *)userId
                       companyId:(NSString *)companyId
                      paramfield:(NSString *)parafield
                      paramValue:(NSString *)paramValue
                         orderby:(NSString *)orderby
                            page:(NSString *)page
                            rows:(NSString *)rows
                    successBlock:(NetworkingSuccessBlock)successBlock
                    failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"release/getPickinfolist";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    mamager.requestSerializer = [AFJSONRequestSerializer serializer];
    mamager.responseSerializer = [AFJSONResponseSerializer serializer];
    [mamager POST:urlString
       parameters:@{@"userid":userId,@"companyid":companyId,@"paramfield":parafield,@"paramvalue":paramValue,@"orderby":orderby,@"page":page,@"rows":rows}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(model);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
    
}



/**
 *  获取个人发布列表（线上发布）
 *
 *  @param userid     用户的ID
 *  @param paramfield 参数字段
 *  @param paramValue 参数值
 *  @param orderby    排序
 *  @param page       页码
 *  @param rows       条数
 *
 *  @return 网络接口返回数据对象
 */

+(void)getMyhistoryListOnlineWithUserId:(NSString *)userid
                             paramfield:(NSString *)paramfield
                             paramValue:(NSString *)paramValue
                                orderby:(NSString *)orderby
                                   page:(NSString *)page
                                   rows:(NSString *)rows
                           successBlock:(NetworkingSuccessBlock)successBlock
                           failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"release/getMyhistorylistOnline";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    mamager.requestSerializer = [AFJSONRequestSerializer serializer];
    mamager.responseSerializer = [AFJSONResponseSerializer serializer];
    [mamager POST:urlString
       parameters:@{}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(model);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
    
    
}


/**
 *  获取个人发布列表（线下发布）
 *
 *  @param userid     用户的ID
 *  @param paramfield 参数字段
 *  @param paramValue 参数值
 *  @param orderby    排序
 *  @param page       页码
 *  @param rows       条数
 *
 *  @return 网络接口返回数据对象
 */
+(void)getMyhistoryListOfflineWithUserId:(NSString *)userid
                              paramfield:(NSString *)paramfield
                              paramValue:(NSString *)paramValue
                                 orderby:(NSString *)orderby
                                    page:(NSString *)page
                                    rows:(NSString *)rows
                            successBlock:(NetworkingSuccessBlock)successBlock
                            failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"release/getMyhistorylistOffline";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    mamager.requestSerializer = [AFJSONRequestSerializer serializer];
    mamager.responseSerializer = [AFJSONResponseSerializer serializer];
    [mamager POST:urlString
       parameters:@{@"userid":userid,@"paramfield":paramfield,@"paramvalue":paramValue,@"orderby":orderby,@"page":page,@"rows":rows}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(model);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
    
    
}


/**
 *  获取广告列表
 *
 *  @param companyId  广告商ID
 *  @param rootId     栏目根ID
 *  @param channelid  栏目ID
 *  @param paramfield 参数字段
 *  @param paramValue 参数值
 *  @param orderby    排序
 *  @param page       页码
 *  @param rows       条数
 *
 *  @return 网络接口返回数据对象
 */
+(void)getAdverlistBycolumnidWithCompanyId:(NSString *)companyId
                                    rootId:(NSString *)rootId
                                 channelid:(NSString *)channelid
                                paramField:(NSString *)paramField
                                paramValue:(NSString *)paramValue
                                   orderBy:(NSString *)orderBy
                                      page:(NSString *)page
                                      rows:(NSString *)rows
                              successBlock:(NetworkingSuccessBlock)successBlock
                              failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"sys/getAdverlistBycolumnid";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager POST:urlString
       parameters:@{@"companyid":companyId,@"rootid":rootId,@"channelid":channelid,@"paramfield":paramField,@"paramvalue":paramValue,@"orderby":orderBy,@"page":page,@"rows":rows}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *resultModel = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(resultModel);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
    
          }];
//    @"companyid":companyId,@"rootid":rootId,@"channelid":channelid,@"paramfield":paramField,@"paramvalue":paramValue,@"orderby":orderBy,@"page":page,@"rows":rows
}


/**
 *  查看订单审核记录
 *
 *  @param userId  用户ID
 *  @param orderId 信息订单ID
 *
 *  @return 网络接口返回数据对象
 */

+(void)getCheckInfoListByorderIdWithUserId:(NSString *)userId
                                   orderId:(NSString *)orderId
                              successBlock:(NetworkingSuccessBlock)successBlock
                              failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"release/getCheckinfolistbyorderid";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    mamager.requestSerializer = [AFJSONRequestSerializer serializer];
    mamager.responseSerializer = [AFJSONResponseSerializer serializer];
    [mamager POST:urlString
       parameters:@{}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(model);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
    
    
}



/**
 *  线上信息，取消订单
 *
 *  @param userId 用户ID
 *  @param orderId 信息订单ID
 *
 *  @return 网络接口返回数据对象
 */
+(void)onlineOrderCancelWithUserId:(NSString *)userId
                           orderId:(NSString *)orderId
                      successBlock:(NetworkingSuccessBlock)successBlock
                      failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"release/onlineOrder_cancel";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    mamager.requestSerializer = [AFJSONRequestSerializer serializer];
    mamager.responseSerializer = [AFJSONResponseSerializer serializer];
    [mamager POST:urlString
       parameters:@{}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(model);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
    
    
}



/**
 *  线上信息，信息下线
 *
 *  @param userId  用户ID
 *  @param orderId 信息订单ID
 *
 *  @return 网络接口返回数据对象
 */

+(void)onlineOrderXiaXianWithUserId:(NSString *)userId
                            orderId:(NSString *)orderId
                       successBlock:(NetworkingSuccessBlock)successBlock
                       failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"release/onlineOrder_xiaxian";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    mamager.requestSerializer = [AFJSONRequestSerializer serializer];
    mamager.responseSerializer = [AFJSONResponseSerializer serializer];
    [mamager POST:urlString
       parameters:@{}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(model);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
    
    
}

/**
 *  线上信息，更新发布
 *
 *  @param userId  用户ID
 *  @param orderId 信息订单ID
 *
 *  @return 网络接口返回数据对象
 */
+(void)onlineOrderUpdateTimeWithUserId:(NSString *)userId
                               orderId:(NSString *)orderId
                          successBlock:(NetworkingSuccessBlock)successBlock
                          failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"release/onlineOrder_updatetime";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    mamager.requestSerializer = [AFJSONRequestSerializer serializer];
    mamager.responseSerializer = [AFJSONResponseSerializer serializer];
    [mamager POST:urlString
       parameters:@{}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(model);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
    
    
}



/**
 *  线上信息，信息重新提交
 *
 *  @param userId  用户ID
 *  @param orderId 信息订单ID
 *
 *  @return 网络接口返回数据对象
 */

+(void)onlineOrderSecondCommitWithUserId:(NSString *)userId
                                 orderId:(NSString *)orderId
                            successBlock:(NetworkingSuccessBlock)successBlock
                            failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"release/onlineOrder_secondcommit";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    mamager.requestSerializer = [AFJSONRequestSerializer serializer];
    mamager.responseSerializer = [AFJSONResponseSerializer serializer];
    [mamager POST:urlString
       parameters:@{}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(model);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
    
    
}


/**
 *  线下信息，取消订单
 *
 *  @param userId  用户ID
 *  @param orderId 信息订单ID
 *  @param reason  取消原因
 *
 *  @return 网络接口返回数据对象
 */

+(void)offlineOrderCancelWithUserId:(NSString *)userId
                            orderId:(NSString *)orderId
                             reason:(NSString *)reason
                       successBlock:(NetworkingSuccessBlock)successBlock
                       failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"release/offlineOrder_cancel";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    mamager.requestSerializer = [AFJSONRequestSerializer serializer];
    mamager.responseSerializer = [AFJSONResponseSerializer serializer];
    [mamager POST:urlString
       parameters:@{}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(model);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
    
    
}



/**
 *  线下信息，信息重新提交
 *
 *  @param userId  用户ID
 *  @param orderId 信息订单ID
 *  @param reason  重新提交原因
 *
 *  @return 网络接口返回数据对象
 */


+(void)offlineOrderSecondCommitWithUserId:(NSString *)userId
                                  orderId:(NSString *)orderId
                                   reason:(NSString *)reason
                             successBlock:(NetworkingSuccessBlock)successBlock
                             failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"release/offlineOrder_secondcommit/";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    mamager.requestSerializer = [AFJSONRequestSerializer serializer];
    mamager.responseSerializer = [AFJSONResponseSerializer serializer];
    [mamager POST:urlString
       parameters:@{}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(model);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
    
    
}

/**
 *  线下信息，撤稿申请
 *
 *  @param userId  用户ID
 *  @param orderId 信息订单ID
 *  @param reason  撤稿原因
 *
 *  @return 网络接口返回数据对象
 */

+(void)offlineOrderChegaoWithUserId:(NSString *)userId
                            orderId:(NSString *)orderId
                             reason:(NSString *)reason
                       successBlock:(NetworkingSuccessBlock)successBlock
                       failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"release/offlineOrder_chegao/";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    mamager.requestSerializer = [AFJSONRequestSerializer serializer];
    mamager.responseSerializer = [AFJSONResponseSerializer serializer];
    [mamager POST:urlString
       parameters:@{}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(model);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
    
    
}


/**
 *  线下信息，改稿申请
 *
 *  @param belowLinePublicModel 下线信息对象
 *
 *  @return 网络接口返回数据对象
 */

+(void)offlineOrderGaigaoWithBelowLinePublicModel:(BelowLinePublicModel *)belowLinePublicModel
                                     successBlock:(NetworkingSuccessBlock)successBlock
                                     failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"release/offlineOrder_gaigao";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    mamager.requestSerializer = [AFJSONRequestSerializer serializer];
    mamager.responseSerializer = [AFJSONResponseSerializer serializer];
    [mamager POST:urlString
       parameters:@{}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(model);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
    
    
}

/**
 *  线下信息，停搞操作
 *
 *  @param userId  用户ID
 *  @param orderId 信息订单ID
 *  @param reason  撤稿原因
 *
 *  @return 网络接口返回数据对象
 */
+(void)offlineOrderTinggaoWithUserId:(NSString *)userId
                             orderId:(NSString *)orderId
                              reason:(NSString *)reason
                        successBlock:(NetworkingSuccessBlock)successBlock
                        failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"release/offlineOrder_tinggao/";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    mamager.requestSerializer = [AFJSONRequestSerializer serializer];
    mamager.responseSerializer = [AFJSONResponseSerializer serializer];
    [mamager POST:urlString
       parameters:@{}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(model);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
    
    
}

/**
 *  线下信息，获取订单详细信息
 *
 *  @param userId  用户ID
 *  @param orderId 信息订单ID
 *
 *  @return 网络接口返回数据对象
 */
+(void)offlineOrderGetDetailWithUserId:(NSString *)userId
                               orderId:(NSString *)orderId
                                reason:(NSString *)reason
                          successBlock:(NetworkingSuccessBlock)successBlock
                          failureBlock:(NetworkingFailureBlock)failureBlock
{
    NSString *postfixURL = @"release/offlineOrder_getdetail/";
    NSString *urlString = [NSString stringWithFormat:@"%@%@",URL_Prefix,postfixURL];
    AFHTTPSessionManager *mamager = [AFHTTPSessionManager manager];
    mamager.requestSerializer = [AFJSONRequestSerializer serializer];
    mamager.responseSerializer = [AFJSONResponseSerializer serializer];
    [mamager POST:urlString
       parameters:@{}
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NetworkInterfaceReturnDataModel *model = [[NetworkInterfaceReturnDataModel alloc]initWithDictionary:responseObject];
              successBlock(model);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              failureBlock();
          }];
    
    
}

@end
