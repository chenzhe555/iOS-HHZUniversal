//
//  HHZAppInfoTool.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZAppInfoTool.h"
#import <sys/sysctl.h>
#import <objc/runtime.h>
#import <dlfcn.h>


#define UIKITPATH   "/System/Library/Framework/UIKit.framework/UIKit"
#define SBSERVPATH  "/System/Library/PrivateFrameworks/SpringBoardServices.framework/SpringBoardServices"
//#define SBCFBundle  "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator8.3.sdk/System/Library/Frameworks/CoreFoundation.framework/CFBundle"似乎不对

//#define SBCFBundle  "/System/Library/Framework"似乎不对

@implementation HHZAppInfoTool
////做实验用的，还有参考价值
//+(NSString *)getAppNameByBundleID:(NSString *)bundID
//{
//    //    NSArray * arr = [bundID componentsSeparatedByString:@"."];
//    //    NSMutableString * mutaStr = [[NSMutableString alloc] init];
//    //    for (int i = 2; i < arr.count; i++)
//    //    {
//    //        [mutaStr appendString:[arr objectAtIndex:i]];
//    //    }
//    //    return mutaStr;
//
//    Class sbCFBundle1 = objc_getClass("LSBundleProxy");
//
//
//    //    id objjj = [[sbCFBundle1 alloc] performSelector:@selector(initWithBundleIdentifier:) withObject:bundID];
//    //
//    //    id obb = [objjj valueForKey:@"_client"];
//
//    NSArray * arr11 = [self getAppNameByBundleID:[sbCFBundle1 class]];
//    for(id obj in arr11)
//    {
//        NSLog(@"---%@\n\n\n",obj);
//    }
//    //    NSLog(@"来来%@",objjj);
//
//    NSArray * arr111 = [[NSBundle mainBundle].bundlePath componentsSeparatedByString:@"/"];
//
//    NSString * mutaSTr = [[NSString alloc] init];
//
//    for (int i = 1; i <= 7; i++)
//    {
//        [mutaSTr stringByAppendingPathComponent:[arr111 objectAtIndex:i]];
//    }
//
//    void *sbserv = dlopen(SBCFBundle, RTLD_LAZY);
//
//    NSLog(@"当前路径为----%@",[NSBundle mainBundle].bundlePath);
//
//    //    CFStringRef SBSCopyIconImagePathForDisplayIdentifier(CFStringRef dispIden);
//
//    NSBundle * (*CFBundleGetInfoDictionary)(CFBundleRef bundlRef) = dlsym(sbserv, "CFBundleGetInfoDictionary");
//
//
//
//    NSString * (*SBSCopyLocalizedApplicationNameForDisplayIdentifier)(CFStringRef identifier) =   dlsym(sbserv, "SBSCopyLocalizedApplicationNameForDisplayIdentifier");
//
//    //    NSString * strAppName = SBSCopyLocalizedApplicationNameForDisplayIdentifier((__bridge CFStringRef)bundID);
//
//    @try {
//        //        NSDictionary * dic = (__bridge NSDictionary *)CFBundleGetInfoDictionary(CFBundleGetBundleWithIdentifier((__bridge CFStringRef)bundID));
//        //        NSDictionary * dic = CFBundleGetInfoDictionary((__bridge CFStringRef)bundID);
//        //        NSLog(@"budd---%@",dic);
//    }
//    @catch (NSException *exception) {
//
//    }
//    @finally {
//
//    }
//
//
//    //    NSBundle * bundle = [NSBundle mainBundle];
//    //    NSLog(@"%@",[NSBundle allBundles]);
//
//    //    NSString * (*SBSCopyLocalizedApplicationNameForDisplayIdentifier)(NSString* ) =   dlsym(sbserv, "SBSCopyLocalizedApplicationNameForDisplayIdentifier");
//    //
//    //    NSString * strAppName = SBSCopyLocalizedApplicationNameForDisplayIdentifier(bundID);
//
//    //    NSBundle * buu = [NSBundle bundleWithPath:@"/Users/zhechen/Library/Developer/CoreSimulator/Devices/C25F7968-D24B-4F43-8DA5-8A766E72F8A0/data/Containers/Bundle/Application/90D3BEC9-1D94-4E11-A74B-087B641C77C1/MCAppStore.app"];
//    //
//    //    NSString * urlPath = bundle.bundlePath;
//    //
//    //    NSURL * urlPath111 = [NSURL URLWithString:buu.bundlePath];
//    //
//    //
//    //
//    //
//    //    NSDictionary * dic = (__bridge NSDictionary *)CFBundleGetInfoDictionary(CFBundleCreate(NULL, (__bridge CFURLRef)urlPath111));
//    //    NSLog(@"dic---\n\n%@",dic);
//
//}

+(NSArray *)getAppsbyFilter:(NSString *)filterString
{
    //    mach_port_t *p;
    //    void *uikit = dlopen(UIKITPATH, RTLD_LAZY);
    //    int (*SBSSpringBoardServerPort)() = dlsym(uikit, "SBSSpringBoardServerPort");
    //    p = (mach_port_t *)SBSSpringBoardServerPort();
    //    dlclose(uikit);
    
    Class LSApplicationWorkspace_class = objc_getClass("LSApplicationWorkspace");
    
    NSObject * workspace = [LSApplicationWorkspace_class performSelector:@selector(defaultWorkspace)];
    
    NSArray * arr = [workspace performSelector:@selector(allApplications)];
    
    if (filterString != nil)
    {
        NSMutableArray * mutaArr = [NSMutableArray array];
        NSString * bundleStr = nil;
        for (int i = 0; i < arr.count; i++)
        {
            bundleStr = [NSString stringWithFormat:@"%@",[[arr objectAtIndex:i] description]];
            NSRange range = [bundleStr rangeOfString:filterString];
            if (range.location != 0 && range.length != 0)
            {
                [mutaArr addObject:[arr objectAtIndex:i]];
            }
        }
        return mutaArr;
    }
    return arr;
}

+(HHZAppInfo *)getAppInfoByProxy:(LSApplicationProxy *)appProxy
{
    return [[HHZAppInfo alloc] initWithProxy:appProxy];
}


+(UIImage *)getAppbyIcon:(NSString *)bundID
{
    void *sbserv = dlopen(SBSERVPATH, RTLD_LAZY);
    NSData* (*SBSCopyIconImagePNGDataForDisplayIdentifier)(NSString * bundleid) =  dlsym(sbserv, "SBSCopyIconImagePNGDataForDisplayIdentifier");
    UIImage *icon = nil;
    NSData *iconData = SBSCopyIconImagePNGDataForDisplayIdentifier(bundID);
    if (iconData != nil) {
        icon = [UIImage imageWithData:iconData];
    }
    return icon;
}


+(void)openAppByBundleID:(NSString *)bundID
{
    //    void* sbServices = dlopen("/System/Library/PrivateFrameworks/SpringBoardServices.framework/SpringBoardServices", RTLD_LAZY);
    //    int (*SBSLaunchApplicationWithIdentifier)(CFStringRef identifier, Boolean suspended) = dlsym(sbServices, "SBSLaunchApplicationWithIdentifier");
    //    const char *strBundleId = [bundID cStringUsingEncoding:NSUTF8StringEncoding];
    //    int result = SBSLaunchApplicationWithIdentifier((__bridge CFStringRef)bundID, NO);
    //    dlclose(sbServices);
    
    Class LSApplicationWorkspace_class = objc_getClass("LSApplicationWorkspace");
    
    NSObject * workspace = [LSApplicationWorkspace_class performSelector:@selector(defaultWorkspace) ];
    [workspace performSelector:@selector(openApplicationWithBundleID:) withObject:bundID];
}


+(NSArray *)getRunningProcesses
{
    int mib[4] = {CTL_KERN, KERN_PROC, KERN_PROC_ALL, 0};
    size_t miblen = 4;
    
    size_t size;
    int st = sysctl(mib, miblen, NULL, &size, NULL, 0);
    
    struct kinfo_proc * process = NULL;
    struct kinfo_proc * newprocess = NULL;
    
    do {
        size += size / 10;
        newprocess = realloc(process, size);
        if (!newprocess){
            if (process){
                free(process);
            }
            return nil;
        }
        process = newprocess;
        st = sysctl(mib, miblen, process, &size, NULL, 0);
    } while (st == -1 && errno == ENOMEM);
    
    if (st == 0){
        if (size % sizeof(struct kinfo_proc) == 0){
            int nprocess = size / sizeof(struct kinfo_proc);
            if (nprocess){
                NSMutableArray * array = [[NSMutableArray alloc] init];
                for (int i = nprocess - 1; i >= 0; i--){
                    NSString * processID = [[NSString alloc] initWithFormat:@"%d", process[i].kp_proc.p_pid];
                    NSString * processName = [[NSString alloc] initWithFormat:@"%s", process[i].kp_proc.p_comm];
                    NSDictionary * dict = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:processID, processName, nil]
                                                                        forKeys:[NSArray arrayWithObjects:@"ProcessID", @"ProcessName", nil]];
                    [array addObject:dict];
                    
                }
                free(process);
                return array;
            }
        }
    }
    
    return nil;
}

@end
