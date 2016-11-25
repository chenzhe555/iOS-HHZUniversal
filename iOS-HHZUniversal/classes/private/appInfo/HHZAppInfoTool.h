//
//  HHZAppInfoTool.h
//  iOS_Universal_Project
//
//  Created by mc962 on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZAppInfo.h"

@interface HHZAppInfoTool : NSObject
/**
 *  通过过滤器获取手机中所有app，包括系统的
 *
 *  @param filterString 过滤器，nil则表示拿取所有的---返回数组
 *
 *  @return
 */
+(nullable NSArray *)getAppsbyFilter:(nonnull NSString *)filterString;

/**
 *  通过appProxy获取app详细信息
 *
 *  @param appProxy---返回CZAppInfo类型
 *
 *  @return
 */
+(nonnull HHZAppInfo *)getAppInfoByProxy:(nullable LSApplicationProxy *)appProxy;

/**
 *  根据bundleID获取appIcon
 *
 *  @param bundID---返回Image
 *
 *  @return
 */
+(nullable UIImage *)getAppbyIcon:(nonnull NSString *)bundID;

/**
 *  根据app的BundleID打开app
 *
 *  @param bundID
 */
+(void)openAppByBundleID:(nonnull NSString *)bundID;


/*
 获取手机中的所有进程---返回数组
 */
+(nullable NSArray *)getRunningProcesses;
@end
