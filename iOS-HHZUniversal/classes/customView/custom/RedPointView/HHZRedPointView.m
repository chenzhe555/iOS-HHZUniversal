//
//  HHZRedPointView.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/12/6.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZRedPointView.h"
#import "UIView+HHZCategory.h"
#import "UIImage+HHZCategory.h"
#import "HHZCalculateTool.h"
//红点的Tag值
#define RedPointTag 7260
//红点文字大小
#define RedPointFont 15.0f
//当数字大于99的时候的左右总共加的宽度，看着好看多了
#define AddWidth 5.0f

static CGFloat getRadiusMinus(NSString * count) {
    if (count.length > 5) {
        return 5.0;
    }
    else if (count.length == 5) {
        return 4.3;
    }
    else if (count.length == 4) {
        return 3.6;
    }
    else if (count.length == 3) {
        return 2.8;
    }
    return 2;
}

@interface HHZRedPointView ()
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

/**
 *  红点的真实个数
 */
@property (nonatomic, assign) NSInteger redRealCount;

/**
 *  最大显示的数字
 */
@property (nonatomic, assign) NSInteger maxShowCount;

@end

@implementation HHZRedPointView

+(instancetype)createRedPointView:(CGRect)frame parentView:(UIView *)parentView
{
    HHZRedPointView * redPointView = [[HHZRedPointView alloc] init];
    if (CGRectEqualToRect(frame, CGRectZero))
    {
        redPointView.frame = CGRectMake(parentView.width - 13, -13, 22, 22);
    }
    else
    {
        redPointView.frame = CGRectMake(frame.origin.x, frame.origin.y, 22, 22);
    }
    redPointView.backgroundColor = [UIColor redColor];
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
        
        //文字Label
        _redPointLabel = [[UILabel alloc] init];
        _redPointLabel.backgroundColor = [UIColor clearColor];
        _redPointLabel.textColor = [UIColor whiteColor];
        _redPointLabel.textAlignment = NSTextAlignmentCenter;
        _redPointLabel.font = [UIFont systemFontOfSize:RedPointFont];
        [self addSubview:_redPointLabel];
        self.hidden = YES;
        
        _redRealCount = 0;
        _maxShowCount = 99;
    }
    return self;
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    _originWidth = frame.size.width;
    _bgImageView.frame = self.bounds;
    _redPointLabel.frame = self.bounds;
}


-(void)changeTextFont:(CGFloat)fontSize
{
    _redPointLabel.font = [UIFont systemFontOfSize:fontSize];
}

-(void)addRedCount:(NSInteger)addCount
{
    _redRealCount += addCount;
    
    //处理红点显示数字
    if (_redRealCount > _maxShowCount)
    {
        self.redPointLabel.text = [NSString stringWithFormat:@"%ld+",(long)_maxShowCount];
    }
    else if (_redRealCount <= 0)
    {
        _redRealCount = 0;
        self.hidden = YES;
    }
    else
    {
        self.redPointLabel.text = [NSString stringWithFormat:@"%ld",(long)_redRealCount];
    }
    
    
    //处理文本的宽度问题
    CGSize size = [HHZCalculateTool getLabelActualSizeWithString:self.redPointLabel.text andFont:self.redPointLabel.font.pointSize andLines:0 andlabelWidth:1000];
    if (size.width > _originWidth) {
        [self changeLabelStyle:(size.width + 6) RadiusMinus:getRadiusMinus(self.redPointLabel.text)];
    }
    else {
        [self changeLabelStyle:_originWidth RadiusMinus:getRadiusMinus(self.redPointLabel.text)];
    }
}

-(void)changeLabelStyle:(CGFloat)width RadiusMinus:(CGFloat)minux
{
    self.frame = CGRectMake(self.x, self.y, width, self.height);
    self.layer.cornerRadius = self.width/minux;
    self.layer.masksToBounds = YES;
    self.hidden = NO;
}

-(void)setMaxShowCount:(NSInteger)maxCount
{
    if (maxCount > 10000) {
        _maxShowCount = 10000;
    }
    _maxShowCount = maxCount;
}

@end
