//
// Created by wjdtyp on 15/9/2.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import "SubjectCellStrategy.h"
#import "RJCustomCMSCell.h"
#import "RJNews.h"


@implementation SubjectCellStrategy {

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
@end