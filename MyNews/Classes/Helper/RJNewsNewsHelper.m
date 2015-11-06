//
// Created by wjdtyp on 15/8/20.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//
#import <objc/runtime.h>
#import "RJNewsNewsHelper.h"
#import "RJNewsHttpHelper.h"
#import "RJRequestParam.h"
#import "RJNewsJsonToNews.h"
#import "RJNewsNewsList.h"
#import "RJNewsNewsData.h"
#import "RJNewsNewsListObject.h"

@implementation RJNewsNewsHelper {

    
}
#pragma mark 加载新闻

+ (void)loadNewsDataWithParam:(RJRequestParam *)param success:(void (^)(NSDictionary *dict))success failure:(void (^)(NSError *error))failure {
    [RJNewsHttpHelper aSynRequestWithParam:param completion:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (data == nil) {
            failure(connectionError);
        } else {
            NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            success(dict);
        }
    }];
}

#pragma mark data中是否包含is_focus

+ (BOOL)isContainsKey:(id)data {
    unsigned int numIvars;
    Ivar *vars = class_copyIvarList([data class], &numIvars);
    NSString *key = nil;
    for (int i = 0; i < numIvars; i++) {
        Ivar thisIvar = vars[i];
        key = [NSString stringWithUTF8String:ivar_getName(thisIvar)];
        if ([key isEqualToString:@"_is_focus"]) {
            BOOL flag = [[data valueForKey:@"is_focus"] boolValue];
            return flag;
        }
    }
    free(vars);
    return NO;
}

#pragma mark 重组数据源,获取Cell[0]

+ (NSMutableArray *)reconfigData:(NSMutableArray *)list {
    NSMutableArray *listScroll = [NSMutableArray arrayWithCapacity:5];
    NSMutableArray *listOther = [NSMutableArray arrayWithCapacity:20];
    NSMutableArray *listTotal = [NSMutableArray arrayWithCapacity:25];
    for (id obj in list) {
        BOOL flag = [self isContainsKey:obj];
        if (obj && flag) {
            [listScroll addObject:obj];
            continue;
        }
        [listOther addObject:obj];
    }
    if (listScroll.count > 0) {
        [listTotal addObject:listScroll];
    }
    [listTotal addObjectsFromArray:listOther];
    return listTotal;
}
@end