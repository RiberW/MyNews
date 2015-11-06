//
// Created by wjdtyp on 15/9/2.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import "VIDEOCellStrategy.h"
#import "RJCustomVIDEOCell.h"
#import "RJNews.h"
#import "RJVideoViewController.h"
#import "RJVideoDetailController.h"


@implementation VIDEOCellStrategy {

}

static CGFloat cellHeight;

+ (void)initialize {
    cellHeight = YRF(230);
}

- (CGFloat)getHeight {
    return cellHeight;
}
- (RJCustomVIDEOCell *)loadNibName{
    return [[[NSBundle mainBundle] loadNibNamed:@"RJCustomVIDEO" owner:nil options:nil] lastObject];
}

- (UIViewController *)createController {
    RJVideoDetailController *controller= [[RJVideoDetailController alloc]init];
    return controller;
}
@end