//
//  RJPictureDetailView.h
//  MyNews
//
//  Created by wjdtyp on 15/9/6.
//  Copyright (c) 2015年 wjdtyp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RJPictureDetailView : UIView
@property (weak, nonatomic) IBOutlet UILabel *longTitleText;
@property (weak, nonatomic) IBOutlet UILabel *picNumText;
@property (weak, nonatomic) IBOutlet UILabel *introText;
@property (weak, nonatomic) IBOutlet UIScrollView *picScrollView;
@property (weak, nonatomic) IBOutlet UIButton *likeBtn;
@property (weak, nonatomic) IBOutlet UIButton *collectBtn;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;
@end
