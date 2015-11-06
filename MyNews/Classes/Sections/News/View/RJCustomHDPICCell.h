//
//  RJCustomHDPICCell.h
//  MyNews
//
//  Created by wjdtyp on 15/8/28.
//  Copyright (c) 2015年 wjdtyp. All rights reserved.
//

#import "RJCustomCell.h"

@interface RJCustomHDPICCell : RJCustomCell
@property (weak, nonatomic) IBOutlet UIImageView *oneImgView;
@property (weak, nonatomic) IBOutlet UIImageView *twoImgView;
@property (weak, nonatomic) IBOutlet UIImageView *threeImgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

@end
