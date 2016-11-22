//
//  HHZBase64Encrption.h
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//


@interface HHZBase64Encrption : NSObject
/**
 *  Base64加密
 *
 *  @param string 要加密的字符串
 *
 *  @return 返回加密后的字符串
 */
+(NSString *)base64StringFromText:(NSString *)string;


/**
 *  Base64解密
 *
 *  @param base64 要解密的字符串
 *
 *  @return 返回解密后的字符串
 */
+(NSString *)base64FromBase64String:(NSString *)base64;
@end
