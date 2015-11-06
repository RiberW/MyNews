//
// Created by wjdtyp on 15/8/25.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import "RJNewsTypeController.h"
#import "RJNewsTypeButton.h"
#import "RJNewsNewsHelper.h"
#import "RJRequestParam.h"
#import "NSObject+MJKeyValue.h"
#import "MJRefreshNormalHeader.h"
#import "MJRefreshBackNormalFooter.h"
#import "RJNews.h"
#import "MJExtension.h"
#import "RJNewsNewsListObject.h"
#import "CellStrategy.h"
#import "CellContext.h"
#import "RJCustomCellHelper.h"
#import "RJCustomCell.h"
#import "RJCustomVIDEOCell.h"
#import "RJNewsNewsListObjectVI.h"
#import "MBProgressHUD.h"
#import <MediaPlayer/MediaPlayer.h>

@interface RJNewsTypeController () <UIGestureRecognizerDelegate>
@property(nonatomic, strong) MPMoviePlayerViewController *videoplayer;
@end

@implementation RJNewsTypeController {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self setupTableView];
    [self setupRefreshHeaderAndFooter];
}

- (void)setupNewsTypeScrollView:(NSArray *)array {
    RJNewsTypeScrollView *newsTypeScrollView = [RJNewsTypeScrollView new];
    [self.view addSubview:newsTypeScrollView];
    newsTypeScrollView = [newsTypeScrollView initWithArray:array];
    newsTypeScrollView.delegate = self;
}

- (void)setupTableView {
    self.dataSource = [NSMutableArray array];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, typeScrollHeight, RJScreenW, RJScreenH - typeScrollHeight) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
}

- (void)setupRefreshHeaderAndFooter {
    self.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
    self.footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
    self.tableView.header = self.header;
    self.tableView.footer = self.footer;
    self.header.automaticallyChangeAlpha = YES;
}

- (void)loadData {
    [RJNewsNewsHelper loadNewsDataWithParam:self.param success:^(NSDictionary *dict) {
        [self endLoadData];
        id result = [self.jsonToModel objectWithKeyValues:dict];
        NSMutableArray *data = [result valueForKeyPath:self.keyPath];
        [self isNilOrFailure:data];
        NSMutableArray *reconfigData = [RJNewsNewsHelper reconfigData:data];
        [self.dataSource addObjectsFromArray:reconfigData];
        [self endLoadData];
        [self.tableView reloadData];
    }failure:^(NSError *error) {
        [self endLoadData];
        [self loadDataFailure];
        NSLog(@"%@", error);
    }];
}

- (void)isNilOrFailure:(NSMutableArray *)data {
    if (data == nil || data.count == 0)
        [self loadDataFailure];
}

- (void)loadDataFailure {
    self.page = self.page > 2 ? self.page-- : self.page;
}

- (void)endLoadData {
    if (self.page == 1) {
        [self.dataFrames removeAllObjects];
        [self.tableView.header endRefreshing];
    } else {
        [self.tableView.footer endRefreshing];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger index = (NSUInteger) indexPath.row;
    return [RJCustomCellHelper forCellHeightWithData:self.dataSource[index]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger index = (NSUInteger) indexPath.row;
    RJCustomCell *cell = [RJCustomCellHelper createCustomCell:self.dataSource[index] tableView:tableView];
    //TODO  why the follow isn't be deleted
    if (cell == nil) {
        return [[RJCustomCell alloc] init];
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger index = (NSUInteger) indexPath.row;
    RJNewsNewsListObject *data = self.dataSource[index];
    RJCustomCell *cell = (RJCustomCell *) [tableView cellForRowAtIndexPath:indexPath];
    [self handleCell:cell data:data];
}

- (void)handleCell:(RJCustomCell *)cell data:(RJNewsNewsListObject *)data {
    BOOL isHDPICCell = [cell isKindOfClass:[RJCustomVIDEOCell class]];
    BOOL isImageView = [cell.touchedView isKindOfClass:[UIImageView class]];
    if (isHDPICCell) {
        if (isImageView) {
            RJCustomVIDEOCell *videoCell = (RJCustomVIDEOCell *) cell;
            [self playVideoWithCell:videoCell data:data];
            return;
        }
        BOOL isUILabel = [cell.touchedView isKindOfClass:[UILabel class]];
        if (isUILabel) {
            [_videoplayer.moviePlayer stop];
            [self pushControllerWithData:data];
            return;
        }
        return;
    }
    [self pushControllerWithData:data];
}

- (void)pushControllerWithData:(RJNewsNewsListObject *)data {
    CellStrategy *strategy = [[CellStrategy alloc] initWithData:data];
    CellContext *context = [[CellContext alloc] initWithStrategy:strategy];
    UIViewController *controller = [context createController];
    [self.navigationController pushViewController:controller animated:YES];

}

- (void)playVideoWithCell:(RJCustomVIDEOCell *)cell data:(RJNewsNewsListObject *)data {
    [_videoplayer.moviePlayer stop];
    self.videoplayer.view.frame = cell.imgView.frame;
    _videoplayer.moviePlayer.contentURL = [NSURL URLWithString:data.video_info.url];
    [cell.imgView.superview addSubview:self.videoplayer.view];
    [MBProgressHUD showHUDAddedTo:self.videoplayer.view animated:NO];
    [_videoplayer.moviePlayer play];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playVideoFinished:) name:MPMoviePlayerPlaybackDidFinishNotification object:[_videoplayer moviePlayer]];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playVideoStarted:) name:MPMoviePlayerLoadStateDidChangeNotification object:[_videoplayer moviePlayer]];
}

- (MPMoviePlayerViewController *)videoplayer {
    if (_videoplayer == nil) {
        self.videoplayer = [[MPMoviePlayerViewController alloc] init];
        _videoplayer.moviePlayer.scalingMode = MPMovieScalingModeAspectFill;
        _videoplayer.moviePlayer.controlStyle = MPMovieControlStyleNone;
    }
    return _videoplayer;
}

- (void)playVideoStarted:(NSNotification *)sender {
    [MBProgressHUD hideAllHUDsForView:self.videoplayer.view animated:NO];
}


- (void)playVideoFinished:(NSNotification *)sender {
    [self.videoplayer.view removeFromSuperview];
    _videoplayer = nil;
}

- (void)refresh {
    [self.videoplayer.view removeFromSuperview];
    self.param = [[RJRequestParam alloc] initWithParamModel:newsNewsRequestModel];
    NSString *url = [self.selectBtn.object valueForKey:@"url"];
    self.param.urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    self.page = 1;
    dict[@"p"] = @(self.page);
    self.param.params = dict;
    [self loadData];
}

- (void)loadMore {
    self.param = [[RJRequestParam alloc] initWithParamModel:newsNewsRequestModel];
    NSString *url = [self.selectBtn.object valueForKey:@"url"];
    self.param.urlString = url;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"p"] = @(++self.page);
    self.param.params = dict;
    [self loadData];
}

- (void)newsTypeClick:(RJNewsTypeButton *)btn {
    [self.videoplayer.view removeFromSuperview];
    [self.dataSource removeAllObjects];
    [self.tableView reloadData];
    self.selectBtn = btn;
    [self.tableView.header beginRefreshing];
}
@end