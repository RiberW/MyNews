//
// Created by wjdtyp on 15/9/3.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RJFileDownloadManager : NSObject
@property(nonatomic, strong) NSString *url;
@property(nonatomic, strong) void (^completionHandler)();

+ (instancetype)shareManager;

- (void)downLoadFileWithURL:(NSString *)url
               withFileName:(NSString *)fileName
              progressBlock:(void (^)(CGFloat progress))progressBlock
            completionBlock:(void (^)(BOOL completed))completionBlock
       enableBackgroundMode:(BOOL)backgroundMode;

- (void)cancelAllDownloads;

- (void)cancelDownloadForURL:(NSString *)fileIdentifier;
@end