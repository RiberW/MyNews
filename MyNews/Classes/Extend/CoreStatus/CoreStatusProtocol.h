//
// Created by wjdtyp on 15/8/22.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"

@protocol CoreStatusProtocol <NSObject>
@property(nonatomic, assign) NetworkStatus currentStatus;
@optional
-(void) coreNetworkChangeNoti:(NSNotification *)noti;
@end