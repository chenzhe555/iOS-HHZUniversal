//
//  HHZTabbarModel.m
//  iOS-HHZUniversal
//
//  Created by mc962 on 16/12/6.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZTabbarModel.h"

@implementation HHZTabbarModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        _isBigNoClicked = NO;
        _title = @"";
    }
    return self;
}
@end