//
//  HHZHttpStruct.m
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/18.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZHttpStruct.h"

@implementation HHZHttpRequest

@end

@implementation HHZHttpResponse

@end

@implementation HHZHttpResult
+(HHZHttpResult *)generateDefaultResult:(NSUInteger)tag
{
    HHZHttpResult * result = [[HHZHttpResult alloc] init];
    result.tag = tag;
    return result;
}
@end
