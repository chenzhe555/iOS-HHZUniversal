//
//  UILabel+HHZCategory.m
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "UILabel+HHZCategory.h"

@implementation UILabel (addTarget)
-(void)addTarget:(id)labelTarget andSelector:(SEL)selector
{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:labelTarget action:selector];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
}
@end
