//
// Created by wjdtyp on 15/8/1.
// Copyright (c) 2015 JaguarTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RJNewsPictureData;
@interface RJNewsJsonToPicture : NSObject
@property(nonatomic, strong) NSString *status;
@property(nonatomic, strong) RJNewsPictureData *data;
@end