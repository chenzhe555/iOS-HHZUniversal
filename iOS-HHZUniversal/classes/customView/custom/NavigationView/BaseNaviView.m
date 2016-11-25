//
//  BaseNaviView.m
//  core-ios-oc
//
//  Created by mc962 on 16/3/1.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "BaseNaviView.h"
#import "HHZLabel.h"

@interface BaseNaviView ()
@property (nonatomic, strong) HHZLabel * titleLabel;
@property (nonatomic, strong) NaviImageView * contentImageView;
@end

@implementation BaseNaviView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.titleLabel = [[HHZLabel alloc] init];
        self.titleLabel.textColor = kBaseNaviViewTitleNormalColor;
        self.titleLabel.font = [UIFont systemFontOfSize:kBaseNaviViewTitleFont];
        [self addSubview:self.titleLabel];
        
        self.contentImageView = [[NaviImageView alloc] init];
        [self addSubview:self.contentImageView];
    }
    return self;
}

-(void)createNaviView:(NSString *)title NormalImage:(UIImage *)normalImage SelectedImage:(UIImage *)selectedImage ShowType:(BaseNaviViewShowType)type
{
    self.contentImageView.normalImage = normalImage;
    self.contentImageView.selectedImage = selectedImage;
    
    if (title == nil)
    {
        self.contentImageView.frame = CGRectMake(kBaseNaviViewOnlyTitleOrImageSpace, (self.height - normalImage.size.height)/2, normalImage.size.width, normalImage.size.height);
        self.frame = CGRectMake(self.x, self.y, self.contentImageView.width + kBaseNaviViewOnlyTitleOrImageSpace*2, self.height);
        self.contentImageView.isSelect = false;
        return;
    }
    
    
    self.titleLabel.text = title;
    
    
    
    if (normalImage)
    {
        self.contentImageView.isSelect = false;
        switch (type) {
            case BaseNaviViewShowTypeTitleLeft:
            {
                self.titleLabel.frame = CGRectMake(kBaseNaviViewHaveImageSpace, (self.height - self.titleLabel.height)/2, self.titleLabel.width, self.titleLabel.height);
                self.contentImageView.frame = CGRectMake(self.titleLabel.x + self.titleLabel.width + kBaseNaviViewTitleAndImageSpace, (self.height - normalImage.size.height)/2, normalImage.size.width, normalImage.size.height);
                self.frame = CGRectMake(self.x, self.y, self.contentImageView.x + self.contentImageView.width + kBaseNaviViewHaveImageSpace, self.height);
            }
                break;
            case BaseNaviViewShowTypeTitleRight:
            {
                self.contentImageView.frame = CGRectMake(kBaseNaviViewHaveImageSpace, (self.height - normalImage.size.height)/2, normalImage.size.width, normalImage.size.height);
                self.titleLabel.frame = CGRectMake(self.contentImageView.x + self.contentImageView.width + kBaseNaviViewTitleAndImageSpace, (self.height - self.titleLabel.height)/2, self.titleLabel.width, self.titleLabel.height);
                self.frame = CGRectMake(self.x, self.y, self.titleLabel.x + self.titleLabel.width + kBaseNaviViewHaveImageSpace, self.height);
                
            }
                break;
            case BaseNaviViewShowTypeTitleBottom:
            {
                CGFloat superViewWidth = MAX(self.titleLabel.width, self.contentImageView.width) + kBaseNaviViewHaveImageSpace*2 + kBaseNaviViewTitleAndImageSpace;
                self.contentImageView.frame = CGRectMake((superViewWidth - normalImage.size.width)/2, (self.height - normalImage.size.height - kBaseNaviViewTitleAndImageSpace - self.titleLabel.height)/2, normalImage.size.width, normalImage.size.height);
                self.titleLabel.frame = CGRectMake((superViewWidth - self.titleLabel.width)/2, self.contentImageView.y + self.contentImageView.height + kBaseNaviViewTitleAndImageSpace, self.titleLabel.width, self.titleLabel.height);
                self.frame = CGRectMake(self.x, self.y, superViewWidth, self.height);
                
            }
                break;
            case BaseNaviViewShowTypeTitleTop:
            {
                CGFloat superViewWidth = MAX(self.titleLabel.width, self.contentImageView.width) + kBaseNaviViewHaveImageSpace*2 + kBaseNaviViewTitleAndImageSpace;
                self.titleLabel.frame = CGRectMake((superViewWidth - self.titleLabel.width)/2, (self.height - normalImage.size.height - kBaseNaviViewTitleAndImageSpace - self.titleLabel.height)/2, self.titleLabel.width, self.titleLabel.height);
                self.contentImageView.frame = CGRectMake((superViewWidth - normalImage.size.width)/2, self.titleLabel.y + self.titleLabel.height + kBaseNaviViewTitleAndImageSpace, normalImage.size.width, normalImage.size.height);
                self.frame = CGRectMake(self.x, self.y, superViewWidth, self.height);
            }
                break;
            default:
                break;
        }
    }
    else
    {
        self.titleLabel.frame = CGRectMake(kBaseNaviViewOnlyTitleOrImageSpace, (self.height - self.titleLabel.height)/2, self.titleLabel.width, self.titleLabel.height);
        self.frame = CGRectMake(self.x, self.y, self.titleLabel.width + kBaseNaviViewOnlyTitleOrImageSpace*2, self.height);
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    self.titleLabel.textColor = kBaseNaviViewTitleSelectedColor;
    self.contentImageView.isSelect = YES;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    self.titleLabel.textColor = kBaseNaviViewTitleNormalColor;
    self.contentImageView.isSelect = NO;
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    self.titleLabel.textColor = kBaseNaviViewTitleNormalColor;
    self.contentImageView.isSelect = NO;
}

@end


@implementation NaviImageView

-(void)setIsSelect:(BOOL)isSelect
{
    _isSelect = isSelect;
    if (self.isSelect && self.selectedImage)
    {
        self.image = self.selectedImage;
    }
    else
    {
        self.image = self.normalImage;
    }
}

@end
