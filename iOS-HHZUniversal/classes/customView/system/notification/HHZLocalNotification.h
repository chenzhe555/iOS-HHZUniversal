//
//  HHZLocalNotification.h
//  iOS-HHZUniversal
//
//  Created by mc962 on 16/11/25.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHZLocalNotification : NSObject
/**
 *  注册本地通知
 *
 *  @param time    延时时间
 *  @param content 显示文本内容
 *  @param notiKey 通知的Key,用于取消通知
 *  @param body    附加参数,没有传nil
 */
+(void)createLocalNotificationWithTime:(NSTimeInterval)time AndContent:(NSString *)content AndKey:(NSString *)notiKey AndBody:(NSDictionary *)body;

/**
 *  通过Key取消某个通知
 *
 *  @param key
 */
+(void)cancelLocalNotificationWithKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END