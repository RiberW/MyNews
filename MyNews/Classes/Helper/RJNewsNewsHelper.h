//
// Created by wjdtyp on 15/8/20.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RJNewsHttpHelper;
@class RJRequestParam;
@class RJNewsJsonToNews;

@interface RJNewsNewsHelper : NSObject
+(void)loadNewsDataWithParam:(RJRequestParam *)param success:(void(^)(NSDictionary *dict))success failure:(void(^)(NSError *error))failure;
+ (NSMutableArray *)reconfigData:(NSMutableArray *)news;
@end