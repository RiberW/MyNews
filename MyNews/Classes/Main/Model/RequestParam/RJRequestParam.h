//
// Created by wjdtyp on 15/8/21.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//
#import <UIKit/UIKit.h>

//定义枚举
typedef NS_ENUM(NSInteger, RequestParamModel) {
    newsTypeRequestModel=0,
    newsNewsRequestModel,
    newsWebRequestModel
};

@interface RJRequestParam : NSObject
@property(nonatomic, copy) NSString *urlString;                       //请求url
@property(nonatomic, assign) NSURLRequestCachePolicy cachePolicy;     //缓存策略
@property(nonatomic, assign) double timeInterval;                     //超时时间
@property(nonatomic, strong) NSMutableDictionary *params;             //参数字典
- (instancetype)initWithParamModel:(RequestParamModel)paramModel;     //创建请求对象
@end