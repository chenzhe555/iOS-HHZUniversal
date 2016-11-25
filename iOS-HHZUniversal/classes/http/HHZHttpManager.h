//
//  HHZHttpManager.h
//  iOS-HHZUniversal
//
//  Created by mc962 on 16/11/25.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <AFNetworking/AFHTTPSessionManager.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHZHttpManager : AFHTTPSessionManager

/**
 *  获取Http单例
 *
 *  @return 
 */
+(instancetype)shareManager;

/**
 *  获取主机IP
 *
 *  @return 
 */
-(NSString *)getBaseHttpUrl;

@end


NS_ASSUME_NONNULL_END