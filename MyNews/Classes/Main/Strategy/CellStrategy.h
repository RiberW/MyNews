//
// Created by wjdtyp on 15/9/2.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RJCustomCell;

@interface CellStrategy : NSObject
@property(nonatomic, strong) id data;
@property(nonatomic, strong) NSString *category;

- (instancetype)initWithData:(id)data;

- (instancetype)createWithData:(id)data;

- (RJCustomCell *)loadNibName;

- (CGFloat)getHeight;

- (UIViewController *)createController;
@end