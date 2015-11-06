//
// Created by wjdtyp on 15/8/22.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RJSingleton.h"
#import "CoreNetworkStatus.h"
#import "CoreStatusProtocol.h"

@interface CoreStatus : NSObject
RJSingletonH(CoreStatus)

/** 获取当前网络状态：枚举 */
+ (CoreNetWorkStatus)currentNetWorkStatus;

/** 获取当前网络状态：字符串 */
+ (NSString *)currentNetWorkStatusString;

/** 开始网络监听 */
+ (void)beginNotiNetwork:(id <CoreStatusProtocol>)listener;

/** 停止网络监听 */
+ (void)endNotiNetwork:(id <CoreStatusProtocol>)listener;

/*
 *  新增API
 */
/** 是否是Wifi */
+ (BOOL)isWifiEnable;

/** 是否有网络 */
+ (BOOL)isNetworkEnable;

/** 是否处于高速网络环境：3G、4G、Wifi */
+ (BOOL)isHighSpeedNetwork;
@end
