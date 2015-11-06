//
// Created by wjdtyp on 15/9/2.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import "CellContext.h"
#import "CellStrategy.h"
#import "RJCustomCell.h"


@implementation CellContext {

}

- (instancetype)initWithStrategy:(CellStrategy *)strategy {
    self = [super init];
    if (self) {
        _strategy = strategy;
    }
    return self;
}

- (CGFloat)getCellHeight {
    return [_strategy getHeight];
}

- (RJCustomCell *)loadNibName {
    return [_strategy loadNibName];
}

- (UIViewController *)createController {
    return [_strategy createController];
}
@end