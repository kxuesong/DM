//
//  SqliteOperateQueue.h
//  DM
//
//  Created by tepusoft on 15/12/22.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SqliteOperateQueue : NSObject
+(dispatch_queue_t) shareManager;

@end
