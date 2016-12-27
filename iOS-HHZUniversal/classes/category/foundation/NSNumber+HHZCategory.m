//
//  NSNumber+HHZCategory.m
//  iOS-HHZUniversal
//
//  Created by chenzhe.376811578@qq.com on 16/12/27.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "NSNumber+HHZCategory.h"
#import <objc/runtime.h>

@implementation NSNumber (HHZUtils_AddMethod)

+(void)load
{
    //添加length方法
    class_addMethod([self class], @selector(length), class_getMethodImplementation(self, @selector(length)), "I@:");
}

-(NSInteger)length
{
    return [NSString stringWithFormat:@"%@",self].length;
}
@end
