//
// Created by wjdtyp on 15/8/8.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RJNewsVideoDataObjectVI;
@interface RJNewsVideoDataObject : NSObject
@property(nonatomic, retain) NSString *id;
@property(nonatomic, retain) NSString *title;
@property(nonatomic, retain) NSString *long_title;
@property(nonatomic, retain) NSString *source;
@property(nonatomic, retain) NSString *link;
@property(nonatomic, retain) NSString *pic;
@property(nonatomic, retain) NSString *kpic;
@property(nonatomic, retain) NSString *intro;
@property(nonatomic, retain) NSString *pubDate;
@property(nonatomic, retain) RJNewsVideoDataObjectVI *video_info;
@property(nonatomic, retain) NSString *category;
@end