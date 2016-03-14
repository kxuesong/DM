//
//  CategoryData.m
//  DM
//
//  Created by tepusoft on 15/12/22.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import "CategoryData.h"
#import "sqlite3.h"
#import "DMLocalObject.h"

static sqlite3 *db;

@implementation CategoryData

+(NSArray *)categoryListData
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"dm" ofType:@"sqlite"];
    if(sqlite3_open([filePath UTF8String], &db)!= SQLITE_OK){
        NSAssert(NO, @"数据库打开失败");
    }
    NSString *sql = @"SELECT name,description,iconsrc,rootid FROM tab_channel WHERE usetag = 1  AND Pid = 0 ORDER BY sort";
    
    sqlite3_stmt *statement;
    NSMutableArray *dmLocals= [NSMutableArray new];
    if (sqlite3_prepare(db, [sql UTF8String], -1, &statement, NULL)==SQLITE_OK) {
        while(sqlite3_step(statement) == SQLITE_ROW) {
            DMLocalObject *dmLocal = [DMLocalObject new];
            dmLocal.name = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            dmLocal.descriptions = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
            dmLocal.iconsrc = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 2)];
            dmLocal.rootid = sqlite3_column_int(statement, 3);
            [dmLocals addObject:dmLocal];
        }
    }
    sqlite3_finalize(statement);
    sqlite3_close(db);
    return dmLocals;
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
    NSString *sql = @"SELECT id,name FROM tab_channel WHERE usetag = 1 AND Pid = 1 AND level= 2 ORDER BY sort";
    sqlite3_stmt *statement;
    NSMutableArray *dmLocals = [NSMutableArray new];
    if (sqlite3_prepare(db, [sql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            DMLocalObject *dm = [DMLocalObject new];
            dm.Id = sqlite3_column_int(statement, 0);
            dm.name = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
            [dmLocals addObject:dm];
        }
    }
    sqlite3_finalize(statement);
    sqlite3_close(db);
    
    NSMutableArray *mutableArray = [NSMutableArray array];
    for (DMLocalObject *dm in dmLocals) {
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
            DMLocalObject *dm = [DMLocalObject new];
            dm.Id = sqlite3_column_int(statement, 0);
            dm.name = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
            [dmLocals addObject:dm];
        }
    }
    sqlite3_finalize(statement);
    sqlite3_close(db);
    return dmLocals;
}

@end
