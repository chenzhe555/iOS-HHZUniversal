//
//  MCTabBar.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/2/23.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

/*
 Demo:
 UIViewController * vc1 = [[UIViewController alloc] init];
 UIViewController * vc2 = [[UIViewController alloc] init];
 UIViewController * vc3 = [[UIViewController alloc] init];
 UIViewController * vc4 = [[UIViewController alloc] init];
 UINavigationController * nac1 = [[UINavigationController alloc] initWithRootViewController:vc1];
 UINavigationController * nac2 = [[UINavigationController alloc] initWithRootViewController:vc2];
 UINavigationController * nac3 = [[UINavigationController alloc] initWithRootViewController:vc3];
 UINavigationController * nac4 = [[UINavigationController alloc] initWithRootViewController:vc4];
 MCTabBar * tabbar = [[MCTabBar alloc] init];
 [tabbar setTitleArray:@[@"1111",@"2222",@"333",@"4"] normalImageArray:@[@"icon_my_normal",@"icon_allGoods_normal",@"icon_home_normal",@"icon_shopCart_normal"] selectedImageArray:@[@"icon_my_selected",@"icon_allGoods_selected",@"icon_home_selected",@"icon_shopCart_selected"]];
 tabbar.viewControllers = @[nac1,nac2,nac3,nac4];
 [tabbar createTabbar];
 [tabbar hideTabbarView:YES];
 [tabbar switchTabbarItem:3];
 self.window.rootViewController = tabbar;
 */


#import "BaseTabbar.h"

@interface MCTabBar : BaseTabbar

//比如说注册通知,添加红点等操作
//-(void)registNotification;

@end
