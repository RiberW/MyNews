//
// Created by wjdtyp on 15/9/6.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface RJColloectModel : NSObject
@property(nonatomic, strong) NSString *id;
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *url;
@property(nonatomic, strong) NSDate *date;
@property(nonatomic, strong) NSString *type;
@property(nonatomic, strong) NSString *isLiked;
@property(nonatomic, strong) NSString *isCollected;
@property(nonatomic, strong) NSString *isShared;
@end