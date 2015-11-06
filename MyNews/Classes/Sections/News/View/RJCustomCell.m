//
// Created by wjdtyp on 15/8/28.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import "RJCustomCell.h"
#import "RJNewsNewsListObject.h"

@implementation RJCustomCell
+ (RJCustomCell *)loadNibName {
    RJCustomCell *cell = [[RJCustomCell alloc] init];
    return cell;
}

- (RJCustomCell *)loadNibNameWithData:(RJNewsNewsListObject *)data {
    return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *result = [super hitTest:point withEvent:event];
    self.touchedView = result;
    return result;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    BOOL flag = [super pointInside:point withEvent:event];
    return flag;
}
@end