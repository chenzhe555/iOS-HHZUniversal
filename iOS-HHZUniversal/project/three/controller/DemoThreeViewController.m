//
//  DemoThreeViewController.m
//  iOS-HHZUniversal
//
//  Created by mc962 on 16/12/6.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "DemoThreeViewController.h"

@interface DemoThreeViewController ()

@end

@implementation DemoThreeViewController

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
    self.title = @"第三个";
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

@end
