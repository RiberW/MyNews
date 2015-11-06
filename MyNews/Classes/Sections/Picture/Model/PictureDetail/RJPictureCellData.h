//
// Created by wjdtyp on 15/8/7.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RJPictureCellPM;
@interface RJPictureCellData : NSObject
@property(nonatomic, retain) NSString *id;
@property(nonatomic, retain) NSString *title;
@property(nonatomic, retain) NSString *long_title;
@property(nonatomic, retain) NSString *source;
@property(nonatomic, retain) NSString *link;
@property(nonatomic, retain) NSString *cover_img;
@property(nonatomic, retain) NSString *comments;
@property(nonatomic, retain) NSString *pub_date;
@property(nonatomic, retain) RJPictureCellPM *pics_module;
@property(nonatomic, retain) NSString *content;
@property(nonatomic, retain) NSString *original_link;
@property(nonatomic, retain) NSString *share_lead;
@property(nonatomic, retain) NSString *message;
@end