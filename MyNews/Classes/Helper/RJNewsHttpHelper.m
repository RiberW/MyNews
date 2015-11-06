//
//  ProjectArchitecture
//
//  Created by wjdtyp on 15/7/30.
//  Copyright (c) 2015年 wjdtyp. All rights reserved.
//
#import "RJNewsHttpHelper.h"
#import "RJRequestParam.h"

@implementation RJNewsHttpHelper

#pragma mark AFN异步get请求
//
//+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure {
//    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    [mgr GET:url parameters:params
//     success:^(AFHTTPRequestOperation *operation, id responseObj) {
//         if (success) {
//             success(responseObj);
//         }
//     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                if (failure) {
//                    failure(error);
//                }
//            }];
//}
//
//#pragma mark AFN异步Post请求
//
//+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure {
//    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    [mgr POST:url parameters:params
//      success:^(AFHTTPRequestOperation *operation, id responseObj) {
//          if (success) {
//              success(responseObj);
//          }
//      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                if (failure) {
//                    failure(error);
//                }
//            }];
//}

#pragma mark 系统同步请求

+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure {

}

+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure {

}

+ (void)loadDataWithParam:(RJRequestParam *)param success:(void (^)(NSURLResponse *response, NSData *data))success failure:(void (^)(NSError *connectionError))failure {
    [NSURLConnection sendAsynchronousRequest:nil queue:nil completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if (data) {
            success(response, data);
        } else {
            failure(error);
        }
    }];
}

+ (NSDictionary *)synRequestWithParam:(RJRequestParam *)param {
    NSURL *url = [NSURL URLWithString:param.urlString];
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url cachePolicy:param.cachePolicy timeoutInterval:param.timeInterval];
    NSData *data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:nil error:nil];
    NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    return dic;
}

#pragma mark 系统异步请求

+ (void)aSynRequestWithParam:(RJRequestParam *)param completion:(void (^)(NSURLResponse *response, NSData *data, NSError *connectionError))completion {
    //TODO 可能需要重组url以及请求url
    NSString *urlStr = [self setupParam:param];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url cachePolicy:param.cachePolicy timeoutInterval:param.timeInterval];
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:[NSOperationQueue mainQueue] completionHandler:completion];
}

+ (NSString *)setupParam:(RJRequestParam *)param {
    if (!param.params) {
        return param.urlString;
    }
    NSDictionary *dict = param.params;
    NSMutableString *url = [[NSMutableString alloc] init];
    for (int i = 0; i < dict.allKeys.count; i++) {
        NSString *key = dict.allKeys[i];
        if (i == dict.allKeys.count - 1) {
            [url appendFormat:@"&%@=%@", key, dict[key]];
        } else {
            [url appendFormat:@"&%@=%@&", key, dict[key]];
        }
    }
    return [param.urlString stringByAppendingFormat:@"%@", url];
}
@end
