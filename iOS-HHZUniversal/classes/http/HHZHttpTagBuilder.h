//
//  HHZHttpTagBuilder.h
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//


@interface HHZHttpTagBuilder : NSObject
/**
 *  获取请求Tag实例
 *
 *  @return
 */
+(instancetype)shareManager;

/**
 *  获取Tag唯一标示
 *
 *  @return
 */
-(NSUInteger)getSoleHttpTag;
@end
