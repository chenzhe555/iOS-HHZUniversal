//
//  HHZAppInfo.h
//  iOS_Universal_Project
//
//  Created by mc962 on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

@class LSApplicationProxy;

@interface HHZAppInfo : NSObject
/**
 *  app的BundleID
 */
@property (nonatomic, copy) NSString * bundleID;
/**
 *  app的名字
 */
@property (nonatomic, copy) NSString * appName;
/**
 *  app的版本号
 */
@property (nonatomic, copy) NSString * appVersion;


-(HHZAppInfo *)initWithProxy:(LSApplicationProxy *)proxy;
@end
