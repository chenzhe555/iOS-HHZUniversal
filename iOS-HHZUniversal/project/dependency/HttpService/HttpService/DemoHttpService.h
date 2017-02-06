//
//  DemoHttpService.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/12/7.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZHttpService.h"

@interface DemoHttpService : HHZHttpService
@property (nonatomic, assign) id<HHZHttpServiceDelegate> delegate;

-(HHZHttpResult *)testHttpRequestArg1:(NSString *)arg1 Arg2:(NSUInteger)arg2 Condition:(HHZHttpRequestCondition *)condition;

@end
