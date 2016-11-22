//
//  HHZCacheTool.h
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//


@interface HHZCacheTool : NSObject

/**
 *  缓存基本数据(不带回调)
 *
 *  @param object 缓存对象
 *  @param key    
 */
+(void)setCacheObject:(__nonnull id <NSCoding>)object forKey:( NSString * __nonnull )key;

/**
 *  获取Key对应的缓存数据
 *
 *  @param key
 */
+(__nonnull id)getCacheObjectforKey:(NSString * __nonnull)key;
@end
