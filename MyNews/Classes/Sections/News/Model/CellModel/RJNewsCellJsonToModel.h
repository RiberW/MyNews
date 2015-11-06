//
// Created by wjdtyp on 15/8/9.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RJNewsCellData;
@interface RJNewsCellJsonToModel : NSObject
@property(nonatomic, strong) NSString *status;
@property(nonatomic, strong) RJNewsCellData *data;
@end