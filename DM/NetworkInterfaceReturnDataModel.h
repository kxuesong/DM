//
//  NetworkInterfaceReturnDataModel.h
//  DM
//
//  Created by tepusoft on 15/12/28.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkInterfaceReturnDataModel : NSObject


@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) id data;

-(instancetype)initWithDictionary:(NSDictionary *)dictrionary;

@end
