//
//  MCSlipTopItemCell.m
//  core-ios-oc
//
//  Created by 陈哲#376811578@qq.com on 16/2/24.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "MCSlipTopItemCell.h"
#import "MCSlipScrollViewDefine.h"
#import "HHZLabel.h"

@implementation MCSlipTopItemCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _titleLabel = [[HHZLabel alloc] init];
        _titleLabel.textColor = kTopScrollViewTextNormalColor;
        _titleLabel.font = [UIFont systemFontOfSize:kTopTitleFont];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLabel];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


-(void)setIsSelected:(BOOL)isSelected
{
    _isSelected = isSelected;
    if (_isSelected)
    {
        self.titleLabel.textColor = kTopScrollViewTextSelectedColor;
    }
    else
    {
        self.titleLabel.textColor = kTopScrollViewTextNormalColor;
    }
    
}

+(instancetype)configCellWithTableView:(UITableView *)tableView
{
    static NSString * MCSlipTopItemCellIndentifier = @"";
    MCSlipTopItemCell * cell = [tableView dequeueReusableCellWithIdentifier:MCSlipTopItemCellIndentifier];
    if (!cell)
    {
        cell = [[MCSlipTopItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MCSlipTopItemCellIndentifier];
        cell.transform = CGAffineTransformMakeRotation(M_PI_2);
    }
    return cell;
}

-(void)titleShowAnimate
{
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.3];
    scaleAnimation.autoreverses = YES;
    scaleAnimation.fillMode = kCAFillModeForwards;
    scaleAnimation.repeatCount = 1;
    scaleAnimation.duration = 0.2;
    [self.titleLabel.layer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    
    self.titleLabel.textColor = kTopScrollViewTextSelectedColor;
}

@end
