//
// Created by wjdtyp on 15/8/22.
// Copyright (c) 2015 wjdtyp. All rights reserved.
//


typedef enum{
    /** 无网络 */
    CoreNetWorkStatusNone=0,
    
    /** Wifi网络 */
    CoreNetWorkStatusWifi,
    
    /** 蜂窝网络 */
    CoreNetWorkStatusWWAN,
    
    /** 2G网络 */
    CoreNetWorkStatus2G,
    
    /** 3G网络 */
    CoreNetWorkStatus3G,
    
    /** 4G网络 */
    CoreNetWorkStatus4G,
    
    //未知网络
    CoreNetWorkStatusUnkhow
    
}CoreNetWorkStatus;
