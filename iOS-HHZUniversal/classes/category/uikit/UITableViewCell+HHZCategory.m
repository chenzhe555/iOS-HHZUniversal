//
//  UITableViewCell+HHZCategory.m
//  iOS-HHZUniversal
//
//  Created by chenzhe.376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "UITableViewCell+HHZCategory.h"

@implementation UITableViewCell (ExtraView)

-(void)addDefaultSeparateLine:(UIColor *)color
{
    UIView * vie = [[UIView alloc] init];
    vie.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
    vie.frame = CGRectMake(10, self.frame.size.height - 0.5, self.frame.size.width - 10, 0.5);
    [self addSubview:vie];
}

-(void)addBasicInfoConfig
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

+(instancetype)configCellWithTableView:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end