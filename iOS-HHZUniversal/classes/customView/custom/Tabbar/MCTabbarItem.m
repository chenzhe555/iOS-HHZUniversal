//
//  MCTabbarItem.m
//  core-ios-oc
//
//  Created by 陈哲#376811578@qq.com on 16/2/23.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "MCTabbarItem.h"
#import "MCTabBarDefine.h"
#import "HHZCalculateTool.h"


@interface MCTabbarItem()
/**
 *  图片按钮
 */
@property (nonatomic, strong) UIImageView * itemImage;

/**
 *  正常状态下图片
 */
@property (nonatomic, strong) UIImage * normalImage;

/**
 *  选中状态下图片
 */
@property (nonatomic, strong) UIImage * selectImage;

/**
 *  显示的文字
 */
@property (nonatomic, strong) UILabel * itemLabel;

/**
 *  是否有动画效果
 */
@property (nonatomic, assign) BOOL isAnimated;
@end

@implementation MCTabbarItem

- (instancetype)init
{
    self = [super init];
    if (self) {
        _itemType = MCTabbarItemTypeOnlyImage;
        _isAnimated = YES;
        _isBigNoClicked = NO;
        
        _itemImage = [[UIImageView alloc] init];
        [self addSubview:_itemImage];
        
        
        _itemLabel = [[UILabel alloc] init];
        _itemLabel.backgroundColor = [UIColor clearColor];
        _itemLabel.textColor = kMCTabbarItemTitleNormalColor;
        _itemLabel.textAlignment = NSTextAlignmentCenter;
        _itemLabel.font = [UIFont systemFontOfSize:10.0f];
        [self addSubview:_itemLabel];
        
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemButtonClicked)]];
        
        
         _isSelected = NO;
    }
    return self;
}

-(void)createWithText:(NSString *)text normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectImage Delegate:(id<MCTabbarItemDelegate>)delegate
{
    _delegate = delegate;
    _normalImage = normalImage;
    _selectImage = selectImage;
    switch (_itemType) {
        case MCTabbarItemTypeOnlyImage:
        {
            _itemImage.frame = CGRectMake((self.width - _normalImage.size.width)/2, self.isBigNoClicked ? (self.height - _normalImage.size.height)/2 - 18.5 : (self.height - _normalImage.size.height)/2, _normalImage.size.width, _normalImage.size.height);
            _itemImage.image = _normalImage;
        }
            break;
        case MCTabbarItemTypeImageAndText1:
        {
            _itemLabel.text = text;
            CGSize size1 =  [HHZCalculateTool getLabelActualSizeWithString:_itemLabel.text andFont:_itemLabel.font.pointSize andLines:0 andlabelWidth:5000];
            CGFloat space = 6;
            
            _itemImage.frame = CGRectMake((self.width - _normalImage.size.width)/2, self.isBigNoClicked ? (self.height - _normalImage.size.height - size1.height - space)/2 - 18.5 : (self.height - _normalImage.size.height - size1.height - space)/2, _normalImage.size.width, _normalImage.size.height);
            _itemLabel.frame = CGRectMake((self.width - size1.width)/2, _itemImage.y + _itemImage.height + space, size1.width, size1.height);
            
            _itemImage.image = _normalImage;
            
        }
            break;
        default:
            break;
    }
}

-(void)setIsSelected:(BOOL)isSelected
{
    _isSelected = isSelected;
    if (_isSelected)
    {
        _itemImage.image = _selectImage;
        _itemLabel.textColor = kMCTabbarItemTitleSelectedColor;
    }
    else
    {
        _itemImage.image = _normalImage;
        _itemLabel.textColor = kMCTabbarItemTitleNormalColor;
    }
}

-(void)itemButtonClicked
{
    if (_delegate && [_delegate respondsToSelector:@selector(barItemClicked:)])
    {
        [_delegate barItemClicked:self];
    }
}

-(void)startAnimation
{
    if (_isAnimated)
    {
        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
        scaleAnimation.toValue = [NSNumber numberWithFloat:1.5];
        scaleAnimation.autoreverses = YES;
        scaleAnimation.fillMode = kCAFillModeForwards;
        scaleAnimation.repeatCount = 1;
        scaleAnimation.duration = 0.2;
        [_itemImage.layer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    }
    
}

@end
