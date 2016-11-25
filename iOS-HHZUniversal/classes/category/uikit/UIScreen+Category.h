//
//  UIScreen+Category.h
//  iOS-HHZUniversal
//
//  Created by mc962 on 16/11/24.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScreen (HHZUtils_UIScreen)
/**
 *  获取屏幕比例
 *
 *  @return 
 */
+(CGFloat)screenScale_hhz;

/**
 *  获取屏幕Rect
 *
 *  @return Rect
 */
-(CGRect)screenBoundsWithOrientation_hhz:(UIInterfaceOrientation)orientation;
@end

NS_ASSUME_NONNULL_END