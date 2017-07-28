//
//  MCRightNavigationView.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/2/24.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "MCRightNavigationView.h"

@implementation MCRightNavigationView

+(void)createWithLeftTitle:(NSString *)title nolmalImage:(UIImage *)image selectedImage:(UIImage *)selectedImage andNavi:(UIViewController *)vc andSEL:(SEL)clickAction
{
    UIBarButtonItem * negativeSeperator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSeperator.width = -barItemSpace;
    
    vc.navigationItem.rightBarButtonItems = @[negativeSeperator,[self createNaviWithTitle:title nolmalImage:image selectedImage:selectedImage andNavi:vc andSEL:clickAction]];
}
@end
