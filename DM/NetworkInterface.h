//
//  NetworkInterface.h
//  DM
//
//  Created by tepusoft on 15/12/28.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkInterfaceReturnDataModel.h"

@class BelowLinePublicModel;
@class PartTimeInfoModel;
@class ResumeModel;


typedef void (^NetworkingSuccessBlock)(NetworkInterfaceReturnDataModel *returnDataModel);
typedef void (^NetworkingFailureBlock)(void);

@interface NetworkInterface : NSObject

/**
 *  轮播图片
 *
 *  @param areacode     地区代码
 *  @param sucessBlock  成功后执行Block
 *  @param failureBlock 失败后执行Block
 */
+(void)getScrollPicturelistWithAreacode:(NSString *)areacode
                           successBlock:(NetworkingSuccessBlock)sucessBlock
                           failureBlock:(NetworkingFailureBlock)failureBlock;
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
                    failureBlock:(NetworkingFailureBlock)failureBlock;
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
             failureBlock:(NetworkingFailureBlock)failureBlock;

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
                    failureBlock:(NetworkingFailureBlock)failureBlock;

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
                   failureBlock:(NetworkingFailureBlock)failureBlock;

/**
 *  获取广告商
 *
 *  @param code 地区代码
 */
+(void)getAdversWithCode:(NSString *)code
            successBlock:(NetworkingSuccessBlock)successBlock
            failureBlock:(NetworkingFailureBlock)failureBlock;
/**
 *  获取所属行业（线下一级栏目）
 *
 *  @param companyId 企业ID
 *
 *
 */

+(void)getCategorylist:(NSString *)companyId
          successBlock:(NetworkingSuccessBlock)successBlock
          failureBlock:(NetworkingFailureBlock)failureBlock;

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
               failureBlock:(NetworkingFailureBlock)failureBlock;


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
          failureBlock:(NetworkingFailureBlock)failureBlock;


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
               failureBlock:(NetworkingFailureBlock)failureBlock;

/**
 *  用户签到
 *
 *  @param customerid   用户ID
 *  @param successBlock 成功块
 *  @param failureBlock 失败块
 */
+(void)customerSigninWithCustomerid:(NSString *)customerid
                       successBlock:(NetworkingSuccessBlock)successBlock
                       failureBlock:(NetworkingFailureBlock)failureBlock;

/**
 *  获取排期
 *
 *  @param companyId 广告商ID
 *
 *  @return 网络接口返回值
 */
+(void)getlistScheduleWithCompanyId:(NSString *)companyId
                       successBlock:(NetworkingSuccessBlock)successBlock
                       failureBlock:(NetworkingFailureBlock)failureBlock;


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
                            failureBlock:(NetworkingFailureBlock)failureBlock;

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
                        failureBlock:(NetworkingFailureBlock)failureBlock;

/**
 *  线下发布
 *
 *  @param belowLinePublicModel 线下发布内容对象
 *
 *  @return 网络接口返回数据对象
 */
+(void)commitReleaseWithBelowLineModel:(BelowLinePublicModel *)belowLinePublicModel
                          successBlock:(NetworkingSuccessBlock)successBlock
                          failureBlock:(NetworkingFailureBlock)failureBlock;


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
                        failureBlock:(NetworkingFailureBlock)failureBlock;


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
        failureBlock:(NetworkingFailureBlock)failureBlock;


/**
 *  线上发布信息
 *
 *  @param onLinePublicModel 线上发布内容对象
 *
 *  @return 网络接口返回数据对象
 */

+(void)commitReleaseonlineWithOnLinePublic:(PartTimeInfoModel *)onLinePublicModel
                              successBlock:(NetworkingSuccessBlock)successBlock
                              failureBlock:(NetworkingFailureBlock)failureBlock;


/**
 *  提交简历
 *
 *  @param resumeModel 简历对象
 *
 *  @return 网络接口返回数据对象
 */

+(void)commitJianliWithResumeModel:(ResumeModel *)resumeModel
                      successBlock:(NetworkingSuccessBlock)successBlock
                      failureBlock:(NetworkingFailureBlock)failureBlock;


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
              failureBlock:(NetworkingFailureBlock)failureBlock;


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
                    failureBlock:(NetworkingFailureBlock)failureBlock;



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
                           failureBlock:(NetworkingFailureBlock)failureBlock;


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
                            failureBlock:(NetworkingFailureBlock)failureBlock;


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
                              failureBlock:(NetworkingFailureBlock)failureBlock;


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
                              failureBlock:(NetworkingFailureBlock)failureBlock;


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
                      failureBlock:(NetworkingFailureBlock)failureBlock;



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
                       failureBlock:(NetworkingFailureBlock)failureBlock;

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
                          failureBlock:(NetworkingFailureBlock)failureBlock;



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
                            failureBlock:(NetworkingFailureBlock)failureBlock;

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
                       failureBlock:(NetworkingFailureBlock)failureBlock;



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
                             failureBlock:(NetworkingFailureBlock)failureBlock;

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
                       failureBlock:(NetworkingFailureBlock)failureBlock;


/**
 *  线下信息，改稿申请
 *
 *  @param belowLinePublicModel 下线信息对象
 *
 *  @return 网络接口返回数据对象
 */

+(void)offlineOrderGaigaoWithBelowLinePublicModel:(BelowLinePublicModel *)belowLinePublicModel
                                     successBlock:(NetworkingSuccessBlock)successBlock
                                     failureBlock:(NetworkingFailureBlock)failureBlock;

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
                        failureBlock:(NetworkingFailureBlock)failureBlock;
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
                          failureBlock:(NetworkingFailureBlock)failureBlock;

@end
