//
// Created by wjdtyp on 15/8/28.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//
#import <UIKit/UIKit.h>
@interface RJNewsWebViewController : UIViewController <UIWebViewDelegate>
@property(nonatomic, strong) UIWebView *webView;
@property(nonatomic, strong) NSString *urlString;
@end