//
// Created by wjdtyp on 15/7/30.
// Copyright (c) 2015 JaguarTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RJNewsGroups.h"
#import "RJNewsFS.h"
#import "RJNewsFSO.h"

@interface RJNewsData : NSObject
@property(nonatomic, strong) NSString *modifytime;
@property(nonatomic, strong) RJNewsGroups *groups;
@property(nonatomic, strong) RJNewsFS *forced_sub;
@property(nonatomic, strong) RJNewsFSO *forced_sub_order;
@end