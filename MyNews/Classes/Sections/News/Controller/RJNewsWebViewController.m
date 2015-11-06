//
// Created by wjdtyp on 15/8/28.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import <MJExtension/NSObject+MJKeyValue.h>
#import "RJNewsWebViewController.h"
#import "RJNews.h"
#import "MBProgressHUD.h"
#import "MBProgressHUD+MJ.h"
#import "RJNewsCellJsonToModel.h"
#import "RJNewsCellData.h"
#import "RJNewsCellDataPics.h"
#import "RJNewsCellDataPicsObject.h"
#import "RJNewsCellDataPicsData.h"

@interface RJNewsWebViewController()
@property(nonatomic, strong) NSString *pubDate;
@property(nonatomic, strong) NSString *source;
@property(nonatomic, strong) NSMutableString *content;
@property(nonatomic, strong) NSString *newsTitle;
@property(nonatomic, strong) NSMutableArray *picsArray; //XLNewsCellDataPicsData
@property(nonatomic, strong) NSMutableArray *vmArray;   //XLNewsCellDataVMObjectDataVI
@end
@implementation RJNewsWebViewController {

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupWebView];
    [self loadWebData];
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

- (void)loadWebData {
    [MBProgressHUD showMessage:@"正在加载中..."];
    NSURL *url = [NSURL URLWithString:self.urlString];
    NSURLRequestCachePolicy cachePolicy = NSURLRequestReturnCacheDataElseLoad;
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url cachePolicy:cachePolicy timeoutInterval:10];
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:nil];
        NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        RJNewsCellJsonToModel *result = [RJNewsCellJsonToModel objectWithKeyValues:dic];
        RJNewsCellData *newsData = result.data;
        [self analyseData:newsData];
    }];
}

- (void)analyseData:(RJNewsCellData *)newsData {
    self.newsTitle = newsData.title;
    self.source = newsData.source;
    self.pubDate = newsData.pub_date;

    //TODO 有新闻不存在的情况

    NSTimeInterval time = [self.pubDate doubleValue];
    NSDate *detailDate = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *currentDateStr = [dateFormatter stringFromDate:detailDate];

    self.content = [[NSMutableString alloc] initWithCapacity:25];

    NSString *htmlPubDate = [NSString stringWithFormat:@"<span style='margin-left:-%fpx;font-size:12px'/>%@</span><br/>", XRF(30), currentDateStr];

    [self.content appendString:htmlPubDate];
    NSString *htmlTitle = [NSString stringWithFormat:@"<span style='margin-left:-%fpx;font-size:18px;font-weight:bold;'/>%@</span><br/><hr/>", XRF(30), self.newsTitle];
    [self.content appendString:htmlTitle];
    [self.content appendFormat:@"<p style='text-indent:%fpx;'>", XRF(34)];
    [self.content appendString:newsData.content];

    //2.<a></a>标签处理
    NSArray *newsArray = [self.content componentsSeparatedByString:@"</a>"];
    NSMutableString *newsLineStr = [[NSMutableString alloc] initWithCapacity:newsArray.count];
    for (NSString *str in newsArray) {
        if (str == nil || [str length] == 0) {
            continue;
        }
        NSRange range = [str rangeOfString:@"<a(\\s*?)[^>]*>" options:NSRegularExpressionSearch];
        NSString *stra;//TODO It may be a bug
        if (range.location != NSNotFound) {
            stra=[str stringByReplacingCharactersInRange:range withString:@""];
        }else{
            stra=str;
        }
        NSRange rangeweibo = [stra rangeOfString:@"[微博]"];
        if (rangeweibo.location != NSNotFound) {
            stra=[stra stringByReplacingCharactersInRange:rangeweibo withString:@""];
        }else{
            stra=str;
        }
        [newsLineStr appendString:stra];
    }

    //3.分段
    NSArray *strArray = [newsLineStr componentsSeparatedByString:@"<br/>"];
    NSMutableString *lineNewsStr = [[NSMutableString alloc] initWithCapacity:newsArray.count];
    for (NSString *string in strArray) {
        if (string == nil || [string length] == 0) {
            continue;
        }
        NSString *prefx = [NSString stringWithFormat:@"<p style='text-indent:%fpx;text-align:justify;width:%fpx;'>", XRF(30),XRF(360)];
        NSString *prefix = [prefx stringByAppendingString:string];
        NSString *subfix = [prefix stringByAppendingString:@"</p>"];
        [lineNewsStr appendString:subfix];
    }
    self.content = lineNewsStr;

    //4.新闻图片
    RJNewsCellDataPics *pics = newsData.pics;
    if (pics != nil && pics.count > 0) {
        self.picsArray = [NSMutableArray arrayWithCapacity:pics.count];
        RJNewsCellDataPicsObject *picObject;
        RJNewsCellDataPicsData *pic;
        for (int i = 1; i < pics.count + 1; i++) {
            picObject = pics[i - 1];
            pic = picObject.data;
            NSString *repString = [NSString stringWithFormat:@"<!--{IMG_%d}-->", i];
            NSString *imgStr = [NSString stringWithFormat:@"<img src='%@' style='margin-left:-%fpx;width:%f;height:%@'/>", pic.kpic, XRF(30), XRF(360), pic.height];
            NSRange range = [self.content rangeOfString:repString];
            if (range.location != NSNotFound) {
                imgStr = [imgStr stringByAppendingFormat:@"<br/><span style='font-size:%fpx;display:inline'>%@</span>", XRF(12), pic.alt];
                [self.content replaceCharactersInRange:range withString:imgStr];
            }
        }
    }
    [self.content appendString:@"</p>"];
    [_webView loadHTMLString:self.content baseURL:nil];
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUD];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [MBProgressHUD hideHUD];
}
@end