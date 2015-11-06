//
// Created by wjdtyp on 15/8/22.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import "CoreStatus.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
static NSString *const CoreStatusChangedNoti = @"CoreStatusChangedNoti";
@interface CoreStatus ()
@property(nonatomic, strong) NSArray *technology2GArray;
@property(nonatomic, strong) NSArray *technology3GArray;
@property(nonatomic, strong) NSArray *technology4GArray;
@property(nonatomic, strong) NSArray *coreNetworkStatusStringArray;
@property(nonatomic, strong) Reachability *reachability;
@property(nonatomic, strong) CTTelephonyNetworkInfo *telephonyNetworkInfo;
@property(nonatomic, copy) NSString *currentRaioAccess;
@property(nonatomic, assign) BOOL isNoti;
@end


@implementation CoreStatus
RJSingletonM(CoreStatus)

+ (void)initialize {
    CoreStatus *status = [CoreStatus sharedCoreStatus];
    status.telephonyNetworkInfo = [[CTTelephonyNetworkInfo alloc] init];
}

/** 获取当前网络状态：枚举 */
+ (CoreNetWorkStatus)currentNetWorkStatus {
    CoreStatus *status = [CoreStatus sharedCoreStatus];
    return [status statusWithRadioAccessTechnology];
}

/** 获取当前网络状态：字符串 */
+ (NSString *)currentNetWorkStatusString {
    CoreStatus *status = [CoreStatus sharedCoreStatus];
    //coreNetworkStatusStringArray===@[@"无网络",@"Wifi",@"蜂窝网络",@"2G",@"3G",@"4G",@"未知网络"];
    //这是一个枚举  自定义
    CoreNetWorkStatus sta = [self currentNetWorkStatus];
    //根据枚举获取网络状态值
    return status.coreNetworkStatusStringArray[sta];
}

- (Reachability *)reachability {
    if (_reachability == nil) {
        _reachability = [Reachability reachabilityForInternetConnection];
    }
    return _reachability;
}


- (CTTelephonyNetworkInfo *)telephonyNetworkInfo {
    if (_telephonyNetworkInfo == nil) {
        _telephonyNetworkInfo = [[CTTelephonyNetworkInfo alloc] init];
    }
    return _telephonyNetworkInfo;
}


- (NSString *)currentRaioAccess {
    if (_currentRaioAccess == nil) {
        //这个使你能知晓手机是处于较慢的GPRS还是高速的LTE或者介于其中
        _currentRaioAccess = self.telephonyNetworkInfo.currentRadioAccessTechnology;
    }
    return _currentRaioAccess;
}

/** 开始网络监听 */
+ (void)beginNotiNetwork:(id <CoreStatusProtocol>)listener {
    CoreStatus *status = [CoreStatus sharedCoreStatus];
    if (status.isNoti) {
        NSLog(@"CoreStatus已经处于监听中，请检查其他页面是否关闭监听！");
        [self endNotiNetwork:(id <CoreStatusProtocol>) listener];
    }
    //注册监听      CoreStatusChangedNoti为自定义监听名字
    [[NSNotificationCenter defaultCenter] addObserver:listener selector:@selector(coreNetworkChangeNoti:) name:CoreStatusChangedNoti object:status];
    //在运营商和接入收到通知时(下面)上面的通知方法才能运行
    [[NSNotificationCenter defaultCenter] addObserver:status selector:@selector(coreNetWorkStatusChanged:) name:kReachabilityChangedNotification object:nil];
    //监听运营商的改变
    [[NSNotificationCenter defaultCenter] addObserver:status selector:@selector(coreNetWorkStatusChanged:) name:CTRadioAccessTechnologyDidChangeNotification object:nil];
    [status.reachability startNotifier];
    status.isNoti = YES;

}


/** 停止网络监听 */
+ (void)endNotiNetwork:(id <CoreStatusProtocol>)listener {
    CoreStatus *status = [CoreStatus sharedCoreStatus];
    if (!status.isNoti) {
        NSLog(@"CoreStatus监听已经被关闭");
        return;
    }
    //解除监听
    [[NSNotificationCenter defaultCenter] removeObserver:status name:kReachabilityChangedNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:status name:CTRadioAccessTechnologyDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:listener name:CoreStatusChangedNoti object:status];
    status.isNoti = NO;
}


- (void)coreNetWorkStatusChanged:(NSNotification *)notification {
    //运营商发生改变
    if (notification.name == CTRadioAccessTechnologyDidChangeNotification && notification.object != nil) {
        self.currentRaioAccess = self.telephonyNetworkInfo.currentRadioAccessTechnology;
    }
    //再次发出通知
    NSDictionary *userInfo = @{
            @"currentStatusEnum" : @([CoreStatus currentNetWorkStatus]),
            @"currentStatusString" : [CoreStatus currentNetWorkStatusString],
            @"isWifiEnable" : @([CoreStatus isWifiEnable]),
            @"isNetworkEnable" : @([CoreStatus isNetworkEnable]),
            @"isHighSpeedNetwork" : @([CoreStatus isHighSpeedNetwork])
    };
    NSLog(@"CoreStatusChangedNoti通知发送前:");
    [[NSNotificationCenter defaultCenter] postNotificationName:CoreStatusChangedNoti object:self userInfo:userInfo];
    NSLog(@"CoreStatusChangedNoti通知发送后:");
}

#pragma mark 网络类型判断  获取当前网络类型  wifi

- (CoreNetWorkStatus)statusWithRadioAccessTechnology {
    CoreNetWorkStatus status = (CoreNetWorkStatus) [self.reachability currentReachabilityStatus];
    NSString *technology = self.currentRaioAccess;
    if (status == CoreNetWorkStatusWWAN && technology != nil) {
        if ([self.technology2GArray containsObject:technology]) {
            status = CoreNetWorkStatus2G;
        } else if ([self.technology3GArray containsObject:technology])
            status = CoreNetWorkStatus3G;
        else if ([self.technology4GArray containsObject:technology]) {
            status = CoreNetWorkStatus4G;
        }
    }
    return status;
}

/*
 *  懒加载
 */
/** 2G数组 */
- (NSArray *)technology2GArray {
    if (_technology2GArray == nil) {
        _technology2GArray = @[CTRadioAccessTechnologyEdge, CTRadioAccessTechnologyGPRS];
    }
    return _technology2GArray;
}


/** 3G数组 */
- (NSArray *)technology3GArray {

    if (_technology3GArray == nil) {

        _technology3GArray = @[CTRadioAccessTechnologyHSDPA,
                CTRadioAccessTechnologyWCDMA,
                CTRadioAccessTechnologyHSUPA,
                CTRadioAccessTechnologyCDMA1x,
                CTRadioAccessTechnologyCDMAEVDORev0,
                CTRadioAccessTechnologyCDMAEVDORevA,
                CTRadioAccessTechnologyCDMAEVDORevB,
                CTRadioAccessTechnologyeHRPD];
    }
    return _technology3GArray;
}

/** 4G数组 */
- (NSArray *)technology4GArray {

    if (_technology4GArray == nil) {

        _technology4GArray = @[CTRadioAccessTechnologyLTE];
    }

    return _technology4GArray;
}

/** 网络状态中文数组 */
- (NSArray *)coreNetworkStatusStringArray {
    if (_coreNetworkStatusStringArray == nil) {
        _coreNetworkStatusStringArray = @[@"无网络", @"Wifi", @"蜂窝网络", @"2G", @"3G", @"4G", @"未知网络"];
    }
    return _coreNetworkStatusStringArray;
}


/** 是否是Wifi */
+ (BOOL)isWifiEnable {
    return [self currentNetWorkStatus] == CoreNetWorkStatusWifi;
}

/** 是否有网络 */
+ (BOOL)isNetworkEnable {
    CoreNetWorkStatus networkStatus = [self currentNetWorkStatus];
    return networkStatus != CoreNetWorkStatusUnkhow && networkStatus != CoreNetWorkStatusNone;
}

/** 是否处于高速网络环境：3G、4G、Wifi */
+ (BOOL)isHighSpeedNetwork {
    CoreNetWorkStatus networkStatus = [self currentNetWorkStatus];
    return networkStatus == CoreNetWorkStatus3G || networkStatus == CoreNetWorkStatus4G || networkStatus == CoreNetWorkStatusWifi;
}
@end
