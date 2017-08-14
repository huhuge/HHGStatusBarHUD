//
//  HHGStatusBarHUD.h
//  HHGStatusBarHUD
//
//  Created by 胡明正 on 2017/8/11.
//  Copyright © 2017年 huhuge. All rights reserved.
//  大版本号.功能更新版本号.bug修复版本号
// 0.0.0

#import <UIKit/UIKit.h>

@interface HHGStatusBarHUD : NSObject

/**
 *  显示普通信息
 */
+(void)showMessage:(NSString *)msg image:(UIImage *)image;

/**
 *  显示普通信息
 */
+(void)showMessage:(NSString *)msg;

/**
 *  显示成功信息
 */
+(void)showSuccess:(NSString *)msg;

/**
 *  显示失败信息
 */
+(void)showError:(NSString *)msg;

/**
 *  显示正在加载
 */
+(void)showLoading:(NSString *)msg;

/**
 *  隐藏显示
 */
+(void)hide;

@end
