//
//  MCNoneDataView.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/2/24.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "MCNoneDataView.h"
#import "HHZLabel.h"
#import "UIImageView+HHZCategory.h"
#import "UILabel+HHZCategory.h"
#import "UIView+HHZCategory.h"

typedef NS_ENUM(NSInteger,MCNoneDataViewType){
    MCNoneDataViewTypeText = 101,
    MCNoneDataViewTypeIcon,
    MCNoneDataViewTypeIconAndText,
};
//字体大小
#define kMCNoneDataViewDefaultTextLabelFont      17.0f
//label和图片的间距
#define kMCNoneDataViewDefaultIconLabelSpace     15.0f

@interface MCNoneDataView()
/**
 *  菊花(例子、可以点击后视图View转菊花，但是不推荐这么使用，应该由业务的决定该怎么处理点击后的操作)
 */
@property (nonatomic, strong) UIActivityIndicatorView * activityView;
/**
 *  显示的类型
 */
@property (nonatomic, assign) MCNoneDataViewType type;
@end

@implementation MCNoneDataView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.iconView addTarget_hhz:self andSelector:@selector(tapViewForRequest)];
        [self.textLabel addTarget_hhz:self andSelector:@selector(tapViewForRequest)];
        self.textLabel.font = [UIFont systemFontOfSize:kMCNoneDataViewDefaultTextLabelFont];
        self.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    self.textLabel.limitWidth = self.frame.size.width - 30*2;
}

-(void)tapViewForRequest
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(dlTapDataViewForRequestNewData)])
    {
        [self.delegate dlTapDataViewForRequestNewData];
    }
}

-(void)updateIconImage:(UIImage *)iconImage andText:(NSString *)text
{
    if (iconImage == nil && text != nil)
    {
        self.type = MCNoneDataViewTypeText;
    }
    else if (iconImage != nil && text == nil)
    {
        self.type = MCNoneDataViewTypeIcon;
    }
    else if (iconImage != nil && text != nil)
    {
        self.type = MCNoneDataViewTypeIconAndText;
    }
    else
    {
        return;
    }
    
    switch (self.type)
    {
        case MCNoneDataViewTypeIconAndText:
        {
            self.iconView.image = iconImage;
            self.textLabel.text = text;
            self.iconView.frame = CGRectMake((self.width - iconImage.size.width)/2, (self.height - iconImage.size.height - kMCNoneDataViewDefaultIconLabelSpace - self.textLabel.height)/2, iconImage.size.width, iconImage.size.height);
            self.textLabel.frame = CGRectMake((self.width - self.textLabel.width)/2, self.iconView.height + self.iconView.y + kMCNoneDataViewDefaultIconLabelSpace, self.textLabel.width, self.textLabel.height);
            self.iconView.hidden = NO;
            self.textLabel.hidden = NO;
        }
            break;
        case MCNoneDataViewTypeIcon:
        {
            self.iconView.image = iconImage;
            self.iconView.frame = CGRectMake((self.width - iconImage.size.width)/2, (self.height - self.iconView.height)/2, iconImage.size.width, iconImage.size.height);
            self.textLabel.hidden = YES;
            self.iconView.hidden = NO;
        }
            break;
        case MCNoneDataViewTypeText:
        {
            self.textLabel.text = text;
            self.textLabel.frame = CGRectMake((self.width - self.textLabel.width)/2, (self.height - self.textLabel.height)/2, self.textLabel.width, self.textLabel.height);
            self.iconView.hidden = YES;
            self.textLabel.hidden = NO;
        }
            break;
            
        default:
            break;
    }
    
}
@end
