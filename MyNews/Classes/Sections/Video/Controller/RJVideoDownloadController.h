//
// Created by wjdtyp on 15/9/3.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RJNewsTypeController.h"
#import "RJFileDownloadManager.h"

@interface RJVideoDownloadController : UIViewController
@property(nonatomic, strong) NSString *fileURL;
@property(nonatomic, retain) UIProgressView *progressView;
@end