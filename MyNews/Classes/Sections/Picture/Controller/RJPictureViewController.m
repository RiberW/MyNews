//
// Created by wjdtyp on 15/8/24.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import "RJPictureViewController.h"
#import "RJNewsSingleton.h"
#import "RJNewsJsonToPicture.h"

@implementation RJPictureViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"图片";
    [self setupTableDelegate];
    [self setupNewsType];
}

- (void)setupTableDelegate {
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)setupNewsType {
    RJNewsHdpicList *array = [RJNewsSingleton getPictureType];
    self.jsonToModel = [RJNewsJsonToPicture class];
    self.keyPath = @"data.list";
    [self setupNewsTypeScrollView:array];
}
@end