//
//  ViewController.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/22.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "ViewController.h"
#import "HHZActivityLoadingView.h"
#import "HHZToastView.h"
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
//    [[HHZActivityLoadingView shareLoadingView] showMCActivityViewTopSpace:0 andBottomSpace:0 andText:@"Loading!.!!"];
//    [[HHZToastView shareLoadingView] showToastInCenter:@"Loading!.!!"];
    

    
    
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
