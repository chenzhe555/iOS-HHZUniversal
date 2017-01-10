//
//  HHZCacheTool.h
//  iOS-HHZUniversal
//
//  Created by chenzhe.376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface HHZCacheTool : NSObject

/**
 *  缓存基本数据(不带回调)
 *
 *  @param object 缓存对象
 *  @param key    
 */
+(void)setCacheObject:(id <NSCoding>)object forKey:(NSString *)key;

/**
 *  获取Key对应的缓存数据
 *
 *  @param key
 */
+(id)getCacheObjectforKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
