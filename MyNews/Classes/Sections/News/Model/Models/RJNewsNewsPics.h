//
// Created by wjdtyp on 15/7/30.
// Copyright (c) 2015 JaguarTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RJNewsNewsPicsList;


@interface RJNewsNewsPics : NSObject
@property(nonatomic, strong) NSString *total;
@property(nonatomic, strong) NSString *picTemplate;
@property(nonatomic, strong) RJNewsNewsPicsList *list;
@end