//
//  RJCustomCMSCell.m
//  MyNews
//
//  Created by wjdtyp on 15/8/28.
//  Copyright (c) 2015年 wjdtyp. All rights reserved.
//

#import "RJCustomCMSCell.h"
#import "RJNewsNewsListObject.h"
#import "RJNewsNewsCommentCountInfo.h"
#import "SDImageCache.h"
#import "UIImageView+WebCache.h"
#import "RJNewsSingleton.h"

@implementation RJCustomCMSCell
- (RJCustomCMSCell *)loadNibNameWithData:(RJNewsNewsListObject *)data {
    [self setupCellData:data];
    return self;
}

- (void)setupCellData:(RJNewsNewsListObject *)data {
    self.titleLabel.text = data.title;
    self.titleLabel.numberOfLines = 1;
    self.commentLabel.text = [data.comment_count_info.total stringByAppendingFormat:@"评论"];
    self.introLabel.text = data.intro;
    self.introLabel.numberOfLines = 3;
    NSURL *url = [[NSURL alloc] initWithString:data.kpic];
    UIImage *placeImg = [RJNewsSingleton getPlaceHolderImage];
    [self.imgView sd_setImageWithURL:url placeholderImage:placeImg completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.imgView.image = image;
    }];
}

+ (RJCustomCMSCell *)loadNibName {
    return [[[NSBundle mainBundle] loadNibNamed:@"RJCustomCMS" owner:nil options:nil] lastObject];
}
@end
