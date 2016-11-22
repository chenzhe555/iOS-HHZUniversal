//
//  HHZCacheTool.m
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZCacheTool.h"
#import <PINCache/PINCache.h>

@implementation HHZCacheTool
+(void)setCacheObject:(id<NSCoding>)object forKey:(NSString *)key
{
    [[PINCache sharedCache] setObject:object forKey:key];
}

+(__nonnull id)getCacheObjectforKey:(NSString *)key
{
    return [[PINCache sharedCache] objectForKey:key];
}
@end
