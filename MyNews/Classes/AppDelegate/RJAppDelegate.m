//
//  RJAppDelegate.m
//  MyNews
//
//  Created by wjdtyp on 15/8/24.
//  Copyright (c) 2015 wjdtyp. All rights reserved.
//


#import "RJAppDelegate.h"
#import "RJTabBarController.h"
#import "CoreStatus.h"
#import "RJNewsSingleton.h"

@interface RJAppDelegate ()

@end

@implementation RJAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [CoreStatus beginNotiNetwork:self];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [self connectDataBase];
    [self setupNav];
    return YES;
}

- (void)setupNav {
    RJTabBarController *_tabBar = [[RJTabBarController alloc] init];
    _tabBar.navigationController.navigationBarHidden = YES;
    self.window.rootViewController = _tabBar;
}

- (void)connectDataBase {
    [RJNewsSingleton connectFMDB];
}

- (void)coreNetworkChangeNoti:(NSNotification *)noti {
    NSString *statusString = [CoreStatus currentNetWorkStatusString];
    NSLog(@"%@", statusString);
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {

}

- (NetworkStatus)currentStatus {
    return ReachableViaWiFi;
}

- (void)setCurrentStatus:(NetworkStatus)currentStatus {

}
@end