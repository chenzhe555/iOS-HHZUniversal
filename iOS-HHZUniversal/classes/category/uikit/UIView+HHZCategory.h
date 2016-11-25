//
//  UIView+HHZCategory.h
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

#pragma mark 视图Rect
@interface UIView (setFrame)

/**
 *  设置 获取Origin
 *
 *  @return
 */
-(CGPoint)origin;
-(void)setOrigin:(CGPoint) point;

/**
 *  设置 获取size
 *
 *  @return
 */
-(CGSize)size;
-(void)setSize:(CGSize) size;

/**
 *  设置 获取x
 *
 *  @return
 */
-(CGFloat)x;
-(void)setX:(CGFloat)x;

/**
 *  设置 获取y
 *
 *  @return
 */
-(CGFloat)y;
-(void)setY:(CGFloat)y;

/**
 *  设置 获取height
 *
 *  @return
 */
-(CGFloat)height;
-(void)setHeight:(CGFloat)height;

/**
 *  设置 获取width
 *
 *  @return
 */
-(CGFloat)width;
-(void)setWidth:(CGFloat)width;

/**
 *  设置 获取tail
 *
 *  @return
 */
-(CGFloat)tail;
-(void)setTail:(CGFloat)tail;

/**
 *  设置 获取bottom
 *
 *  @return
 */
-(CGFloat)bottom;
-(void)setBottom:(CGFloat)bottom;

/**
 *  设置 获取right
 *
 *  @return
 */
-(CGFloat)right;
-(void)setRight:(CGFloat)right;

@end

#pragma mark 修复视图Bug
@interface UIView (FixViewDebugging)

@end

#pragma mark 截当前屏幕图
@interface UIView(Screenshot)

- (UIImage *)generateScreenShot;

@end

#pragma mark 波纹动画
@interface UIView(rippleEffect)

- (void)showRippleEffect;

@end

NS_ASSUME_NONNULL_END
