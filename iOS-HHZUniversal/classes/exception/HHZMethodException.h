//
//  HHZMethodException.h
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/18.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

@interface HHZMethodException : NSObject
/**
 *  方法未重写实现异常
 *
 *  @param className  类名
 *  @param methodName 方法名
 *
 *  @return 
 */
+(NSException *)exceptionWithClass:(NSString *)className Method:(NSString *)methodName;
@end
