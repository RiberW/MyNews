//
// Created by wjdtyp on 15/9/2.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import "CMSCellStrategy.h"
#import "RJCustomCMSCell.h"
#import "RJNews.h"
#import "RJNewsWebViewController.h"
#import "RJNewsNewsListObject.h"


@implementation CMSCellStrategy {

}
static CGFloat cellHeight;

+ (void)initialize {
    cellHeight = (CGFloat) (YRF(100));
}

- (CGFloat)getHeight {
    return cellHeight;
}

- (RJCustomCMSCell *)loadNibName{
    return [[[NSBundle mainBundle] loadNibNamed:@"RJCustomCMS" owner:nil options:nil] lastObject];
}

- (UIViewController *)createController {
    RJNewsWebViewController *controller= [[RJNewsWebViewController alloc]init];
    RJNewsNewsListObject *object = self.data;   //TODO type is blurry
    controller.urlString = [@"http://api.sina.cn/sinago/articlev2.json?id=" stringByAppendingFormat:@"%@", object.id];
    return controller;
}
@end