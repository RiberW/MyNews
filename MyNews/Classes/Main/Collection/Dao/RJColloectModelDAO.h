//
// Created by wjdtyp on 15/9/6.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RJColloectModel;


@interface RJColloectModelDAO : NSObject
- (RJColloectModel *)findModel:(RJColloectModel *)model;

- (BOOL)addModel:(RJColloectModel *)model;
- (BOOL)updateModel:(RJColloectModel *)model;
@end