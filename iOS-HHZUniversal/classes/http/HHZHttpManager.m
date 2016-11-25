//
//  HHZHttpManager.m
//  iOS-HHZUniversal
//
//  Created by mc962 on 16/11/25.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZHttpManager.h"

@implementation HHZHttpManager

+(instancetype)shareManager
{
    static HHZHttpManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[HHZHttpManager alloc] initWithBaseURL:[NSURL URLWithString:[self getPlistValueForKey:@"AF_BASE_HTTP_URL" plistName:@"HHZHTTPConfigPlist"]]];
        //默认不是HTTPS和允许抓包
        manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    
    return manager;
}

-(NSString *)getBaseHttpUrl
{
    static NSString * url = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        url = [[self class] getPlistValueForKey:@"AF_BASE_HTTP_URL" plistName:@"HHZHTTPConfigPlist"];
    });
    return url;
}

+(id)getPlistValueForKey:(NSString *)plistKey plistName:(NSString *)plistFileName
{
    return [[[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:plistFileName ofType:@"plist"]] objectForKey:plistKey];
}

@end