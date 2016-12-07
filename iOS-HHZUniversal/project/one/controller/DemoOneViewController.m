//
//  DemoOneViewController.m
//  iOS-HHZUniversal
//
//  Created by mc962 on 16/12/6.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "DemoOneViewController.h"
#import "HHZWebViewController.h"
#import "DemoOneCell.h"

@interface DemoOneViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray * dataArray;
@end

@implementation DemoOneViewController

#pragma mark 视图控制器生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark 数据初始化

-(void)initializeData
{
    [super initializeData];
    self.title = @"第一个";
    self.dataArray = @[@"跳转到WebView!"];
}

#pragma mark 视图创建

-(void)createMainView
{
    [super createMainView];
}

#pragma mark 自定义辅助方法
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
            
        default:
            break;
    }
}

@end
