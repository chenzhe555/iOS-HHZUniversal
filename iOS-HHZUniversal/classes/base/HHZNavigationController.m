//
//  HHZNavigationController.m
//  iOS-HHZUniversal
//
//  Created by chenzhe.376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZNavigationController.h"
#import "HHZPlistTool.h"
#import "UIColor+HHZCategory.h"

@interface HHZNavigationController ()

@end

@implementation HHZNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavBasicInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  设置初始化值
 */
+(void)initialize
{
    [super initialize];
    [self setNaviScheme];
}

/**
 *  设置一些基本主题元素
 */
+(void)setNaviScheme
{
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    UIColor * color = [UIColor colorWithHexString_hhz:[HHZPlistTool getPlistValueForKey:@"textColor" plistName:@"HHZNavigationController"]];
    BOOL isBold = [[HHZPlistTool getPlistValueForKey:@"isBold" plistName:@"HHZNavigationController"] boolValue];
    NSNumber * textFont = [HHZPlistTool getPlistValueForKey:@"textFontSize" plistName:@"HHZNavigationController"];
    
    
    //设置文字颜色
    textAttrs[NSForegroundColorAttributeName] = color;
    //设置文字加粗和大小
    if (isBold) {
        textAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:[textFont floatValue]];
    }
    else {
        textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:[textFont floatValue]];
    }
    [navBar setTitleTextAttributes:textAttrs];
}

/**
 *  设置NavBar的一些基本信息
 */
-(void)setNavBasicInfo
{
    [self.navigationBar setBarTintColor:[UIColor colorWithHexString_hhz:[HHZPlistTool getPlistValueForKey:@"barTintColor" plistName:@"HHZNavigationController"]]];
    [self.navigationBar setTranslucent:NO];
}

@end
