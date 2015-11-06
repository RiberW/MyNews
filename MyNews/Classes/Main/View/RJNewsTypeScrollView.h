//
// Created by wjdtyp on 15/8/24.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RJNewsTypeButton;
@class RJNewsNewsHeadLinesList;
@class RJNewsTypeButton;


@protocol RJNewsTypeScrollViewDelegate <NSObject>
- (void)newsTypeClick:(RJNewsTypeButton *)newsTypeClick;
@end


@interface RJNewsTypeScrollView : UIScrollView
@property(nonatomic, strong) UIImageView *selectImageView;
@property(nonatomic, strong) RJNewsTypeButton *selectButton;
@property(nonatomic, strong) RJNewsNewsHeadLinesList *newsTypes;
@property (nonatomic, assign) BOOL isRefreshing;
@property (nonatomic, assign) id <RJNewsTypeScrollViewDelegate> delegate;
- (RJNewsTypeScrollView *)initWithArray:(NSArray *)array;
@end