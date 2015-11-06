//
// Created by wjdtyp on 15/9/3.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import "RJFileDownloadManager.h"
#import "RJFileDownloadModel.h"

@interface RJFileDownloadManager () <NSURLSessionDelegate, NSURLSessionDownloadDelegate>
@property(strong, nonatomic) NSURLSession *session;
@property(strong, nonatomic) NSURLSession *backgroundSession;
@property(strong, nonatomic) NSMutableDictionary *downloads;
@end

@implementation RJFileDownloadManager {

}



- (instancetype)init {
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
        NSURLSessionConfiguration *backgroundConfiguration = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"wjdtyp"];
        if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_7_1) {
            backgroundConfiguration = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"wjdtyp"];
        }
        self.backgroundSession = [NSURLSession sessionWithConfiguration:backgroundConfiguration delegate:self delegateQueue:nil];
        self.downloads = [NSMutableDictionary new];
    }
    return self;
}


+ (instancetype)shareManager {
    static RJFileDownloadManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[RJFileDownloadManager alloc] init];
    });

    return _sharedManager;
}

- (void)cancelAllDownloads {

}

- (void)cancelDownloadForURL:(NSString *)fileIdentifier {

}


- (void)downLoadFileWithURL:(NSString *)urlString
               withFileName:(NSString *)fileName
              progressBlock:(void (^)(CGFloat progress))progressBlock
            completionBlock:(void (^)(BOOL completed))completionBlock
       enableBackgroundMode:(BOOL)backgroundMode {
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    NSURLSessionDownloadTask *downloadTask;
    if (backgroundMode) {
        downloadTask = [self.backgroundSession downloadTaskWithRequest:request];
    } else {
        downloadTask = [self.session downloadTaskWithRequest:request];
    }
    RJFileDownloadModel *downloadModel = [[RJFileDownloadModel alloc] initWithDownloadTask:downloadTask
                                                                             progressBlock:progressBlock
                                                                           completionBlock:completionBlock];
    downloadModel.progressBlock = progressBlock;
    downloadModel.completionBlock = completionBlock;
    downloadModel.downloadTask = downloadTask;
    downloadModel.fileName = @"ios8.pdf";
    [self.downloads addEntriesFromDictionary:@{urlString : downloadModel}];
    [downloadTask resume];
}

#pragma mark - NSURLSession Delegate

/*执行下载任务时有数据写入*/

- (void)       URLSession:(NSURLSession *)session
             downloadTask:(NSURLSessionDownloadTask *)downloadTask
             didWriteData:(int64_t)bytesWritten
        totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    NSString *fileIdentifier = downloadTask.originalRequest.URL.absoluteString;
    RJFileDownloadModel *download = self.downloads[fileIdentifier];
    if (download.progressBlock) {
        CGFloat progress = (CGFloat) totalBytesWritten / (CGFloat) totalBytesExpectedToWrite;
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            download.progressBlock(progress);
        });
    }
}

- (NSURL *)cachesDirectoryUrlPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesDirectory = paths[0];
    NSURL *cachesDirectoryUrl = [NSURL fileURLWithPath:cachesDirectory];
    return cachesDirectoryUrl;
}


- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    NSError *error;
    NSURL *destinationLocation;
    NSString *fileIdentifier = downloadTask.originalRequest.URL.absoluteString;
    RJFileDownloadModel *download = self.downloads[fileIdentifier];
    destinationLocation = [[self cachesDirectoryUrlPath] URLByAppendingPathComponent:download.fileName];
    [[NSFileManager defaultManager] moveItemAtURL:location
                                            toURL:destinationLocation
                                            error:&error];
    if (error) {
        NSLog(@"ERROR: %@", error);
    }
    if (download.completionBlock) {
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            download.completionBlock(YES);
        });
    }
    [self.downloads removeObjectForKey:fileIdentifier];
}
@end