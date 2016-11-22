//
//  HHZHttpRequestCondition.h
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZHttpStruct.h"
#import "HHZHttpEnum.h"

@interface HHZHttpRequestCondition : NSObject
//是否需要带Token
@property (nonatomic, assign) BOOL needToken;

//失败后弹框的方式
@property (nonatomic, assign) HHZHttpAlertType alertType;

/**
 *  请求的序列化方式
 */
@property (nonatomic, assign) HHZHttpSerializerType serializerType;

/**
 *  失败默认是要弹框，提供不弹框生成器
 *
 *  @return
 */
+(instancetype)getNoneAlertCondition;
@end
