//
//  SqliteOperateQueue.m
//  DM
//
//  Created by tepusoft on 15/12/22.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import "SqliteOperateQueue.h"

static dispatch_queue_t sqliteOperateQueue;

@implementation SqliteOperateQueue

+(dispatch_queue_t)shareManager
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sqliteOperateQueue = dispatch_queue_create("dm.sqliteOperationSearialDispatchQueue", NULL);
    });
    return sqliteOperateQueue;
}

@end
