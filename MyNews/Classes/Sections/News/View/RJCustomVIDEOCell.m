//
//  RJCustomVIDEOCell.m
//  MyNews
//
//  Created by wjdtyp on 15/8/28.
//  Copyright (c) 2015年 wjdtyp. All rights reserved.
//

#import "RJCustomVIDEOCell.h"
#import "RJNewsNewsListObject.h"
#import "SDImageCache.h"
#import "UIImageView+WebCache.h"
#import "RJNewsNewsListObjectVI.h"
#import "RJNewsSingleton.h"

@implementation RJCustomVIDEOCell
- (RJCustomVIDEOCell *)loadNibNameWithData:(RJNewsNewsListObject *)data {
    self.titleLabel.text = data.title;
    //异常不能使用
    @try {
        if (data.video_info) {
            self.commentLabel.text = [data.video_info.playnumber stringByAppendingFormat:@"播放"];
        }else{
            return nil;
        }
    } @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }

    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    NSURL *url = [NSURL URLWithString:data.kpic];
    UIImage *img= [RJNewsSingleton getPlaceHolderImage];
    [self.imgView sd_setImageWithURL:url placeholderImage:img completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.imgView.image = image;
    }];
    return self;
}

+ (RJCustomVIDEOCell *)loadNibName {
    return [[[NSBundle mainBundle] loadNibNamed:@"RJCustomVIDEO" owner:nil options:nil] lastObject];
}
@end
