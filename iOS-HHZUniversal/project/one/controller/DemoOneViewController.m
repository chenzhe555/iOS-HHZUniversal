//
//  DemoOneViewController.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/12/6.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "DemoOneViewController.h"
#import "HHZWebViewController.h"
#import "DemoOneCell.h"
#import "HHZToastView.h"
#import "BottomPopViewController.h"
#import "WatermarkViewController.h"
#import "ShowAlertViewController.h"
#import "HHZTabbarTool.h"
#import "WebViewJSBridgeViewController.h"

@interface DemoOneViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray * dataArray;

@property (nonatomic, strong) HHZHttpResult * testResult;
@end

@implementation DemoOneViewController

#pragma mark 视图控制器生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadRequest];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[HHZTabbarTool shareManager].tabbar showTabbarView:YES];
}


#pragma mark 数据初始化

-(void)initializeData
{
    [super initializeData];
    self.title = @"第一个";
    self.dataArray = @[@"跳转到WebView!",@"底部弹出视图",@"添加水印",@"弹出框",@"JS交互"];
}

#pragma mark 视图创建

-(void)createMainView
{
    [super createMainView];
}

#pragma mark 自定义辅助方法

-(void)loadRequest
{
    _testResult = [self.currentService testHttpRequestArg1:@"11" Arg2:2 Condition:nil];
    //取消当前请求
    [_testResult.requestTask cancel];
}

#pragma mark 触发事件

-(void)back
{
    [super back];
}

#pragma mark 回调事件

#pragma mark 回调事件 --> TableView代理方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DemoOneCell * cell = [DemoOneCell configCellWithTableView:tableView IndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController * vc = nil;
    switch (indexPath.row) {
        case 0:
        {
            vc = [HHZWebViewController new];
            ((HHZWebViewController *)vc).urlString = @"http://www.baidu.com";
        }
            break;
        case 1:
        {
            vc = [BottomPopViewController new];
        }
            break;
        case 2:
        {
            vc = [WatermarkViewController new];
        }
            break;
        case 3:
        {
            vc = [ShowAlertViewController new];
        }
            break;
        case 4:
        {
            vc = [WebViewJSBridgeViewController new];
        }
            break;
        default:
        {
            vc = [HHZWebViewController new];
            ((HHZWebViewController *)vc).urlString = @"http://www.baidu.com";
        }
            break;
    }
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark 回调事件 --> HttpService代理方法
-(void)beforeSendRequest:(HHZHttpRequest *)request appendCondition:(HHZHttpRequestCondition *)condition
{
    
}

-(void)requestSuccess:(HHZHttpResponse *)response
{
    if (response.tag == _testResult.tag) {
        [[HHZToastView shareManager] showToastInCenter:[NSString stringWithFormat:@"返回的数据:%@",response.object[@"data"][@"aaa"]]];
    }
}

-(void)requestFail:(HHZHttpResponse *)response
{
    NSLog(@"陈哲来了aaaaa");
    if (response.tag == _testResult.tag) {
        [self.currentService handleFailInfo:response];
    }
}
@end
