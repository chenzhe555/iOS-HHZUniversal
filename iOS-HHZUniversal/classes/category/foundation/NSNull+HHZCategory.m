//
//  NSNull+HHZCategory.m
//  iOS_Universal_Project
//
//  Created by mc962 on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "NSNull+HHZCategory.h"
#import <objc/runtime.h>

NSUInteger getDefaultLength(id self,SEL _cmd)
{
    return 0;
}

@implementation NSNull (forwardMethod)

+(BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == @selector(length) || sel == @selector(count))
    {
        class_addMethod([self class], sel, (IMP) getDefaultLength, "I@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

@end
