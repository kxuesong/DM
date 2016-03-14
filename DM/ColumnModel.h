//
//  columnModel.h
//  DM
//
//  Created by tepusoft on 16/1/10.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ColumnModel : NSObject

@property (nonatomic, strong) NSString *Id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *itemtype;
@property (nonatomic, strong) NSString *canimg;
@property (nonatomic, strong) NSString *onlybusiness;
@property (nonatomic, strong) NSString *islast;
@property (nonatomic, strong) NSString *isbuscircle;
@property (nonatomic, copy) NSArray *pricesys;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
