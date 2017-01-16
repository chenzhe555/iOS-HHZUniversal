//
//  BaseAlertView.m
//  iOS-HHZUniversal
//
//  Created by mc962 on 2017/1/12.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "BaseAlertView.h"
#import "HHZMethodException.h"

@implementation BaseAlertView

-(instancetype)init
{
    if (self = [super init]) {
        self.bgView = [[UIView alloc] init];
        self.bgView.backgroundColor = [UIColor grayColor];
        self.bgView.layer.cornerRadius = 5.0f;
        self.bgView.layer.masksToBounds = YES;
        [self addSubview:self.bgView];
        
        self.isFinished = YES;
    }
    return self;
}

+(instancetype)shareManager
{
    @throw [HHZMethodException exceptionWithClass:@"BaseAlertView" Method:@"shareManager"];
}

-(void)showAlertView
{
    @throw [HHZMethodException exceptionWithClass:@"BaseAlertView" Method:@"showAlertView"];
}


- (NSMutableArray *)dataArray {
	if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc] init];
	}
	return _dataArray;
}

@end
