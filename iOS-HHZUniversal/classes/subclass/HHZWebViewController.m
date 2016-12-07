//
//  HHZWebViewController.m
//  iOS-HHZUniversal
//
//  Created by mc962 on 16/12/7.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZWebViewController.h"

@interface HHZWebViewController ()

@end

@implementation HHZWebViewController

#pragma mark 视图控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createWebView];
    [self loadWebRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark 数据初始化

-(void)loadWebRequest
{
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlString]]];
}

#pragma mark 视图创建

-(void)createWebView
{
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
}

-(void)createActivity
{
    self.activityView = [[UIActivityIndicatorView alloc] init];
    self.activityView.frame = CGRectMake(0, 0, 50, 50);
    self.activityView.center = _webView.center;
    self.activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    self.activityView.color = [UIColor lightGrayColor];
    [self.webView addSubview:self.activityView];
}

#pragma mark 自定义辅助方法
-(void)generateCookieName:(NSString *)cookieName Value:(NSString *)cookieValue Domain:(NSString *)cookieDomain Path:(NSString *)cookiePath Expires:(NSTimeInterval)expires
{
    NSMutableDictionary *cookieProperties = [NSMutableDictionary dictionary];
    [cookieProperties setObject:cookieName forKey:NSHTTPCookieName];
    [cookieProperties setObject:cookieValue forKey:NSHTTPCookieValue];
    [cookieProperties setObject:cookieDomain forKey:NSHTTPCookieDomain];
    [cookieProperties setObject:cookiePath forKey:NSHTTPCookiePath];
    [cookieProperties setObject:[[NSDate date] dateByAddingTimeInterval:expires] forKey:NSHTTPCookieExpires];
    NSHTTPCookie *cookieuser = [NSHTTPCookie cookieWithProperties:cookieProperties];
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookieuser];
}

#pragma mark 触发事件

#pragma mark 回调事件

@end