//
//  HHZHttpRequestCondition.m
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZHttpRequestCondition.h"

@implementation HHZHttpRequestCondition
- (instancetype)init
{
    self = [super init];
    if (self) {
        _needToken = YES;
        _alertType = HHZHttpAlertTypeNative;
        _serializerType = HHZHttpSerializerType1;
    }
    return self;
}

+(instancetype)getNoneAlertCondition
{
    HHZHttpRequestCondition * condition = [[HHZHttpRequestCondition alloc] init];
    condition.alertType = HHZHttpAlertTypeNone;
    return condition;
}
@end
