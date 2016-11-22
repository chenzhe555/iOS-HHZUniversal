//
//  NSString+HHZCategory.m
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "NSString+HHZCategory.h"
#import <objc/runtime.h>

@implementation NSString (Verify)
+(NSString *)transformStringWithObj:(id)obj
{
    if (obj == nil) return @"";
    return [NSString stringWithFormat:@"%@",obj];
}
@end

@implementation NSString (JSONValue)

+(NSData *)JSONDataWithJSONObj:(id)jsonObj
{
    if (jsonObj == nil)
    {
        return nil;
    }
    NSError * err = nil;
    NSData * data = [NSJSONSerialization dataWithJSONObject:jsonObj options:NSJSONWritingPrettyPrinted error:&err];
    if (data.length > 0 && err == nil)
    {
        return data;
    }
    return nil;
}

-(id)JSONIdWithJSONString
{
    if (self == nil || self.length == 0)
    {
        return nil;
    }
    NSError * err = nil;
    id data = [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:&err];
    if (data != nil && err == nil)
    {
        return data;
    }
    return nil;
}


@end


@implementation NSString (AttributString)

-(NSMutableAttributedString *)addCustomAttributeFont:(UIFont *)font andColor:(UIColor *)color andRange:(NSRange)range
{
    NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc]initWithString:self];
    if (font)
    {
        [attStr addAttribute:NSFontAttributeName value:font range:range];
    }
    if (color)
    {
        [attStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
    return attStr;
}

-(NSMutableAttributedString *)addCustomAttributeFont:(UIFont *)font andColor:(UIColor *)color andText:(NSString *)searchText
{
    if ([self rangeOfString:searchText].location == NSNotFound)
    {
        return [[NSMutableAttributedString alloc]initWithString:self];
    }
    NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc]initWithString:self];
    NSMutableArray * mutaArr = [NSMutableArray array];
    NSRange searchRange = NSMakeRange(0, self.length);
    NSRange resultRange;
    while ((resultRange = [self rangeOfString:searchText options:0 range:searchRange]).location != NSNotFound)
    {
        [mutaArr addObject:[NSValue valueWithRange:resultRange]];
        searchRange = NSMakeRange(NSMaxRange(resultRange), self.length - NSMaxRange(resultRange));
    }
    for (int i = 0; i < mutaArr.count; i++)
    {
        if (font)
        {
            [attStr addAttribute:NSFontAttributeName value:font range:[[mutaArr objectAtIndex:i] rangeValue]];
        }
        if (color)
        {
            [attStr addAttribute:NSForegroundColorAttributeName value:color range:[[mutaArr objectAtIndex:i] rangeValue]];
        }
    }
    return attStr;
}

-(NSMutableAttributedString *)addLineAttributerWithTextWithColor:(UIColor *)color
{
    return [self addLineAttributerWithRange:NSMakeRange(0, self.length) andColor:color];
}

-(NSMutableAttributedString *)addLineAttributerWithRange:(NSRange)range andColor:(UIColor *)color
{
    NSMutableAttributedString * str = [[NSMutableAttributedString alloc] initWithString:self];
    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:range];
    if (color != nil)
    {
        [str addAttribute:NSUnderlineColorAttributeName value:color range:range];
    }
    return str;
}

@end

@implementation NSString (ClassBuild)

-(Class)getObjClass
{
    const char * className = [self cStringUsingEncoding:NSASCIIStringEncoding];
    Class objClass = objc_getClass(className);
    //如果木有,则注册创建一个
    if (objClass == nil)
    {
        Class superClass = [NSObject class];
        objClass = objc_allocateClassPair(superClass, className, 0);
        objc_registerClassPair(objClass);
    }
    return objClass;
}

@end
