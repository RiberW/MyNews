//
// Created by wjdtyp on 15/8/24.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import "RJVideoViewController.h"
#import "RJNewsSingleton.h"
#import "MBProgressHUD.h"
#import "RJNewsJsonToVideo.h"
#import <MediaPlayer/MediaPlayer.h>

@interface RJVideoViewController ()
@end

@implementation RJVideoViewController {

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"视频";
    [self setupTableDelegate];
    [self setupNewsType];
}

- (void)setupTableDelegate {
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}


- (void)setupNewsType {
    RJNewsVideoList *array = [RJNewsSingleton getVideoType];
    self.jsonToModel = [RJNewsJsonToVideo class];
    self.keyPath = @"data.list";
    [self setupNewsTypeScrollView:array];
}
@end