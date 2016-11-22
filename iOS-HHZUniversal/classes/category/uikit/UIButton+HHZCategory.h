//
//  UIButton+HHZCategory.h
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#pragma mark 便利设置器
@interface UIButton (setAttribution)
/**
 *  设置button文字(正常、选中)
 *
 *  @param normalTitle   正常情况下
 *  @param selectedTitle 选中情况下
 */
-(void)setNormalTitle:(NSString *)normalTitle andSelectedTitle:(NSString *)selectedTitle;

/**
 *  设置button的图片(正常、高亮、选中)
 *
 *  @param normalImage   正常情况下
 *  @param highImage     高亮情况下
 *  @param selectedImage 选中情况下
 */
-(void)setNormalImage:(UIImage *)normalImage andHighlightImage:(UIImage *)highImage andSelectedImage:(UIImage *)selectedImage;

/**
 *  设置button背景图片(正常、高亮、选中)
 *
 *  @param normalImage   正常情况下
 *  @param highImage     高亮情况下
 *  @param selectedImage 选中情况下
 */
-(void)setNormalBackgroundImage:(UIImage *)normalImage andHighlightBackgroundImage:(UIImage *)highImage andSelectedBackgroundImage:(UIImage *)selectedImage;

/**
 *  改变button的圆角度数
 填0则是6.0f
 *
 *  @param radius
 */
-(void)changeCornerRadius:(CGFloat)radius;
@end
