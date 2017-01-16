//
//  DemoOneViewController.m
//  iOS-HHZUniversal
//
//  Created by chenzhe.376811578@qq.com on 16/12/6.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "DemoOneViewController.h"
#import "HHZWebViewController.h"
#import "DemoOneCell.h"
#import "HHZToastView.h"
#import "BottomPopViewController.h"
#import "WatermarkViewController.h"
#import "ShowAlertViewController.h"

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
    self.dataArray = @[@"跳转到WebView!",@"底部弹出视图",@"添加水印",@"弹出框"];
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
    switch (indexPath.row) {
        case 0:
        {
            HHZWebViewController * vc = [HHZWebViewController new];
            vc.urlString = @"http://www.baidu.com";
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            BottomPopViewController * vc = [BottomPopViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            WatermarkViewController * vc = [WatermarkViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:
        {
            ShowAlertViewController * vc = [ShowAlertViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}

#pragma mark 回调事件 --> HttpService代理方法
-(void)requestSuccess:(HHZHttpResponse *)response
{
    if (response.tag == _testResult.tag) {
        LoggerApp(4,@"%@",response.object[@"data"][@"aaa"]);
        [[HHZToastView shareManager] showToastInCenter:[NSString stringWithFormat:@"返回的数据:%@",response.object[@"data"][@"aaa"]]];
    }
}

-(void)requestFail:(HHZHttpResponse *)response
{
    if (response.tag == _testResult.tag) {
        [self.currentService handleFailInfo:response];
    }
}
@end
