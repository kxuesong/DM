//
//  CategoryData.h
//  DM
//
//  Created by tepusoft on 15/12/22.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryData : NSObject

// 查询 分类 一级界面信息

+(NSArray *)categoryListData;

// 查询 发布  招聘 二级页面信息
+(NSArray *)publicRecruit;


@end
