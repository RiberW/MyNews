//
//  RJTabBarController.m
//  News
//
//  Created by wjdtyp on 15/7/30.
//  Copyright (c) 2015年 wjdtyp. All rights reserved.
//
#import <UIKit/UIKit.h>
#ifdef DEBUG
#define RJLog(...) NSLog(__VA_ARGS__)
#else // 发布状态, 关闭LOG功能
#define RJLog(...)
#endif
//iOS7以上版本
#define kiOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

#define RJScreenW [UIScreen mainScreen].bounds.size.width
#define RJScreenH [UIScreen mainScreen].bounds.size.height

#define XR [UIScreen mainScreen].bounds.size.width/375.0
#define YR [UIScreen mainScreen].bounds.size.height/667.0

#define typeScrollHeight 32

#define H64 64

#define H6 375.0
#define W6 667.0

#define XRF(width) width*XR
#define YRF(height) height*YR

#define RJColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define RJRandomColor RJColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

