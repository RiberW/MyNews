//
//  RJTabBarController.m
//  News
//
//  Created by wjdtyp on 15/7/30.
//  Copyright (c) 2015年 wjdtyp. All rights reserved.
//

#import "RJTabBarController.h"
#import "RJPictureViewController.h"
#import "RJVideoViewController.h"
#import "RJSettingViewController.h"
#import "RJNewsViewController.h"
#import "RJNews.h"

@interface RJTabBarController ()

@end

@implementation RJTabBarController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        RJNewsViewController *_newsVC = [[RJNewsViewController alloc] init];
        UINavigationController *_newsNC = [[UINavigationController alloc] initWithRootViewController:_newsVC];
        [self addOneChlildVc:_newsNC title:@"新闻" imageName:@"channel_hot_unselected" selectedImageName:@"channel_hot_selected"];

        RJPictureViewController *_pictureVC = [[RJPictureViewController alloc] init];
        UINavigationController *_pictureNC = [[UINavigationController alloc] initWithRootViewController:_pictureVC];
        [self addOneChlildVc:_pictureNC title:@"图片" imageName:@"channel_pic_unselected" selectedImageName:@"channel_pic_selected"];
        
        RJVideoViewController *_videoVC = [[RJVideoViewController alloc] init];
        UINavigationController *_videoNC = [[UINavigationController alloc] initWithRootViewController:_videoVC];
        [self addOneChlildVc:_videoNC title:@"视频" imageName:@"channel_video_unselected" selectedImageName:@"channel_video_selected"];

        RJSettingViewController *_settingVC = [[RJSettingViewController alloc] init];
        [self addOneChlildVc:_settingVC title:@"我的" imageName:@"ic_setting_normal" selectedImageName:@"ic_setting_selected"];
    }
    return self;
}

- (void)addOneChlildVc:(UINavigationController *)childNC title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    childNC.title = title;
    childNC.tabBarItem.image = [UIImage imageNamed:imageName];

    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [childNC.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    [childNC.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    if (kiOS7) {
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    childNC.tabBarItem.selectedImage = selectedImage;
    [self addChildViewController:childNC];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
