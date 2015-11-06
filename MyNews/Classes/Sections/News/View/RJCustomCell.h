//
// Created by wjdtyp on 15/8/28.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SDCycleScrollView;
@class RJNewsNewsListObject;

@interface RJCustomCell : UITableViewCell
@property(nonatomic, strong) SDCycleScrollView *cycleScrollView;
@property(nonatomic, strong) UIView *touchedView;

+ (RJCustomCell *)loadNibName;

- (RJCustomCell *)loadNibNameWithData:(RJNewsNewsListObject *)data;

@property(nonatomic, assign) CGFloat cellHeight;
@property(nonatomic, strong) NSString *category;
@end