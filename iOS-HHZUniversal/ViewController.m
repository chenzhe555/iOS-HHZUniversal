//
//  ViewController.m
//  iOS-HHZUniversal
//
//  Created by mc962 on 16/11/22.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "ViewController.h"
#import "MCActivityLoadingView.h"
#import "MCToastView.h"
#import "HHZKitTool.h"
#import "HHZRedPointView.h"

@interface ViewController ()
@property (nonatomic, strong) HHZRedPointView * redView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    NSLog(@"%@",[[NSBundle mainBundle] infoDictionary]);
//    [[MCActivityLoadingView shareLoadingView] showMCActivityViewTopSpace:0 andBottomSpace:0 andText:@"Loading!!!"];
//    [[MCToastView shareLoadingView] showToastInCenter:@"Loading!!!"];
    

    
    
    self.redView = [HHZRedPointView createRedPointView:CGRectMake(100, 100, 100, 100) parentView:self.view];
    [self.redView setMaxShowCount:10000];
    [self.redView addRedCount:10001];
//    [self.redView addRedCount:90];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
