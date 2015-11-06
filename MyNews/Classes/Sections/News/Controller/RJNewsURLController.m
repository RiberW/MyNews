//
// Created by wjdtyp on 15/9/5.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import "RJNewsURLController.h"
#import "RJNews.h"


@implementation RJNewsURLController {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupWebView];
    [self.view addSubview:_webView];
}

- (void)setupWebView {
    NSURL *url = [NSURL URLWithString:self.urlString];
    NSURLRequest *ss = [[NSURLRequest alloc] initWithURL:url];
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, (XRF(W6)), RJScreenH)];
    _webView.delegate = self;
    [_webView setScalesPageToFit:NO];
    [_webView loadRequest:ss];
}
@end