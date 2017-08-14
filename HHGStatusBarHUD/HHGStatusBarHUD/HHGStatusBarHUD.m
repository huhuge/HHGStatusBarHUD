//
//  HHGStatusBarHUD.m
//  HHGStatusBarHUD
//
//  Created by 胡明正 on 2017/8/11.
//  Copyright © 2017年 huhuge. All rights reserved.
//

#import "HHGStatusBarHUD.h"
#define HHGMessageFont [UIFont systemFontOfSize:12]

/** 消息停留时间 */
static CGFloat const HHGMessageDuration = 2.0;
/** 动画时间 */
static CGFloat const HHGAnimationDuration = 0.1;


@implementation HHGStatusBarHUD




/** 全局窗口 */
static UIWindow *_window;
/** 定时器 */
static NSTimer *_timer;

/**
 *  初始化窗口
 */
+ (void)showWindow{
    
    // frame数据
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    //显示窗口
    _window.hidden = YES;
    _window = [[UIWindow alloc] init];
    _window.windowLevel = UIWindowLevelAlert;
    _window.backgroundColor = [UIColor blackColor];
    _window.frame = frame;
    _window.hidden = NO;
    
    // 执行动画
    frame.origin.y = 0;
    [UIView animateWithDuration:HHGAnimationDuration animations:^{
        _window.frame = frame;
    }];

}

/**
 *  显示普通信息
 */
+(void)showMessage:(NSString *)msg image:(UIImage *)image{
    // 停止定时器
    [_timer invalidate];
    
    [self showWindow];
    // 添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (image) { // 如果有图片
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = HHGMessageFont;
    button.frame = _window.bounds;
    [_window addSubview:button];
    
    // 定时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:HHGMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
    
}


/**
 *  显示信息
 */
+(void)showMessage:(NSString *)msg{
    [self showMessage:msg image:nil];
}


/**
 *  显示成功信息
 */
+(void)showSuccess:(NSString *)msg{
    [self showMessage:msg image:[UIImage imageNamed:@"HHGStatusBarHUD.bundle/success"]];
}

/**
 *  显示失败信息
 */
+(void)showError:(NSString *)msg{
    [self showMessage:msg image:[UIImage imageNamed:@"HHGStatusBarHUD.bundle/error"]];

}

/**
 *  显示正在加载
 */
+(void)showLoading:(NSString *)msg{
    
    // 停止定时器
    [_timer invalidate];
    _timer = nil;
    
    // 显示窗口
    [self showWindow];

    // 添加文字
    UILabel *label = [[UILabel alloc] init];
    label.font = HHGMessageFont;
    label.text = msg;
    label.frame = _window.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    [_window addSubview:label];
    
    // 添加菊花
    UIActivityIndicatorView *loadView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadView startAnimating];
    // 文字宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : HHGMessageFont}].width;
    CGFloat centerX = (_window.frame.size.width - msgW) * 0.5 - 20;
    CGFloat centerY = _window.frame.size.height / 2;
    
    loadView.center = CGPointMake(centerX, centerY);
    [_window addSubview:loadView];
    
    
}

/**
 *  隐藏显示
 */
+(void)hide{
    
    [UIView animateWithDuration:HHGAnimationDuration animations:^{
        CGRect frame =  _window.frame;
        frame.origin.y = -frame.size.height;
        _window.frame = frame;
    } completion:^(BOOL finished) {
        _window = nil;
        _timer = nil;

    }];
}

@end
