//
// Created by wjdtyp on 15/8/1.
// Copyright (c) 2015 JaguarTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RJNewsPictureListPics;
@class RJNewsPictureListPicsCCI;
@interface RJNewsPictureListObject : NSObject
@property(nonatomic, strong) NSString *id;
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *long_title;
@property(nonatomic, strong) NSString *source;
@property(nonatomic, strong) NSString *link;
@property(nonatomic, strong) NSString *pic;
@property(nonatomic, strong) NSString *kpic;
@property(nonatomic, strong) NSString *intro;
@property(nonatomic, strong) NSString *pubDate;
@property(nonatomic, strong) NSString *comments;
@property(nonatomic, strong) RJNewsPictureListPics *pics;
@property(nonatomic, strong) NSString *category;
@property(nonatomic, strong) NSString *comment;
@property(nonatomic, strong) RJNewsPictureListPicsCCI *comment_count_info;
@end