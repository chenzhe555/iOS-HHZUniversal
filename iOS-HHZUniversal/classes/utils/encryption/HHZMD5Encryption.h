//
//  HHZMD5Encryption.h
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

@interface HHZMD5Encryption : NSObject
/**
 *  MD5加密
 *
 *  @param inputString 加密字符串
 *
 *  @return 返回加密后的字符串
 */
+(NSString *)MD5EncryptionToString:(NSString *)inputString;

#pragma mark SHA
/**
 *  SHA单向散列算法
 *
 *  @param inputString 加密字符串
 *
 *  @return 返回加密后的字符串
 */
+(NSString *)SHAEncryptionToString:(NSString *)inputString;
@end