//
//  BaseNoneDataView.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/2/24.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "BaseNoneDataView.h"

@implementation BaseNoneDataView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _iconView = [[UIImageView alloc] init];
        [self addSubview:_iconView];
        
        _textLabel = [[HHZLabel alloc] init];
        _textLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:_textLabel];
    }
    return self;
}

@end
