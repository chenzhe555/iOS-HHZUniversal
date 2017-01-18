//
//  HHZLoggerTool.m
//  iOS-HHZUniversal
//
//  Created by 376811578@qq.com on 2017/1/10.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZLoggerTool.h"
#import <CocoaLumberjack/CocoaLumberjack.h>

@implementation HHZLoggerTool
+(void)turnOnLogger
{
        //1.开启使用XcodeColors
        setenv("XcodeColors", "YES", 0);
        //2.检测是否开启 XcodeColors
        char *xcode_colors = getenv("XcodeColors");
        if (xcode_colors && (strcmp(xcode_colors, "YES")) != 0)
        {
            NSLog(@"XcodeColors is not installed and enabled");
        }
        //3.开启DDLog 颜色
        [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
        [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor colorWithRed:229/255.0 green:57/255.0 blue:53/255.0 alpha:1.0] backgroundColor:nil forFlag:DDLogFlagError];
        [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor colorWithRed:255/255.0 green:192/255.0 blue:0/255.0 alpha:1.0] backgroundColor:nil forFlag:DDLogFlagWarning];
        [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor colorWithRed:145/255.0 green:184/255.0 blue:89/255.0 alpha:1.0] backgroundColor:nil forFlag:DDLogFlagInfo];
        [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor colorWithRed:124/255.0 green:77/255.0 blue:255/255.0 alpha:1.0] backgroundColor:nil forFlag:DDLogFlagDebug];
        [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor blackColor] backgroundColor:nil forFlag:DDLogFlagVerbose];
    
        //4.配置DDLog(log 发送给 Xcode 的控制台)
        [DDLog addLogger:[DDTTYLogger sharedInstance]]; // TTY = Xcode console
//        //log 发送给苹果服务器，之后在Console.app中可以查看
//        [DDLog addLogger:[DDASLLogger sharedInstance]]; // ASL = Apple System Logs
    
        //5.File Logger(log 写入本地文件)
//        DDFileLogger *fileLogger = [[DDFileLogger alloc] init]; // File Logger
//        fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
//        fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
//        [DDLog addLogger:fileLogger];
}
@end
