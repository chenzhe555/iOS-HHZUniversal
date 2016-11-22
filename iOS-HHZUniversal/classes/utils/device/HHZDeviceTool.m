//
//  HHZDeviceTool.m
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZDeviceTool.h"
#import <UIKit/UIDevice.h>
#include <sys/types.h>
#include <sys/sysctl.h>

//获取IP
#import <arpa/inet.h>
#import <ifaddrs.h>

#pragma mark 越狱相关，具体测试的时候再删减
//#include <sys/types.h>
//#include <sys/sysctl.h>
//#include <stdio.h>
//#include <stdlib.h>
//#include <string.h>
//#include <unistd.h>
//#include <sys/ioctl.h>
//#include <sys/socket.h>
//#include <netinet/in.h>
//#include <netdb.h>
//#include <arpa/inet.h>
//#include <sys/sockio.h>
//#include <net/if.h>
//#include <errno.h>
//#include <net/if_dl.h>
//#import "IPAddress.h"

@implementation HHZDeviceTool
+(NSString *)getCurrentVersion
{
    return  [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleShortVersionString"];
}

+(NSString *)getPhoneType
{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = (char*)malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    return platform;
}


+(NSString *)getDeviceSystemVersion
{
    NSString * str = [[UIDevice currentDevice] systemVersion];
    return str;
}

+(NSString *)getPhoneUUID
{
    CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
    NSString * result = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
    CFRelease(uuidRef);
    return result;
}

+(NSString *)getPhoneIPAddress
{
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while (temp_addr != NULL) {
            if( temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            
            temp_addr = temp_addr->ifa_next;
        }
    }
    
    // Free memory
    freeifaddrs(interfaces);
    
    return address;
}

//#pragma mark 越狱相关
//
//static const char * __jb_app = NULL;
//
//+(BOOL)isPrisonBreak
//{
//    static const char * __jb_apps[] =
//    {
//        "/Application/Cydia.app",
//        "/Application/limera1n.app",
//        "/Application/greenpois0n.app",
//        "/Application/blackra1n.app",
//        "/Application/blacksn0w.app",
//        "/Application/redsn0w.app",
//        NULL
//    };
//
//    __jb_app = NULL;
//
//    // method 1
//    for ( int i = 0; __jb_apps[i]; ++i )
//    {
//        if ( [[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithUTF8String:__jb_apps[i]]] )
//        {
//            __jb_app = __jb_apps[i];
//            return YES;
//        }
//    }
//
//    // method 2
//    if ( [[NSFileManager defaultManager] fileExistsAtPath:@"/private/var/lib/apt/"] )
//    {
//        return YES;
//    }
//
//    // method 3
//    if ( 0 == system("ls") )
//    {
//        return YES;
//    }
//
//    return NO;
//}
//
//+(NSString *)prisonBreakVersion
//{
//    if ( __jb_app )
//    {
//        return [NSString stringWithUTF8String:__jb_app];
//    }
//    else
//    {
//        return @"";
//    }
//}
//
//+(NSString *)localIPAddress
//{
//    InitAddresses();
//
//    GetIPAddresses();
//
//    GetHWAddresses();
//
//    return [NSString stringWithFormat:@"%s", ip_names[1]];
//}
@end
