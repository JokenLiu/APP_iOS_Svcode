//
//  ViewController.m
//  svcode
//
//  Created by Joken on 15/6/2.
//  Copyright (c) 2015年 svcode. All rights reserved.
//

#import "ViewController.h"
#define kWidth self.view.bounds.size.width
#define kHeight self.view.bounds.size.height
#import "Masonry.h"
@interface ViewController (){
    UIView*superView;
    UIWebView*webview;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    superView = [[UIView alloc]init];
    superView = self.view;
    webview = [[UIWebView alloc]init];
    
    //用来显示根视图背景颜色，防止界面转换时的白色
    webview.opaque = NO;
    webview.backgroundColor = [UIColor clearColor];
    
    [superView addSubview:webview];
    [webview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView.mas_top);
        make.left.equalTo(superView.mas_left);
        make.right.equalTo(superView.mas_right);
        make.bottom.equalTo(superView.mas_bottom);
    }];
    NSURLRequest*request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.svcode.net"]];
    [self.view addSubview:webview];
    [webview loadRequest:request];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    UIImageView *splashScreen = [[UIImageView alloc] init] ;
    splashScreen.backgroundColor = [UIColor colorWithRed:34.0/255.0 green:195.0/255.0 blue:173.0/255.0 alpha:1];
    [self.view addSubview:splashScreen];
    [splashScreen mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
    [UIView animateWithDuration:3.0 animations:^{
        CATransform3D transform = CATransform3DMakeScale(1.0, 1.0, 1);
        splashScreen.layer.transform = transform;
        splashScreen.alpha = 0.0;
    } completion:^(BOOL finished) {
        [splashScreen removeFromSuperview];
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
