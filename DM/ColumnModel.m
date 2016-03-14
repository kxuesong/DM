//
//  columnModel.m
//  DM
//
//  Created by tepusoft on 16/1/10.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import "ColumnModel.h"
#import "NSDictionary+StringValue.h"

@implementation ColumnModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.Id = [dictionary stringValueForKey:@"id"];
        self.name = [dictionary stringValueForKey:@"name"];
        self.itemtype = [dictionary stringValueForKey:@"itemtype"];
        self.canimg = [dictionary stringValueForKey:@"canimg"];
        self.onlybusiness = [dictionary stringValueForKey:@"onlybusiness"];
        self.islast = [dictionary stringValueForKey:@"islast"];
        self.isbuscircle = [dictionary stringValueForKey:@"isbuscircle"];
        self.pricesys = [dictionary objectForKey:@"pricesys"];
    }
    return self;
}

@end
