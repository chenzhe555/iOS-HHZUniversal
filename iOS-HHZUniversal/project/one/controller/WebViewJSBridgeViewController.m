//
//  WebViewJSBridgeViewController.m
//  iOS-HHZUniversal
//
//  Created by mc962 on 2017/1/19.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "WebViewJSBridgeViewController.h"
#import <WebViewJavascriptBridge/WebViewJavascriptBridge.h>
#import "HHZTabbarTool.h"

@interface WebViewJSBridgeViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property WebViewJavascriptBridge * bridge;
@end

@implementation WebViewJSBridgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[HHZTabbarTool shareManager].tabbar hideTabbarView:YES];
    
    //初始化WebViewJavascriptBridge实例
    self.bridge = [WebViewJavascriptBridge bridgeForWebView:self.webView];
    [self.bridge setWebViewDelegate:self];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"webviewBridge" ofType:@"html"]]]];
    
    //注册本地方法
    [self.bridge registerHandler:@"WebCallApp" handler:^(id data, WVJBResponseCallback responseCallback) {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"网页点击事件" message:data[@"callApp"] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];

        NSLog(@"%@",data[@"callApp"]);
        responseCallback(@{@"callWeb":@"Web主动调用App方法--->App回调Web"});
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)callWebViewFunction:(id)sender {
    [self.bridge callHandler:@"appCallWeb" data:@{@"callWeb":@"App主动调用Web方法"} responseCallback:^(id responseData) {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"回调结果" message:responseData[@"callApp"] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }];
}

@end
