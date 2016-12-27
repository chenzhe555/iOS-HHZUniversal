//
//  SDWebImageDownloaderOperation+HHZCategory.m
//  iOS-HHZUniversal
//
//  Created by 陈哲是个好孩子 on 16/12/15.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "SDWebImageDownloaderOperation+HHZCategory.h"
#import <objc/runtime.h>

static const char * hhz_AllowDomainsArray_Key;

@implementation SDWebImageDownloaderOperation (AddDomain)

-(NSArray *)hhz_AllowDomainsArray
{
    return objc_getAssociatedObject(self, &hhz_AllowDomainsArray_Key);
}

-(void)setHhz_AllowDomainsArray:(NSArray *)hhz_AllowDomainsArray
{
    objc_setAssociatedObject(self, &hhz_AllowDomainsArray_Key, hhz_AllowDomainsArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)URLSession_hhz:(NSURLSession *)session task:(NSURLSessionTask *)task didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential *credential))completionHandler
{
    if (challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodClientCertificate)
    {
        if (!self.credential)
        {
            //添加业务允许域名
            if (!self.hhz_AllowDomainsArray) self.hhz_AllowDomainsArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"AllowDomainsUrl" ofType:@"plist"]];
            
            //如果在允许的列表中,则添加证书
            for(NSString * allowHost in self.hhz_AllowDomainsArray) {
                if ([allowHost rangeOfString:challenge.protectionSpace.host].location != NSNotFound)
                {
                    self.credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
                }
            }
        }
    }
    [self URLSession_hhz:session task:task didReceiveChallenge:challenge completionHandler:completionHandler];
}

+(void)load
{
    Method originMethod = class_getInstanceMethod([self class], @selector(URLSession:task:didReceiveChallenge:completionHandler:));
    Method replaceMethod = class_getInstanceMethod([self class], @selector(URLSession_hhz:task:didReceiveChallenge:completionHandler:));
    method_exchangeImplementations(replaceMethod, originMethod);
}
@end
