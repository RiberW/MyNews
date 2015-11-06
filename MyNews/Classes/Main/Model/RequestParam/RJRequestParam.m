//
// Created by wjdtyp on 15/8/21.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//
/*
*  此类为创建网络请求参数,做到面向对象开发.
**/
#import "RJRequestParam.h"


@implementation RJRequestParam {

}
- (instancetype)initWithParamModel:(RequestParamModel)paramModel {
    self = [super init];
    if (self) {
        [self buildRequestModel:paramModel];
    }
    return self;
}

- (void)buildRequestModel:(RequestParamModel)model {
    switch (model) {
        case newsTypeRequestModel: {
            [self newsTypeRequestModel];
        }
            break;

        case newsNewsRequestModel: {
            [self newsNewsRequestModel];
        }
            break;

        case newsWebRequestModel: {
            [self newsWebRequestModel];
        }
            break;

    }
}

#pragma mark 新闻种类请求参数

- (void)newsTypeRequestModel {
    self.urlString = @"http://api.sina.cn/sinago/navlistv3.json";
    self.cachePolicy = NSURLRequestReturnCacheDataElseLoad;
    self.timeInterval = 20;
}

- (void)newsNewsRequestModel {
    self.cachePolicy = NSURLRequestReturnCacheDataElseLoad;
    self.timeInterval = 10;
}

- (void)newsWebRequestModel {
    self.cachePolicy = NSURLRequestReturnCacheDataElseLoad;
    self.timeInterval = 10;
}
@end