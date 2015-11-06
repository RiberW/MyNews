//
// Created by wjdtyp on 15/7/30.
// Copyright (c) 2015 JaguarTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RJNewsNewsData;


@interface RJNewsJsonToNews : NSObject
@property(nonatomic, strong) NSString *status;
@property(nonatomic, strong) RJNewsNewsData *data;
@end