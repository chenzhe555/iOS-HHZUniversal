//
//  HHZViewController.m
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZViewController.h"

@interface HHZViewController ()

@end

@implementation HHZViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initializeData];
    [self createMainView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initializeData
{
    @throw [NSException exceptionWithName:NSGenericException reason:[NSString stringWithFormat:@"( HHZViewController )You must override %@ in a subclass", NSStringFromSelector(_cmd)] userInfo:nil];
}

-(void)createMainView
{
    @throw [NSException exceptionWithName:NSGenericException reason:[NSString stringWithFormat:@"( HHZViewController )You must override %@ in a subclass", NSStringFromSelector(_cmd)] userInfo:nil];
}

-(void)back
{
    
}

@end
