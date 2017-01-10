//
//  HHZLoggerTool.h
//  iOS-HHZUniversal
//
//  Created by mc962 on 2017/1/10.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*
 暂时先用着三方的,项目中用着NSLogger的，便于在应用中查看
 */

@interface HHZLoggerTool : NSObject
/**
 *  打开
 */
+(void)turnOnLogger;
@end

NS_ASSUME_NONNULL_END
