//
//  BaseNavigationView.m
//  core-ios-oc
//
//  Created by 陈哲#376811578@qq.com on 16/2/23.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "BaseNavigationView.h"

@implementation BaseNavigationView


+(UIBarButtonItem *)createNaviWithTitle:(NSString *)title nolmalImage:(UIImage *)image selectedImage:(UIImage *)selectedImage andNavi:(UIViewController *)vc andSEL:(SEL)clickAction
{
    BaseNaviView * NaviView = [[BaseNaviView alloc] init];
    NaviView.frame = CGRectMake(0, 20, 0, topNavigationHeight);
    [NaviView createNaviView:title NormalImage:image SelectedImage:selectedImage ShowType:BaseNaviViewShowTypeTitleTop];
    
    [NaviView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:vc action:clickAction]];
    
    return [[UIBarButtonItem alloc] initWithCustomView:NaviView];
}

@end
