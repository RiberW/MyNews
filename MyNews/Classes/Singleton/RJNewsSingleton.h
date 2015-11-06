//
// Created by wjdtyp on 15/8/25.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RJNewsHttpHelper.h"
#import "RJSingleton.h"

@class RJNewsNewsHeadLinesList;
@class RJNewsHdpicList;
@class RJNewsData;
@class RJNewsVideoList;
@class FMDatabase;

@interface RJNewsSingleton : NSObject
RJSingletonH(RJNewsSingleton)

@property(nonatomic, strong)RJNewsData *newsData;
@property(nonatomic, retain) FMDatabase *db;

+ (RJNewsNewsHeadLinesList *)getNewsType;

+ (RJNewsHdpicList *)getPictureType;

+ (RJNewsVideoList *)getVideoType;

+ (UIImage *)getPlaceHolderImage;

+ (void)connectFMDB ;

@end