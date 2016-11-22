//
//  UIColor+HHZCategory.h
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//


#pragma mark 与16进制之间的转换
@interface UIColor (Hex)

/**
 *  通过16进制转换成UIColor对象
 *
 *  @param hex 16进制
 *
 *  @return
 */
+(UIColor *)colorWithHex:(UInt32)hex;

/**
 *  通过16进制和透明度转换成UIColor对象
 *
 *  @param hex   16进制
 *  @param alpha 透明度
 *
 *  @return
 */
+(UIColor *)colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;

/**
 *  通过16进制字符串转换成UIColor对象
 *
 *  @param hexString 16进制字符串
 *
 *  @return
 */
+(UIColor *)colorWithHexString:(NSString *)hexString;
/**
 *  通过RGB转换成16进制字符串
 *
 *  @return
 */
-(NSString *)HexString;

@end