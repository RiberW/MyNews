//
// Created by wjdtyp on 15/9/2.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellStrategy.h"

@class RJCustomCMSCell;


@interface CMSCellStrategy : CellStrategy{

}
- (RJCustomCell *)loadNibName;
- (UIViewController *)createController;
@end