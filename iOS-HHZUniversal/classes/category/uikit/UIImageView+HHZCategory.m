//
//  UIImageView+HHZCategory.m
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "UIImageView+HHZCategory.h"

@implementation UIImageView (HHZUtils_AddTarget)
-(void)addTarget_hhz:(id)target andSelector:(SEL)selector
{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:selector];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
}
@end