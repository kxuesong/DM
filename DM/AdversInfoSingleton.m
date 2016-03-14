//
//  AdversInfoSingleton.m
//  DM
//
//  Created by tepusoft on 16/1/4.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import "AdversInfoSingleton.h"

static AdversInfoSingleton *adversInfoSingleton;

@implementation AdversInfoSingleton


+(instancetype)shareManager
{
    static dispatch_once_t onec;
    dispatch_once(&onec, ^{
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSData *data = [defaults objectForKey:@"MyAdver"];
        if (data) {
            adversInfoSingleton = [[self alloc]init];
            adversInfoSingleton.adversModel = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        }
    });
    return adversInfoSingleton;
}


+(void)initWithAdversModel:(AdversModel *)adversModel
{
    adversInfoSingleton.adversModel = adversModel;
}

@end
