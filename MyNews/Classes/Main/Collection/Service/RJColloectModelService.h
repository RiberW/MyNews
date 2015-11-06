//
// Created by wjdtyp on 15/9/6.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RJColloectModel;
@class RJColloectModelDAO;


@interface RJColloectModelService : NSObject
@property(nonatomic, strong) RJColloectModelDAO *dao;

- (void)saveModel:(RJColloectModel *)model;

- (void)updateModel:(RJColloectModel *)model;

- (void)removeNote:(RJColloectModel *)model;

- (RJColloectModel *)findModel:(RJColloectModel *)model;

- (void)modifyNote:(RJColloectModel *)model;
@end