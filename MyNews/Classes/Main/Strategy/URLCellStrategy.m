//
// Created by wjdtyp on 15/9/2.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import "URLCellStrategy.h"
#import "RJCustomCMSCell.h"
#import "RJNews.h"
#import "RJNewsURLController.h"


@implementation URLCellStrategy {

}

static CGFloat cellHeight;

+ (void)initialize {
    cellHeight = (CGFloat) (YRF(120));
}

- (CGFloat)getHeight {
    return cellHeight;
}
- (RJCustomCMSCell *)loadNibName{
    return [[[NSBundle mainBundle] loadNibNamed:@"RJCustomCMS" owner:nil options:nil] lastObject];
}

- (UIViewController *)createController {
    RJNewsURLController *controller= [[RJNewsURLController alloc] init];
    controller.urlString= [self.data valueForKey:@"link"];
    return controller;
}
@end