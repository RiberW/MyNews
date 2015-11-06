//
// Created by wjdtyp on 15/8/28.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//
#import "RJCustomCellHelper.h"
#import "RJCustomCell.h"
#import "RJNewsNewsListObject.h"
#import "CellStrategy.h"
#import "CellContext.h"

@implementation RJCustomCellHelper

//TODO cellHeight

+ (CGFloat)forCellHeightWithData:(id)data {
    CellStrategy *strategy = [[CellStrategy alloc] initWithData:data];
    CellContext *context = [[CellContext alloc] initWithStrategy:strategy];
    CGFloat height=[context getCellHeight];
    return height;
}

+ (RJCustomCell *)createCustomCell:(id)data tableView:(UITableView *)tableView {
    CellStrategy *strategy = [[CellStrategy alloc] initWithData:data];
    NSString *type = strategy.category;
    NSString *identifier = [type stringByAppendingFormat:@"cell"];
    RJCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        CellContext *context = [[CellContext alloc] initWithStrategy:strategy];
        context.data = data;
        cell = [context loadNibName];
    }
    cell = [cell loadNibNameWithData:data];
    return cell;
}
@end