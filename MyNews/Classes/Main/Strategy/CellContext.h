//
// Created by wjdtyp on 15/9/2.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CellStrategy;
@class RJCustomCell;


@interface CellContext : NSObject
@property(nonatomic, strong) CellStrategy *strategy;
@property(nonatomic, strong) id data;
- (instancetype)initWithStrategy:(CellStrategy *)strategy;
- (RJCustomCell *)loadNibName;
- (CGFloat)getCellHeight;

- (UIViewController *)createController;
@end