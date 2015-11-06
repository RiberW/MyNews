//
// Created by wjdtyp on 15/8/28.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RJCustomCell;
@interface RJCustomCellHelper : NSObject
+ (RJCustomCell *)createCustomCell:(id)data tableView:(UITableView *)tableView;
+ (CGFloat)forCellHeightWithData:(id)data;
@end