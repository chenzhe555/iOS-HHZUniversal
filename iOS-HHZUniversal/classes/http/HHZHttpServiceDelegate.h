//
//  HHZHttpServiceDelegate.h
//  iOS-HHZUniversal
//
//  Created by chenzhe.376811578@qq.com on 16/11/18.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

/*
 网络请求回调事件
 */
#import <Foundation/Foundation.h>
@class HHZHttpResponse;

@protocol HHZHttpServiceDelegate <NSObject>
@optional
/**
 *  请求成功
 *
 *  @param response
 */
-(void)requestSuccess:(HHZHttpResponse *)response;

/**
 *  请求失败（包括网络失败以及请求失败）
 *
 *  @param errorInfo
 */
-(void)requestFail:(HHZHttpResponse *)response;
@end
