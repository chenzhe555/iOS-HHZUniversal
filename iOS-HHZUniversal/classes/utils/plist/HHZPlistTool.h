//
//  HHZPlistTool.h
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

@interface HHZPlistTool : NSObject

/**
 *  获取Plist文件地址
 *
 *  @param plistFileName Plist文件名称
 *
 *  @return 
 */
+(NSString *)getPlistPath:(NSString *)plistFileName;

/**
 *  获取Key对应的参数值(最外层必须是Dictionary)
 *
 *  @param plistKey Plist Key
 *
 *  @return 
 */
+(id)getPlistValueForKey:(NSString *)plistKey plistName:(NSString *)plistFileName;

@end
