//
// Created by wjdtyp on 15/9/2.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import "HDPICCellStrategy.h"
#import "RJCustomHDPICCell.h"
#import "RJNews.h"
#import "RJPictureDetailController.h"


@implementation HDPICCellStrategy {

}

static CGFloat cellHeight;

+ (void)initialize {
    cellHeight = (CGFloat) (YRF(150));
}

- (CGFloat)getHeight {
    return cellHeight;
}



- (RJCustomHDPICCell *)loadNibName{
    return [[[NSBundle mainBundle] loadNibNamed:@"RJCustomHDPIC" owner:nil options:nil] lastObject];
}

- (UIViewController *)createController {
    RJPictureDetailController *controller= [[RJPictureDetailController alloc]init];
    RJNewsNewsListObject *object = (RJNewsNewsListObject *)self.data;   //TODO type is blurry
    controller.pictureModel = object;
    return controller;
}
@end