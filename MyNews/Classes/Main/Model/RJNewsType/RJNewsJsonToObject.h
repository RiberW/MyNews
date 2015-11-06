//
// Created by wjdtyp on 15/7/30.
// Copyright (c) 2015 JaguarTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RJNewsData.h"
@interface RJNewsJsonToObject : NSObject
@property(nonatomic, strong) NSString *status;
@property(nonatomic, strong) RJNewsData *data;
@end