//
//  BottomPopViewController.m
//  iOS-HHZUniversal
//
//  Created by mc962 on 16/12/10.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "BottomPopViewController.h"
#import "HHZBottomPopView.h"

@interface BottomPopViewController ()<PopViewDelegate>

@end

@implementation BottomPopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[HHZTabbarTool shareManager].tabbar hideTabbarView:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)popBottom:(id)sender {
    [[HHZBottomPopView shareManager] showPopViewWithTitleArray:@[@"确定",@"取消"] andColorArray:@[[UIColor redColor],[UIColor blueColor]] andDelegate:self];
}
- (IBAction)popBottomNoneColor:(id)sender {
    [[HHZBottomPopView shareManager] showPopViewWithCancelTitle:@"取消" andotherTitles:@[@"确定"] andDelegate:self];
}


-(void)dlPopViewButtonClicked:(NSNumber *)btnTag
{
    
}

@end
