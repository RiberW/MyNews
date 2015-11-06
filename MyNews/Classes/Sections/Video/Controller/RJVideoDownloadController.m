//
// Created by wjdtyp on 15/9/3.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import "RJVideoDownloadController.h"


@implementation RJVideoDownloadController {

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self setupFileDownload];
}


- (void)setupFileDownload {
    NSLog(@"%@",NSTemporaryDirectory());
    [[RJFileDownloadManager shareManager] downLoadFileWithURL:self.fileURL
                                                 withFileName:@"wjdtyp.mp4"
                                                progressBlock:^(CGFloat progress) {
                                                    NSLog(@"%f", progress);
                                                } completionBlock:^(BOOL completed) {
                NSLog(@"下载完成!");

            }                            enableBackgroundMode:self.accessibilityElementsHidden];
}

#pragma mark RJFileDownloaderDelegate

- (void)showProgress:(UIProgressView *)progressView value:(double)value {

}
@end