//
// Created by wjdtyp on 15/9/3.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import "RJFileDownloadModel.h"


@implementation RJFileDownloadModel {

}

- (instancetype)initWithDownloadTask:(NSURLSessionDownloadTask *)downloadTask
                       progressBlock:(RJDownloadProgressBlock)progressBlock
                     completionBlock:(RJDownloadCompletionBlock)completionBlock {
    self = [super init];
    if (self) {
        self.downloadTask = downloadTask;
        self.progressBlock = progressBlock;
        self.completionBlock = completionBlock;
    }
    return self;
}
@end