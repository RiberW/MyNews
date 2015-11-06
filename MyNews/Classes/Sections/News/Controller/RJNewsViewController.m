//
// Created by wjdtyp on 15/8/24.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//
#import "RJNewsViewController.h"
#import "RJNewsSingleton.h"
#import "RJNewsJsonToNews.h"
#import "RJPictureDetailController.h"

@interface RJNewsViewController ()

@end

@implementation RJNewsViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新闻";
    [self setupTableDelegate];
    [self setupNewsType];
}

- (void)setupTableDelegate {
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)setupNewsType {
    RJNewsNewsHeadLinesList *array = [RJNewsSingleton getNewsType];
    self.jsonToModel = [RJNewsJsonToNews class];
    self.keyPath = @"data.list";
    [self setupNewsTypeScrollView:array];
}
@end