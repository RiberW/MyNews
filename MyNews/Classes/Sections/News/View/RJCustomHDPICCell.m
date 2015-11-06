//
//  RJCustomHDPICCell.m
//  MyNews
//
//  Created by wjdtyp on 15/8/28.
//  Copyright (c) 2015年 wjdtyp. All rights reserved.
//

#import "RJCustomHDPICCell.h"
#import "RJNewsNewsListObject.h"
#import "RJNewsNewsPicsList.h"
#import "RJNewsNewsPics.h"
#import "RJNewsNewsPicsListObject.h"
#import "SDImageCache.h"
#import "UIImageView+WebCache.h"
#import "RJNewsSingleton.h"

@implementation RJCustomHDPICCell
- (RJCustomHDPICCell *)loadNibNameWithData:(RJNewsNewsListObject *)data {
    self.titleLabel.text = data.title;
    self.commentLabel.text = [data.comment stringByAppendingFormat:@"评论"];
    NSMutableArray *picsArr = [NSMutableArray arrayWithCapacity:4];
    RJNewsNewsPicsList *pics = data.pics.list;
    for (RJNewsNewsPicsListObject *picsList in pics) {
        [picsArr addObject:picsList.kpic];
    }
    UIImage *placeImg = [RJNewsSingleton getPlaceHolderImage];
    NSURL *url1 = [NSURL URLWithString:picsArr[0]];

    self.oneImgView.userInteractionEnabled=YES;
    self.twoImgView.userInteractionEnabled=YES;
    self.threeImgView.userInteractionEnabled=YES;

    [self.oneImgView sd_setImageWithURL:url1 placeholderImage:placeImg completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.oneImgView.image = image;
    }];

    NSURL *url2 = [NSURL URLWithString:picsArr[1]];
    [self.twoImgView sd_setImageWithURL:url2 placeholderImage:placeImg completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.twoImgView.image = image;
    }];

    NSURL *url3 = [NSURL URLWithString:picsArr[2]];
    [self.threeImgView sd_setImageWithURL:url3 placeholderImage:placeImg completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.threeImgView.image = image;
    }];

    return self;
}

+(RJCustomHDPICCell *)loadNibName {
    RJCustomHDPICCell *hidpic = [[[NSBundle mainBundle] loadNibNamed:@"RJCustomHDPIC" owner:nil options:nil] lastObject];
    return hidpic;
}
@end
