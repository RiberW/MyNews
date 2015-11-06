//
// Created by wjdtyp on 15/8/9.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RJNewsCellDataKeys;
@class RJNewsCellDataVM;
@class RJNewsCellDataPics;

@interface RJNewsCellData : NSObject
@property(nonatomic, strong) NSString *id;
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *long_title;
@property(nonatomic, strong) NSString *source;
@property(nonatomic, strong) NSString *link;
@property(nonatomic, strong) NSString *comments;
@property(nonatomic, strong) NSString *pub_date;
@property(nonatomic, strong) RJNewsCellDataKeys *keys;
@property(nonatomic, strong) RJNewsCellDataVM *videos_module;  //NSArray
@property(nonatomic, strong) RJNewsCellDataPics *pics;   //NSArray
@property(nonatomic, strong) NSString *content;
@property(nonatomic, strong) NSString *original_link;
@property(nonatomic, strong) NSString *share_lead;
@property(nonatomic, strong) NSString *message;
@end