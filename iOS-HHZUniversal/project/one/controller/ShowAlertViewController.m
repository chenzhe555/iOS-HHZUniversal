//
//  ShowAlertViewController.m
//  iOS-HHZUniversal
//
//  Created by mc962 on 2017/1/13.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "ShowAlertViewController.h"
#import "HHZTopShowAlertView.h"
#import "HHZMACROConfig.h"
#import "HHZToastView.h"

@interface ShowAlertViewController ()
- (IBAction)showTopAlert:(id)sender;

@end

@implementation ShowAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

static NSInteger aaaa = 1;

- (IBAction)showTopAlert:(id)sender {
    [[HHZTopShowAlertView shareManager] showAlertViewWithTitle:@"测试" Content:@"陈哲是个好孩子陈哲是个好孩子陈哲是个好孩子陈哲是个好孩子" Type:HHZTopShowAlertViewTypeInfo];
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(test) userInfo:nil repeats:YES];
}

- (IBAction)Toast1:(id)sender {
    aaaa++;
    [[HHZToastView shareManager] showToastInCenter:[NSString stringWithFormat:@"陈哲是aaa%ld",(long)aaaa]];
}

- (IBAction)Toast2:(id)sender {
    [[HHZToastView shareManager] showToast:@"底部啊啊啊啊"];
}

- (IBAction)Toast3:(id)sender {
}

-(void)test
{
    aaaa++;
    if (aaaa <= 6) {
        [[HHZTopShowAlertView shareManager] showAlertViewWithTitle:@"测试" Content:[NSString stringWithFormat:@"陈哲是个好孩子陈哲是个好孩子陈哲是个好孩子陈哲是个好孩子%ld",(long)aaaa] Type:HHZTopShowAlertViewTypeInfo];
    }
    
}
@end
