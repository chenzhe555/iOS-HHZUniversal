//
//  AppDelegate.m
//  iOS-HHZUniversal
//
//  Created by mc962 on 16/11/22.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "AppDelegate.h"
#import "HHZTabbarModel.h"
#import "DemoTabbar.h"
#import "HHZMACROConfig.h"
#import "HHZMethodException.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = [self createTab];
    [self.window makeKeyAndVisible];;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)configSomeThing
{
    
}

#pragma mark 创建Tabbar
-(DemoTabbar *)createTab
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    //后续根据场景再优化
    HHZTabbarModel * model1 = [HHZTabbarModel new];
    model1.sourceVC = @"DemoOneViewController";
    model1.title = @"一";
    model1.normalImageUrl = @"icon_message_normal";
    model1.selectImageUrl = @"icon_message_active";
    
    HHZTabbarModel * model2 = [HHZTabbarModel new];
    model2.title = @"二";
    model2.sourceVC = @"DemoTwoViewController";
    model2.normalImageUrl = @"icon_activities_normal";
    model2.selectImageUrl = @"icon_activities_active";
    
    HHZTabbarModel * model5 = [HHZTabbarModel new];
    model5.isBigNoClicked = YES;
    model5.normalImageUrl = @"icon_center";
    model5.selectImageUrl = @"icon_center";
    
    HHZTabbarModel * model3 = [HHZTabbarModel new];
    model3.sourceVC = @"DemoFourViewController";
    model3.title = @"三";
    model3.normalImageUrl = @"icon_app_normal";
    model3.selectImageUrl = @"icon_app_active";
    
    HHZTabbarModel * model4 = [HHZTabbarModel new];
    model4.title = @"四";
    model4.sourceVC = @"DemoFiveViewController";
    model4.normalImageUrl = @"icon_me_normal";
    model4.selectImageUrl = @"icon_me_active";
    
    NSArray * tabbarArray = @[model1,model2,model5,model3,model4];
    
    return [DemoTabbar createTabbarWithTabArray:tabbarArray];
}

@end
