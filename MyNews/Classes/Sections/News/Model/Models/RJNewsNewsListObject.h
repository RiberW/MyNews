//
// Created by wjdtyp on 15/7/31.
// Copyright (c) 2015 JaguarTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RJNewsNewsCommentCountInfo;
@class RJNewsNewsPics;
@class RJNewsNewsListObjectVI;

@interface RJNewsNewsListObject : NSObject
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
@property(nonatomic, strong) RJNewsNewsListObjectVI *video_info;
@property(nonatomic, strong) NSString *category;
@property(nonatomic, assign) BOOL is_focus;
@property(nonatomic, strong) NSString *comment;
@property(nonatomic, strong) RJNewsNewsPics *pics;
@property(nonatomic, strong) RJNewsNewsCommentCountInfo *comment_count_info;
@end