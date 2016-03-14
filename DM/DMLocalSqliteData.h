//
//  CategoryData.h
//  DM
//
//  Created by tepusoft on 15/12/22.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

typedef id (^dataOpertor)(sqlite3_stmt *statement);

@interface DMLocalSqliteData : NSObject

// 查询 分类 一级界面信息

+(NSArray *)categoryListData;

/**
 *  查询分类的子分类
 *
 *  @param publicRecruit 父分类ID
 *
 *  @return 子分类数组
 */

+(NSArray *)sonCategoryListDataWithParentId:(NSString *)parentId;

/**
 *  查询发布的分类
 *
 *  @return 返回查询数据
 */

+(NSArray *)publicListData;

// 查询 发布  招聘 二级页面信息
+(NSArray *)publicRecruit;

/**
 *  查询省
 *
 *  @return 省列表
 */
+(NSArray *)provinceListData;

/**
 *  查询市
 *
 *  @param provinceCode 省标识码
 *
 *  @return 当前省下对应的市列表
 */
+(NSArray *)cityListDataWithProvinceCode:(NSString *)provinceCode;


/**
 *  查询区
 *
 *  @param cityCode 市标识码
 *
 *  @return 当前市下对应的区列表
 */
+(NSMutableArray *)districtListDataWithCityCode:(NSString *)cityCode;



/**
 *   获取工作年限列表
 *
 *  @return 工作年限列表
 */
+(NSMutableArray *)workYearListData;

/**
 *  获取薪资列表
 *
 *  @return 薪资列表
 */
+(NSMutableArray *)salaryListData;


/**
 *  获取教育列表
 *
 *  @return 教育列表
 */
+(NSMutableArray *)eduListDataWithType;


/**
 *  获取合租类型列表
 *
 *  @return 合租类型列表
 */
+ (NSMutableArray *)sharedListData;


/**
 *  获取性别列表
 *
 *  @return 性别列表
 */
+(NSMutableArray *)sexListData;

/**
 *  获取颜色列表
 *
 *  @return 颜色列表
 */
+(NSMutableArray *)colorListData;

/**
 *  获取配套设施列表
 *
 *  @return 配套设施列表
 */
+(NSMutableArray *)additionListData;


/**
 *  根据type获取dm.splite中tab_dictionary表中的列表
 *
 *  @param 类型 （表中的字段）
 *
 *  @return
 */
+(NSMutableArray *)selectListDataWithType:(NSString *)type;


/**
 *  根据ParentID获取工作职位
 *
 *  @param parentID 父ID
 *
 *  @return 工作职位
 */
+(NSMutableArray *)workPositionListDataWithParentID:(NSString *)parentID;

@end
