//
// Created by wjdtyp on 15/9/5.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RJNewsURLController : UIViewController <UIWebViewDelegate>
@property(nonatomic, strong) UIWebView *webView;
@property(nonatomic, strong) NSString *urlString;
@end