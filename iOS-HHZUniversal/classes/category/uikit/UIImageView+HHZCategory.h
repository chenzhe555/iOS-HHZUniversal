//
//  UIImageView+HHZCategory.h
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//


#pragma mark 添加点击事件
@interface UIImageView (addTarget)
/**
 *  给图片添加点击事件
 *
 *  @param target
 *  @param selector
 */
-(void)addTarget:(id)target andSelector:(SEL)selector;
@end
