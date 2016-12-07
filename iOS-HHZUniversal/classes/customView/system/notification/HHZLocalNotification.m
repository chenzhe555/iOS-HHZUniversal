//
//  HHZLocalNotification.m
//  iOS-HHZUniversal
//
//  Created by mc962 on 16/11/25.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZLocalNotification.h"
#import <UIKit/UIKit.h>

@implementation HHZLocalNotification

+(NSString *)getBundleDisplayName
{
    static NSString * name = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        name = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    });
    return name;
}

+(void)createLocalNotificationWithTime:(NSTimeInterval)time AndContent:(NSString *)content AndKey:(NSString *)notiKey AndBody:(NSDictionary *)body
{
    // 应用程序在后台的时候，本地通知会给设备送达一个和远程通知一样的提醒，提醒的样式由用户在手机设置中设置
    // 应用程序正在运行中，则设备不会收到提醒，但是会走应用程序delegate中的方法：- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
    UILocalNotification * notification = [[UILocalNotification alloc] init];
    if (time <= 0)
    {
        time = 0;
    }
    NSDate * pushDate = [NSDate dateWithTimeIntervalSinceNow:time];
    // ios8后，需要添加这个注册，才能得到授权
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)])
    {
        UIUserNotificationType type =  UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:type categories:nil]];
    }
    if (notification != nil)
    {
        // 设置推送时间
        notification.fireDate = pushDate;
        // 设置时区
        notification.timeZone = [NSTimeZone defaultTimeZone];
        // 设置重复间隔
        //        notification.repeatInterval = kCFCalendarUnitDay;
        // 通知重复提示的单位，可以是天、周、月等
        //        notification.repeatInterval = NSCalendarUnitDay;
        // 推送声音
        notification.soundName = UILocalNotificationDefaultSoundName;
        // 推送内容
        notification.alertBody=content;
        //提示框按钮
        notification.alertAction = [NSString stringWithFormat:@"%@:%@",[self getBundleDisplayName],content];
        //设置userinfo 方便在之后需要撤销的时候使用
        if (notiKey)
        {
            NSDictionary *info = [NSDictionary dictionaryWithObject:@"notiKey" forKey:notiKey];
            notification.userInfo = info;
        }
        
        //立即触发一个通知
        [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
    }
}

+(void)cancelLocalNotificationWithKey:(NSString *)key
{
    NSArray *localNotifications = [UIApplication sharedApplication].scheduledLocalNotifications;
    for(UILocalNotification * notification in localNotifications)
    {
        NSDictionary *userInfo = notification.userInfo;
        if (userInfo)
        {
            NSString *info = userInfo[key];
            if (info != nil)
            {
                [[UIApplication sharedApplication] cancelLocalNotification:notification];
                break;
            }
        }
    }
}

@end
