//
//  WatermarkViewController.m
//  iOS-HHZUniversal
//
//  Created by 376811578@qq.com on 17/1/4.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "WatermarkViewController.h"
#import "UIImage+HHZCategory.h"
#import "HHZTabbarTool.h"

@interface WatermarkViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *testImage;

@end

@implementation WatermarkViewController

#pragma mark 视图控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[HHZTabbarTool shareManager].tabbar hideTabbarView:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark 数据初始化

-(void)initializeData
{
    [super initializeData];
    self.testImage.layer.borderWidth = 3.0f;
    self.testImage.layer.borderColor = [UIColor redColor].CGColor;
    [self.testImage.layer masksToBounds];
}

#pragma mark 视图创建

-(void)createMainView
{
    [super createMainView];
}

#pragma mark 自定义辅助方法

- (IBAction)addText:(id)sender
{
    self.testImage.image = [UIImage imageNamed:@"test2"];
    self.testImage.image = [self.testImage.image addWatermarkText_hhz:@"陈哲是个好孩子" Rect:CGRectMake(20,30,160,60)];
}

- (IBAction)addImage:(id)sender {
    UIImage * image1 = [UIImage imageNamed:@"test1"];
    UIImage * image2 = [UIImage imageNamed:@"test2"];
    self.testImage.image = image2;
    
    self.testImage.image = [UIImage mergeImage_hhz:image1 WithBImage:image2 OneRect:CGRectMake(0, 0, 120, 60) TwoRect:CGRectMake(120, 0, 120, 120) BGRect:self.testImage.bounds];
    
//    self.testImage.image = [self.testImage.image addWatermarkImage_hhz:image1 Rect:CGRectMake(120, 0, 120, 60) BGRect:self.testImage.bounds];
}

#pragma mark 触发事件

-(void)back
{
    [super back];
}

#pragma mark 回调事件

@end
