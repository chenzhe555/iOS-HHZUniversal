//
//  DemoViewController.h
//  iOS-HHZUniversal
//
//  Created by mc962 on 16/12/8.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DemoHttpService.h"
#import "HHZViewController.h"

@interface DemoViewController : HHZViewController<HHZHttpServiceDelegate>
@property (nonatomic, strong) DemoHttpService * currentService;
@end
