//
//  NSDictionary+HHZCategory.m
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "NSDictionary+HHZCategory.h"

@implementation NSDictionary (Log)

-(NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString * mutaStr = [NSMutableString stringWithString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [mutaStr appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    
    [mutaStr appendString:@"}\n"];
    
    return mutaStr;
}

@end

@implementation NSMutableDictionary (Checknil)

-(void)setMCObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    if (anObject != nil)
    {
        [self setObject:anObject forKey:aKey];
    }
    else
    {
        [self setObject:[NSNull null] forKey:aKey];
    }
}

@end
