//
//  RJPictureDetailController.m
//  News
//
//  Created by wjdtyp on 15/8/1.
//  Copyright (c) 2015年 wjdtyp. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "MJExtension.h"
#import "RJPictureDetailController.h"
#import "RJPictureCellJsonToModel.h"
#import "RJPictureCellData.h"
#import "RJPictureCellPM.h"
#import "RJPictureCellPMObjectData.h"
#import "RJPictureCellPMObject.h"
#import "RJPictureDetailView.h"
#import "RJNews.h"
#import "RJNewsSingleton.h"
#import "RJColloectModelService.h"
#import "RJColloectModel.h"

#define KPicture @"http://api.sina.cn/sinago/articlev2.json?id="

@interface RJPictureDetailController () <UIScrollViewDelegate>
@property(nonatomic, strong) NSMutableArray *pictures;
@end

@implementation RJPictureDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadPictureData];
}

- (void)setupDetailView {
    self.detailView = [[[NSBundle mainBundle] loadNibNamed:@"RJPictureDetailView" owner:nil options:nil] lastObject];
    [self.detailView.likeBtn addTarget:self action:@selector(clickLikeBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.detailView.collectBtn addTarget:self action:@selector(clickCollectBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.detailView.shareBtn addTarget:self action:@selector(clickShareBtn:) forControlEvents:UIControlEventTouchUpInside];
    _detailView.frame = self.view.frame;
    _detailView.backgroundColor = [UIColor blackColor];
    //1.图片滚动视图
    [self setupScrollView];
    //2.文字介绍
    [self.view addSubview:_detailView];
}

- (void)setupScrollView {
    UIImage *placeImg = [RJNewsSingleton getPlaceHolderImage];
    self.detailView.picScrollView.contentSize = CGSizeMake(self.pictures.count * RJScreenW, 0);
    UIImageView *imgView;
    CGFloat scrollViewH = self.detailView.picScrollView.frame.size.height;
    NSInteger i = 0;
    for (RJPictureCellPMObjectData *pic in self.pictures) {
        imgView = [[UIImageView alloc] init];
        NSURL *url = [[NSURL alloc] initWithString:pic.kpic];
        [imgView sd_setImageWithURL:url placeholderImage:placeImg];
        imgView.frame = CGRectMake(i * RJScreenW, 0, RJScreenW, scrollViewH);
        i++;
        [self.detailView.picScrollView addSubview:imgView];
    }
    self.detailView.picScrollView.pagingEnabled = YES;
    self.detailView.picScrollView.delegate = self;
}


- (void)setupIntroView:(NSUInteger)index {
    self.detailView.longTitleText.text = self.data.long_title;
    self.detailView.picNumText.text = [NSString stringWithFormat:@"%d/%d", index + 1, self.pictures.count];
    RJPictureCellPMObjectData *data = self.pictures[index];
    self.detailView.introText.text = data.alt;
}


- (void)loadPictureData {
    NSString *urlString = [KPicture stringByAppendingString:self.pictureModel.id];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequestCachePolicy cachePolicy = NSURLRequestReturnCacheDataElseLoad;
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url cachePolicy:cachePolicy timeoutInterval:10];
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        RJPictureCellJsonToModel *result = [RJPictureCellJsonToModel objectWithKeyValues:dic];
        RJPictureCellData *picData = result.data;
        [self analysisPicData:picData];
    }];
}

#pragma mark 获取图片信息

- (void)analysisPicData:(RJPictureCellData *)picData {
    _data = picData;
    _pictures = [NSMutableArray array];
    RJPictureCellPM *datas = picData.pics_module;
    for (RJPictureCellPMObject *object in datas) {
        NSArray *pmData = (id) object.data;
        for (RJPictureCellPMObjectData *objectData in pmData) {
            [_pictures addObject:objectData];
        }
    }
    [self setupDetailView];
    [self setupIntroView:0];
    [self setupButtonState:[self findModel]];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSUInteger index = (NSUInteger) ((scrollView.contentOffset.x) / RJScreenW);
    [self setupIntroView:index];
}

#pragma mark 更改按钮图片

- (void)setupButtonState:(RJColloectModel *)model {
    NSDictionary *imgDict = [self getBtnImages:model];
    [self.detailView.likeBtn setImage:imgDict[@"likeBtn"] forState:UIControlStateNormal];
    [self.detailView.shareBtn setImage:imgDict[@"shareBtn"] forState:UIControlStateNormal];
    [self.detailView.collectBtn setImage:imgDict[@"collectBtn"] forState:UIControlStateNormal];
}

- (void)clickLikeBtn:(UIButton *)btn {
    RJColloectModelService *service = [[RJColloectModelService alloc] init];
    RJColloectModel *model = [service findModel:[self findModel]];
    if ([@"yes" isEqualToString:model.isLiked]) {
        model.isLiked = @"no";
    }else{
        model.isLiked = @"yes";
    }
    [service updateModel:model];
    [self setupButtonState:model];
}

- (void)clickCollectBtn:(UIButton *)btn {
    RJColloectModelService *service = [[RJColloectModelService alloc] init];
    RJColloectModel *model = [service findModel:[self findModel]];
    if ([@"yes" isEqualToString:model.isCollected]) {
        model.isCollected = @"no";
    }else{
        model.isCollected = @"yes";
    }
    [service updateModel:model];
    [self setupButtonState:model];
}

- (void)clickShareBtn:(UIButton *)btn {
    RJColloectModelService *service = [[RJColloectModelService alloc] init];
    RJColloectModel *model = [service findModel:[self findModel]];
    if ([@"yes" isEqualToString:model.isShared]) {
        model.isShared = @"no";
    }else{
        model.isShared = @"yes";
    }
    [service updateModel:model];
    [self setupButtonState:model];
}

- (RJColloectModel *)findModel {
    RJColloectModelService *service = [[RJColloectModelService alloc] init];
    RJColloectModel *model = [[RJColloectModel alloc] init];
    model.id = _data.id;
    model.title = _data.long_title;
    model.url = [KPicture stringByAppendingString:_data.id];
    model = [service findModel:model];
    return model;
}


- (NSDictionary *)getBtnImages:(RJColloectModel *)model {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    if ([@"yes" isEqualToString:model.isCollected]) {
        UIImage *img = [UIImage imageNamed:@"ic_title_collect.png"];
        dict[@"collectBtn"] = img;
    } else {
        UIImage *img = [UIImage imageNamed:@"ic_title_collect_pic.png"];
        dict[@"collectBtn"] = img;
    }

    if ([@"yes" isEqualToString:model.isShared]) {
        UIImage *img = [UIImage imageNamed:@"ic_living_feed_compete_share.png"];
        dict[@"shareBtn"] = img;
    } else {
        UIImage *img = [UIImage imageNamed:@"ic_live_event_title_share_n.png"];
        dict[@"shareBtn"] = img;
    }

    if ([@"yes" isEqualToString:model.isLiked]) {
        UIImage *img = [UIImage imageNamed:@"ic_title_has_liked.png"];
        dict[@"likeBtn"] = img;
    } else {
        UIImage *img = [UIImage imageNamed:@"ic_title_like_pic.png"];
        dict[@"likeBtn"] = img;
    }
    return dict;
}
@end
