//
//  HHZAppInfo.m
//  iOS-HHZUniversal
//
//  Created by chenzhe.376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZAppInfo.h"
#import "LSApplicationProxy.h"


#define APP_BundleID_Identify                   @"applicationIdentifier"
#define APP_AppName_Identify                    @"localizedName"
#define APP_AppVersion_Identify                 @"shortVersionString"

@interface HHZAppInfo()
@property (nonatomic, strong) LSApplicationProxy * appProxy;
@end

@implementation HHZAppInfo
-(HHZAppInfo *)initWithProxy:(LSApplicationProxy *)proxy
{
    if (self = [super init])
    {
        _appProxy = proxy;
    }
    return self;
}

-(NSString *)bundleID
{
    return [_appProxy valueForKey:APP_BundleID_Identify];
}

-(NSString *)appName
{
    NSString * appStr = [[_appProxy valueForKey:APP_AppName_Identify] description];
    if (appStr.length == 0)
    {
        NSString * bundleid = [_appProxy valueForKey:APP_BundleID_Identify];
        NSArray * arr = [bundleid componentsSeparatedByString:@"."];
        NSMutableString * mutaStr = [[NSMutableString alloc] initWithString:@"<null>---"];
        for (int i = 2; i < arr.count; i++)
        {
            [mutaStr appendString:[arr objectAtIndex:i]];
        }
        return mutaStr;
    }
    return appStr;
}

-(NSString *)appVersion
{
    return [_appProxy valueForKey:APP_AppVersion_Identify];
}
@end
