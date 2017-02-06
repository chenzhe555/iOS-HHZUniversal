//
//  main.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/22.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import <NSLogger/NSLogger.h>

int main(int argc, char * argv[]) {
    @autoreleasepool {
//        LoggerStart(LoggerGetDefaultLogger());
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
