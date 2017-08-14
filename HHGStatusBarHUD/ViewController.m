//
//  ViewController.m
//  HHGStatusBarHUD
//
//  Created by 胡明正 on 2017/8/11.
//  Copyright © 2017年 huhuge. All rights reserved.
//

#import "ViewController.h"
#import "HHGStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [HHGStatusBarHUD showSuccess:@"加载成功"];
//    [HHGStatusBarHUD showError:@"加载失败"];
//    [HHGStatusBarHUD showLoading:@"加载中..."];
    
}
- (IBAction)success:(id)sender {
    [HHGStatusBarHUD showSuccess:@"加载成功"];
}
- (IBAction)error:(id)sender {
    [HHGStatusBarHUD showError:@"加载失败"];
}
- (IBAction)loading:(id)sender {
    [HHGStatusBarHUD showLoading:@"加载中。。。"];
}
- (IBAction)hide:(id)sender {
    [HHGStatusBarHUD hide];
}
- (IBAction)normal:(id)sender {
    [HHGStatusBarHUD showMessage:@"测试图片" image:[UIImage imageNamed:@"success"]];
}

@end
