//
//  MCLeftNavigationView.m
//  core-ios-oc
//
//  Created by 陈哲#376811578@qq.com on 16/2/24.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "MCLeftNavigationView.h"

@implementation MCLeftNavigationView

+(void)createWithBackButtonTitle:(NSString *)title andNavi:(UIViewController *)vc andSEL:(SEL)clickAction
{
    [self createWithLeftTitle:title nolmalImage:[UIImage imageNamed:@"img_back_normal"] selectedImage:[UIImage imageNamed:@"img_back_select"] andNavi:vc andSEL:clickAction];
}

+(void)createWithLeftTitle:(NSString *)title nolmalImage:(UIImage *)image selectedImage:(UIImage *)selectedImage andNavi:(UIViewController *)vc andSEL:(SEL)clickAction
{
    UIBarButtonItem * negativeSeperator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSeperator.width = -barItemSpace;
    
    vc.navigationItem.leftBarButtonItems = @[negativeSeperator,[self createNaviWithTitle:title nolmalImage:image selectedImage:selectedImage andNavi:vc andSEL:clickAction]];
}

@end
