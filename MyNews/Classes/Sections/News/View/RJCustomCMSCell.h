//
//  RJCustomCMSCell.h
//  MyNews
//
//  Created by wjdtyp on 15/8/28.
//  Copyright (c) 2015年 wjdtyp. All rights reserved.
//

#import "RJCustomCell.h"
@interface RJCustomCMSCell : RJCustomCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *introLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@end
