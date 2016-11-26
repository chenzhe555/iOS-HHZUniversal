//
//  MCRedPointView.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/2/23.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "MCRedPointView.h"
#import "UIView+HHZCategory.h"
#import "UIImage+HHZCategory.h"
//红点的Tag值
#define RedPointTag 7260
//红点文字大小
#define RedPointFont 15.0f
//当数字大于99的时候的左右总共加的宽度，看着好看多了
#define AddWidth 5.0f


@interface MCRedPointView ()
/**
 *  数字Label
 */
@property (nonatomic, strong) UILabel * redPointLabel;

/**
 *  背景ImageView
 */
@property (nonatomic, strong) UIImageView * bgImageView;

/**
 *  原始宽度
 */
@property (nonatomic, assign) CGFloat originWidth;

@end

@implementation MCRedPointView

+(void)appendRedPointView:(UIView *)parentView andRedCount:(NSInteger)redCount andRect:(CGRect)rect
{
    BOOL isExist = NO;
    if (CGRectEqualToRect(rect, CGRectZero))
    {
        rect = CGRectMake(parentView.width - 13, -13, 26, 26);
    }
    for(UIView * vie in parentView.subviews)
    {
        //如果父视图已存在红点
        if (vie.tag == RedPointTag)
        {
            isExist = YES;
            MCRedPointView * redPointView = (MCRedPointView *)vie;
            NSInteger realCount = redCount + [redPointView.redPointLabel.text integerValue];
            [redPointView chanegRedCount:realCount];
            
            break;
        }
    }
    
    if (!isExist)
    {
        if (redCount <= 0)
        {
            return;
        }
        MCRedPointView * redPointView = [MCRedPointView createRedView:rect parentView:parentView];
        [redPointView chanegRedCount:redCount];
    }

}

+(void)appendRedPointViewNoAdd:(UIView *)parentView andRedCount:(NSInteger)redCount andRect:(CGRect)rect
{
    BOOL isExist = NO;
    if (CGRectEqualToRect(rect, CGRectZero))
    {
        rect = CGRectMake(parentView.width - 13, -13, 26, 26);
    }
    for(UIView * vie in parentView.subviews)
    {
        if (vie.tag == RedPointTag)
        {
            isExist = YES;
            MCRedPointView * redPointView = (MCRedPointView *)vie;
            
            if (redCount == 0)
            {
                [redPointView removeFromSuperview];
                redPointView = nil;
                return;
            }
            [redPointView chanegRedCount:redCount];
            
            break;
        }
    }
    
    if (!isExist)
    {
        if (redCount <= 0)
        {
            return;
        }
        MCRedPointView * redPointView = [MCRedPointView createRedView:rect parentView:parentView];
        [redPointView chanegRedCount:redCount];
        
    }

}

+(instancetype)createRedView:(CGRect)frame parentView:(UIView *)parentView
{
    MCRedPointView * redPointView = [[MCRedPointView alloc] init];
    if (CGRectEqualToRect(frame, CGRectZero))
    {
        redPointView.frame = CGRectMake(parentView.width - 13, -13, 26, 26);
    }
    else
    {
        redPointView.frame = frame;
    }
    [parentView addSubview:redPointView];
    return redPointView;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tag = RedPointTag;
        
        //背景imgView
        _bgImageView = [[UIImageView alloc] init];
        _bgImageView.image = [UIImage transformToPureImageWithColor_hhz:[UIColor redColor]];
        [self addSubview:_bgImageView];
        
        _redPointLabel = [[UILabel alloc] init];
        _redPointLabel.backgroundColor = [UIColor clearColor];
        _redPointLabel.textColor = [UIColor whiteColor];
        _redPointLabel.textAlignment = NSTextAlignmentCenter;
        _redPointLabel.font = [UIFont systemFontOfSize:RedPointFont];
        [self addSubview:_redPointLabel];
    }
    return self;
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    _originWidth = frame.size.width;
}


-(void)chanegRedCount:(NSInteger)realCount
{
    if (realCount > 99)
    {
        realCount = 99;
        self.frame = CGRectMake(self.x, self.y, _originWidth + AddWidth, self.height);
        if ((![self.redPointLabel.text isEqualToString:@"99+"]) || self.redPointLabel.text.length == 0)
        {
            self.layer.cornerRadius = self.width/2.5f;
            self.layer.masksToBounds = YES;
        }
        self.redPointLabel.text = [NSString stringWithFormat:@"%ld+",(long)realCount];
        
    }
    else if (realCount <= 0)
    {
        [self removeFromSuperview];
        return;
    }
    else
    {
        self.frame = CGRectMake(self.x, self.y, _originWidth, self.height);
        if ([self.redPointLabel.text isEqualToString:@"99+"] || self.redPointLabel.text.length == 0)
        {
            self.layer.cornerRadius = self.width/2.0f;
            self.layer.masksToBounds = YES;
        }
        self.redPointLabel.text = [NSString stringWithFormat:@"%ld",(long)realCount];
        
    }
    self.redPointLabel.frame = self.bounds;
    self.bgImageView.frame = self.bounds;
}

@end
