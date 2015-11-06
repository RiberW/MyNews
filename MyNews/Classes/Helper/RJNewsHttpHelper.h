//
//  ProjectArchitecture
//
//  Created by wjdtyp on 15/7/30.
//  Copyright (c) 2015年 wjdtyp. All rights reserved.
//
#import <Foundation/Foundation.h>

@class RJRequestParam;

@interface RJNewsHttpHelper : NSObject
+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;

+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;

+ (NSDictionary *)synRequestWithParam:(RJRequestParam *)param;

+ (void)aSynRequestWithParam:(RJRequestParam *)param completion:(void (^)(NSURLResponse *response, NSData *data, NSError *connectionError))completion;

+ (void)loadDataWithParam:(RJRequestParam *)param success:(void (^)(NSURLResponse *response, NSData *data))completion failure:(void (^)(NSError *connectionError))failure;
@end