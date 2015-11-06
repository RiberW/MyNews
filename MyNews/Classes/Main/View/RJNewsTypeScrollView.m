//
// Created by wjdtyp on 15/8/24.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//
#import "RJNewsTypeScrollView.h"
#import "RJNewsTypeButton.h"
#import "MASConstraint.h"
#import "View+MASAdditions.h"
#import "RJNews.h"

#define typeButtonWidth 55
#define selectImageViewHeight 2

@interface RJNewsTypeScrollView ()
@property(strong, nonatomic) NSMutableArray *widthConstraints;
@property(strong, nonatomic) NSMutableArray *buttonViews;
@property(strong, nonatomic) NSString *className;
@property(nonatomic, assign) NSUInteger newsTypeCount;
@end

@implementation RJNewsTypeScrollView {

}
#pragma mark 根据数组数据创建RJNewsTypeScrollView

- (RJNewsTypeScrollView *)initWithArray:(NSArray *)array {
    self.newsTypeCount = array.count;
    [self setupTypeScrollView];
    [self setupTypeScrollViewButton:array];
    [self setupTypeScrollViewButtonConstraints];
    return self;
}

- (void)setupTypeScrollView {
    self.showsHorizontalScrollIndicator = NO;
    self.alwaysBounceVertical = NO;
    self.showsVerticalScrollIndicator = NO;
    self.backgroundColor = [UIColor grayColor];
    self.contentSize = CGSizeMake(self.newsTypeCount * typeButtonWidth, typeScrollHeight);
    CGSize size = CGSizeMake(RJScreenW, typeScrollHeight);
    [self setView:self size:size left:self.superview.mas_left centerY:nil];
}

- (void)setupTypeScrollViewButton:(NSArray *)array {
    self.buttonViews = [[NSMutableArray alloc] init];
    [self.buttonViews addObject:self];
    for (NSUInteger i = 0; i < array.count; i++) {
        id object = array[i];
        RJNewsTypeButton *btn = [[RJNewsTypeButton alloc] init];
        btn.object = object;
        NSString *name = [object valueForKey:@"name"];
        [btn setTitle:name forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(newsTypeClick:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            [self newsTypeClick:btn];
        }
        [_buttonViews addObject:btn];
        [self addSubview:btn];
    }
}

- (void)setupTypeScrollViewButtonConstraints {
    for (NSUInteger i = 1; i < self.buttonViews.count; i++) {
        UIView *headerBtn = self.buttonViews[i - 1];
        UIView *btn = self.buttonViews[i];
        CGSize size = CGSizeMake(typeButtonWidth, typeScrollHeight - selectImageViewHeight);
        [self setView:btn size:size left:headerBtn.mas_right centerY:nil];
    }

    CGFloat totalX = (self.buttonViews.count - 1) * typeButtonWidth;
    if (totalX >= RJScreenW) {
        return;
    }
    NSUInteger count = self.buttonViews.count - 1;
    NSUInteger index = 0;
    if (count % 2 == 0) {
        index = count / 2;
        UIView *btn = self.buttonViews[index];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_centerX);
        }];
    } else {
        index = count / 2 + 1;
        UIView *btn = self.buttonViews[index];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.mas_centerX);
        }];
    }
}


- (void)setupSelectImageView {
    CGFloat X = CGRectGetMinX(self.selectButton.frame);
    CGFloat Y = CGRectGetMaxY(self.selectButton.frame);
    CGFloat W = self.selectButton.frame.size.width;
    CGFloat H = selectImageViewHeight;
    CGRect frame = CGRectMake(X, Y, W, H);
    self.selectImageView.frame = frame;
    self.selectImageView.backgroundColor = [UIColor redColor];
    [self addSubview:self.selectImageView];
}

- (MASConstraint *)setView:(UIView *)view size:(CGSize)size left:(MASViewAttribute *)left centerY:(MASViewAttribute *)centerY {
    __block MASConstraint *widthConstraint;
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        if (size.height > 0 && size.width > 0) {
            //宽高固定
            widthConstraint = make.width.equalTo(@(size.width));
            make.height.equalTo(@(size.height));
        }
        if (left != nil) {
            //左边约束
            make.left.equalTo(left);
        }
        if (centerY != nil) {
            //垂直中心对齐
            make.centerY.equalTo(centerY);
        }
    }];
    return widthConstraint;
}


- (void)newsTypeClick:(RJNewsTypeButton *)btn {
    self.selectButton = btn;
    [self setupSelectImageView];
    if (self.delegate && [self.delegate respondsToSelector:@selector(newsTypeClick:)]) {
        self.isRefreshing = YES;
        [self.delegate newsTypeClick:btn];
    }
}

- (NSMutableArray *)widthConstraints {
    if (_widthConstraints == nil) {
        self.widthConstraints = [NSMutableArray array];
    }
    return _widthConstraints;
}

- (UIImageView *)selectImageView {
    if (_selectImageView == nil) {
        self.selectImageView = [[UIImageView alloc] init];
    }
    return _selectImageView;
}
@end