//
//  CategoryData.m
//  DM
//
//  Created by tepusoft on 15/12/22.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import "DMLocalSqliteData.h"
#import "ChannelModel.h"
#import "AreaModel.h"

static sqlite3 *db;

@implementation DMLocalSqliteData


+(NSMutableArray *)sqliteOperator:(NSString *)sql dataOpertorBlock:(dataOpertor)dataOpertor
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"dm" ofType:@"sqlite"];
    if(sqlite3_open([filePath UTF8String], &db)!= SQLITE_OK){
        NSAssert(NO, @"数据库打开失败");
    }
//    NSString *sql = @"SELECT name,description,iconsrc,rootid FROM tab_channel WHERE usetag = 1  AND Pid = 0 ORDER BY sort";
    
    sqlite3_stmt *statement;
    NSMutableArray *dmLocals= [NSMutableArray new];
    if (sqlite3_prepare(db, [sql UTF8String], -1, &statement, NULL)==SQLITE_OK) {
        while(sqlite3_step(statement) == SQLITE_ROW) {
//            ChannelModel *dmLocal = [ChannelModel new];
//            dmLocal.name = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
//            dmLocal.descriptions = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
//            dmLocal.iconsrc = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 2)];
//            dmLocal.rootid = sqlite3_column_int(statement, 3);
//            [dmLocals addObject:dmLocal];
            [dmLocals addObject: dataOpertor(statement)];
        }
    }
    sqlite3_finalize(statement);
    sqlite3_close(db);
    return dmLocals;
}

+(NSArray *)categoryListData
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"dm" ofType:@"sqlite"];
    if(sqlite3_open([filePath UTF8String], &db)!= SQLITE_OK){
        NSAssert(NO, @"数据库打开失败");
    }
    NSString *sql = @"SELECT name,description,iconsrc,rootid,id FROM tab_channel WHERE usetag = 1  AND level =1  ORDER BY sort";
    
    sqlite3_stmt *statement;
    NSMutableArray *dmLocals= [NSMutableArray new];
    if (sqlite3_prepare(db, [sql UTF8String], -1, &statement, NULL)==SQLITE_OK) {
        while(sqlite3_step(statement) == SQLITE_ROW) {
            ChannelModel *dmLocal = [ChannelModel new];
            dmLocal.name = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            dmLocal.descriptions = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
            dmLocal.iconsrc = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 2)];
            dmLocal.rootid = sqlite3_column_int(statement, 3);
            dmLocal.Id = sqlite3_column_int(statement, 4);
            [dmLocals addObject:dmLocal];
        }
    }
    sqlite3_finalize(statement);
    sqlite3_close(db);
    return dmLocals;
}

+(NSArray *)publicListData
{
    NSString *sql = @"SELECT name,description,iconsrc,rootid,id FROM tab_channel WHERE usetag = 1  AND level =1 AND islast = 0 ORDER BY sort";
    NSArray *array = [self sqliteOperator:sql dataOpertorBlock:^id(sqlite3_stmt *statement) {
        ChannelModel *dmLocal = [ChannelModel new];
        dmLocal.name = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
        dmLocal.descriptions = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
        dmLocal.iconsrc = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 2)];
        dmLocal.rootid = sqlite3_column_int(statement, 3);
        dmLocal.Id = sqlite3_column_int(statement, 4);
        return dmLocal;
    }];
    return array;
}


+(NSArray *)sonCategoryListDataWithParentId:(NSString *)parentId
{
    NSString *sql = [NSString stringWithFormat:@"SELECT name,rootid,id FROM tab_channel WHERE usetag = 1  AND Pid = %@  AND level = 2 ORDER BY sort",parentId];
    NSArray *array = [self sqliteOperator:sql dataOpertorBlock:^id(sqlite3_stmt *statement) {
        ChannelModel *dmLocal = [ChannelModel new];
        dmLocal.name = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
        dmLocal.rootid = sqlite3_column_int(statement, 1);
        dmLocal.Id = sqlite3_column_int(statement, 2);
        return dmLocal;
    }];
    return array;
}

//1.查询出 标题数据 放入数组

//2.查询出所有 标题数据 下的 小标题

//3.分离出 每个标题下的 小标题

+(NSArray *)publicRecruit
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"dm" ofType:@"sqlite"];
    if(sqlite3_open([filePath UTF8String], &db) != SQLITE_OK){
        NSAssert(NO, @"数据库打开失败");
    }
    //1
    NSString *sql = @"SELECT id,name FROM tab_channel WHERE Pid = 2 AND level= 2 ORDER BY sort";
    sqlite3_stmt *statement;
    NSMutableArray *dmLocals = [NSMutableArray new];
    if (sqlite3_prepare(db, [sql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            ChannelModel *dm = [ChannelModel new];
            dm.Id = sqlite3_column_int(statement, 0);
            dm.name = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
            [dmLocals addObject:dm];
        }
    }
    sqlite3_finalize(statement);
    sqlite3_close(db);
    
    NSMutableArray *mutableArray = [NSMutableArray array];
    for (ChannelModel *dm in dmLocals) {
        NSArray *array = [self findSmallTitleWithId:[NSString stringWithFormat:@"%ld",dm.Id]];
        NSArray *arr = @[dm.name,array];
        [mutableArray addObject:arr];
    }
    
    return mutableArray;
}

+(NSArray *)findSmallTitleWithId:(NSString *)Id
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"dm" ofType:@"sqlite"];
    if(sqlite3_open([filePath UTF8String], &db) != SQLITE_OK){
        NSAssert(NO, @"数据库打开失败");
    }
    //1
    NSString *sql = [NSString stringWithFormat:@"SELECT id,name FROM tab_channel WHERE usetag = 1 AND Pid = %@ AND level= 3 ORDER BY sort",Id];
    sqlite3_stmt *statement;
    NSMutableArray *dmLocals = [NSMutableArray new];
    if (sqlite3_prepare(db, [sql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            ChannelModel *dm = [ChannelModel new];
            dm.Id = sqlite3_column_int(statement, 0);
            dm.name = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
            [dmLocals addObject:dm];
        }
    }
    sqlite3_finalize(statement);
    sqlite3_close(db);
    return dmLocals;
}


//+(NSArray *)provinceListData
//{
//    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"dm" ofType:@"sqlite"];
//    if (sqlite3_open([filePath UTF8String],&db)) {
//        NSAssert(NO, @"数据库打开失败");
//    }
//    NSString *sql = @"SELECT code,name FROM tab_area WHERE type = 2";
//    sqlite3_stmt *statement;
//    NSMutableArray *datas = [NSMutableArray new];
//    if (sqlite3_prepare(db, [sql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
//        while (sqlite3_step(statement) == SQLITE_ROW) {
//            AreaModel *areaModel = [AreaModel new];
//            areaModel.code = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
//            areaModel.name = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
//            [datas addObject:areaModel];
//        }
//    }
//    sqlite3_finalize(statement);
//    sqlite3_close(db);
//    return datas;
//}
+(NSArray *)provinceListData
{
    NSString *sql = @"SELECT code,name FROM tab_area WHERE type = 2";
    NSArray * datas = [self sqliteOperator:sql dataOpertorBlock:^id (sqlite3_stmt *statement) {
        AreaModel *areaModel = [AreaModel new];
        areaModel.code = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
        areaModel.name = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
        return areaModel;
    }];
    return datas;
}


+(NSArray *)cityListDataWithProvinceCode:(NSString *)provinceCode
{
    NSString *sql = [NSString stringWithFormat:@"SELECT code,name FROM tab_area WHERE type = 3 AND parentcode = %@",provinceCode];
    NSArray *datas = [self sqliteOperator:sql dataOpertorBlock:^id(sqlite3_stmt *statement) {
        AreaModel *areaModel = [AreaModel new];
        areaModel.code = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
        areaModel.name = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
        return areaModel;
    }];
    return datas;
}

+(NSMutableArray *)districtListDataWithCityCode:(NSString *)cityCode
{
    NSString *sql = [NSString stringWithFormat:@"SELECT code,name FROM tab_area WHERE type = 4 AND parentcode = %@",cityCode];
    NSMutableArray *datas = [self sqliteOperator:sql dataOpertorBlock:^id(sqlite3_stmt *statement) {
        AreaModel *areaModel = [AreaModel new];
        areaModel.code = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
        areaModel.name = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
        return areaModel;
    }];
    return datas;
}



+(NSMutableArray *)workYearListData
{
    return [self selectListDataWithType:@"工作年限"];
}

+(NSMutableArray *)salaryListData
{
    return [self selectListDataWithType:@"薪资"];
}

+(NSMutableArray *)eduListDataWithType
{
    return [self selectListDataWithType:@"学历"];
}

+ (NSMutableArray *)sharedListData
{
    return [self selectListDataWithType:@"合租类型"];
}

+(NSMutableArray *)sexListData
{
    return [self selectListDataWithType:@"性别"];
}

+(NSMutableArray *)colorListData
{
    return [self selectListDataWithType:@"颜色"];
}

+(NSMutableArray *)additionListData
{
    return [self selectListDataWithType:@"配套设施"];
}

+(NSMutableArray *)selectListDataWithType:(NSString *)type
{
    NSString *sql =[NSString stringWithFormat:@"SELECT value_py FROM tab_dictionary WHERE type_py = '%@' ORDER BY sort ",type];
    NSMutableArray *datas = [self sqliteOperator:sql dataOpertorBlock:^id(sqlite3_stmt *statement) {
        NSString *name = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
        return name;
    }];
    return datas;
}

+(NSMutableArray *)workPositionListDataWithParentID:(NSString *)parentID
{
    NSString *sql = [NSString stringWithFormat:@"SELECT name FROM tab_channel WHERE pid = %@  ORDER BY sort",parentID];
    NSMutableArray *datas = [self sqliteOperator:sql dataOpertorBlock:^id(sqlite3_stmt *statement) {
        NSString *name = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
        return name;
    }];
    return datas;
}

@end
