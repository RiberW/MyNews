//
//  RJAppDelegate.h
//  MyNews
//
//  Created by wjdtyp on 15/8/24.
//  Copyright (c) 2015 wjdtyp. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "CoreStatusProtocol.h"


@interface RJAppDelegate : UIResponder <UIApplicationDelegate, CoreStatusProtocol>

@property (strong, nonatomic) UIWindow *window;

@end
