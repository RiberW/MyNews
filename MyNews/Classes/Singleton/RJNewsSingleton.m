//
// Created by wjdtyp on 15/8/25.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import "RJNewsSingleton.h"
#import "RJNewsNewsHeadLinesList.h"
#import "RJNewsJsonToObject.h"
#import "MJExtension.h"
#import "RJRequestParam.h"
#import "RJNewsNewsHeadLines.h"
#import "RJNews.h"
#import "RJNewsVideoList.h"
#import "FMDatabase.h"

@implementation RJNewsSingleton

RJSingletonM(RJNewsSingleton)

+ (void)initialize {
    RJLog(@"====initialize====");
    RJNewsSingleton *newsTypeHelper = [RJNewsSingleton sharedRJNewsSingleton];
    RJRequestParam *param = [[RJRequestParam alloc] initWithParamModel:newsTypeRequestModel];
    NSDictionary *dictionary = [RJNewsHttpHelper synRequestWithParam:param];
    RJNewsJsonToObject *result = [RJNewsJsonToObject objectWithKeyValues:dictionary];
    newsTypeHelper.newsData = result.data;
}

+ (RJNewsNewsHeadLinesList *)getNewsType {
    RJNewsSingleton *newsTypeHelper = [RJNewsSingleton sharedRJNewsSingleton];
    RJNewsData *data = newsTypeHelper.newsData;
    RJNewsNewsHeadLinesList *list = data.groups.news2.headlines.list;
    return list;
}

+ (RJNewsHdpicList *)getPictureType {
    RJNewsSingleton *newsTypeHelper = [RJNewsSingleton sharedRJNewsSingleton];
    RJNewsData *data = newsTypeHelper.newsData;
    RJNewsHdpicList *list = data.groups.hdpic2.list;
    return list;
}

+ (RJNewsVideoList *)getVideoType {
    RJNewsSingleton *newsTypeHelper = [RJNewsSingleton sharedRJNewsSingleton];
    RJNewsData *data = newsTypeHelper.newsData;
    RJNewsVideoList *list = data.groups.video2.list;
    return list;
}

+ (UIImage *)getPlaceHolderImage {
    UIImage *placeImg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"channel_pic_unselected" ofType:@"png"]];
    return placeImg;
}

+ (void)connectFMDB {
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filename = [doc stringByAppendingPathComponent:@"rjcollectmodel.sqlite"];
    [RJNewsSingleton sharedRJNewsSingleton].db = [FMDatabase databaseWithPath:filename];
    if ([[RJNewsSingleton sharedRJNewsSingleton].db open]) {
        BOOL result = [[RJNewsSingleton sharedRJNewsSingleton].db executeUpdate:@"CREATE TABLE IF NOT EXISTS tb_collect (id integer PRIMARY KEY AUTOINCREMENT, "
                "model_id text NOT NULL,model_url text NOT NULL,model_title text,model_date text,model_type text,model_isLiked text,model_isCollected text,model_isShared text);"];
        if (result) {
            NSLog(@"Tb_collect table is created successfull!");
        } else {
            NSLog(@"Tb_collect table is created failure!");
        }
    }
}
@end