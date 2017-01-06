//
//  DemoViewController.m
//  iOS-HHZUniversal
//
//  Created by chenzhe.376811578@qq.com on 16/12/8.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

#pragma mark 视图控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initializeHttpService];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark 数据初始化

-(void)initializeHttpService
{
    self.currentService = [DemoHttpService new];
    self.currentService.delegate = self;
}

#pragma mark 视图创建


#pragma mark 自定义辅助方法
#pragma mark 触发事件

#pragma mark 回调事件

@end
