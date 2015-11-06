//
// Created by wjdtyp on 15/9/3.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^RJDownloadProgressBlock)(CGFloat progress);
typedef void(^RJDownloadCompletionBlock)(BOOL completer);


@interface RJFileDownloadModel : NSObject
@property (copy, nonatomic) RJDownloadProgressBlock progressBlock;
@property (copy, nonatomic) RJDownloadCompletionBlock completionBlock;
@property (strong, nonatomic) NSURLSessionDownloadTask *downloadTask;
@property (copy, nonatomic) NSString *fileName;
- (instancetype)initWithDownloadTask:(NSURLSessionDownloadTask *)downloadTask
                       progressBlock:(RJDownloadProgressBlock)progressBlock
                     completionBlock:(RJDownloadCompletionBlock)completionBlock;
@end