//
//  MCToastView.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/2/23.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "MCToastView.h"
#import "HHZKitTool.h"
#import "HHZCalculateTool.h"
#import "HHZMACROConfig.h"
#import "UIView+HHZCategory.h"

//背景透明度
#define kMCToastViewAlpha           0.8f

//Toast消失的时间
#define kMCToastViewDuring          1.5f
//Toast文字字体大小
#define kMCToastViewFont            15.0f
#define kMCToastViewLeftSpace       10.0f
#define kMCToastViewTopSpace        10.0f
//Toast图片和文字的间隙
#define KMCToastViewBottomSpace     60.0f


//是否带完成的Block回调
static BOOL isHavaBlock;

@interface MCToastView()
/**
 *  文字上方的图片
 */
@property (nonatomic, strong) UIImageView * titleImage;

/**
 *  文字文本
 */
@property (nonatomic, strong) UILabel * titleLabel;

/**
 *  文字的位置类型
 */
@property (nonatomic, assign) MCToastViewShowType type;

/**
 *  完成的Block回调
 */
@property (nonatomic, copy) toastFinishedBlock toastBlock;

/**
 *  定时器
 */
@property (nonatomic, strong) NSTimer * showTimer;
@end

@implementation MCToastView

+(instancetype)shareLoadingView
{
    static MCToastView * custom = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        custom = [[MCToastView alloc] init];
        UIWindow * window = [HHZKitTool getMainWindow];
        custom.frame = window.bounds;
        [window addSubview:custom];
        custom.hidden = YES;
    });
    return custom;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.bgView.backgroundColor = [UIColor grayColor];
        self.bgView.alpha = kMCToastViewAlpha;
        [self addSubview:self.bgView];
        
        self.titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:kMCToastViewFont];
        _titleLabel.numberOfLines = 0;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor whiteColor];
//        _titleLabel.backgroundColor = [UIColor redColor];
        [self.bgView addSubview:_titleLabel];
        
        
        self.titleImage = [[UIImageView alloc] init];
        [self.bgView addSubview:self.titleImage];
        
    }
    return self;
}


-(void)showToast:(NSString *)toastString
{
    isHavaBlock = NO;
    self.hidden = NO;
    _type = MCToastViewShowTypeBottom;
    
    [self changeSubViewsFrameAndAnimation:toastString];
}

-(void)showToast:(NSString *)toastString andFinishedBlock:(toastFinishedBlock)block
{
    isHavaBlock = YES;
    self.hidden = NO;
    _toastBlock = block;
    _type = MCToastViewShowTypeBottom;
    
    [self changeSubViewsFrameAndAnimation:toastString];
}

-(void)showToastInCenter:(NSString *)toastString
{
    isHavaBlock = NO;
    self.hidden = NO;
    _type = MCToastViewShowTypeCenter;
    
    [self changeSubViewsFrameAndAnimation:toastString];
}

-(void)showToastInCenter:(NSString *)toastString andFinishedBlock:(toastFinishedBlock)block
{
    isHavaBlock = YES;
    self.hidden = NO;
    _toastBlock = block;
    _type = MCToastViewShowTypeCenter;
    
    [self changeSubViewsFrameAndAnimation:toastString];
}

-(void)showToastWithImage:(UIImage *)showImage andToastString:(NSString *)toastString
{
    isHavaBlock = NO;
    self.hidden = NO;
    _type = MCToastViewShowTypeImageCenter;
    _titleImage.image = showImage;
    
    [self changeSubViewsFrameAndAnimation:toastString];
}

-(void)showToastWithImage:(UIImage *)showImage andToastString:(NSString *)toastString andFinishedBlock:(toastFinishedBlock)block
{
    isHavaBlock = YES;
    self.hidden = NO;
    _toastBlock = block;
    _type = MCToastViewShowTypeImageCenter;
    _titleImage.image = showImage;
    
    [self changeSubViewsFrameAndAnimation:toastString];
}

-(void)changeSubViewsFrameAndAnimation:(NSString *)toastString
{
    if (toastString == nil)
    {
        toastString = @"";
    }
    
    if (self.showTimer != nil)
    {
        [self.showTimer invalidate];
    }
    CGSize size = [HHZCalculateTool getLabelActualSizeWithString:toastString andFont:kMCToastViewFont andLines:0 andlabelWidth:(SCREENW - kMCToastViewLeftSpace*4)];
    _titleLabel.text = toastString;
    _titleLabel.hidden = NO;
    _titleImage.hidden = YES;
    switch (_type) {
        case MCToastViewShowTypeBottom:
        {
            _titleLabel.frame = CGRectMake(kMCToastViewLeftSpace, kMCToastViewTopSpace, size.width, size.height);
            self.bgView.frame = CGRectMake((SCREENW - _titleLabel.width - kMCToastViewLeftSpace*2)/2, (SCREENH - KMCToastViewBottomSpace - _titleLabel.height - kMCToastViewTopSpace*2), _titleLabel.width + kMCToastViewLeftSpace*2, _titleLabel.height + kMCToastViewTopSpace*2);
            break;
        }
        case MCToastViewShowTypeCenter:
        {
            _titleLabel.frame = CGRectMake(kMCToastViewLeftSpace, kMCToastViewTopSpace, size.width, size.height);
            self.bgView.frame = CGRectMake((SCREENW - _titleLabel.width - kMCToastViewLeftSpace*2)/2, (SCREENH - _titleLabel.height - kMCToastViewTopSpace*2)/2, _titleLabel.width + kMCToastViewLeftSpace*2, _titleLabel.height + kMCToastViewTopSpace*2);
            break;
        }
        case MCToastViewShowTypeImageCenter:
        {
            _titleImage.hidden = NO;
            if (toastString == nil)
            {
                _titleLabel.hidden = YES;
                _titleImage.frame = CGRectMake(kMCToastViewLeftSpace, kMCToastViewTopSpace, _titleImage.image.size.width, _titleImage.image.size.height);
                self.bgView.frame = CGRectMake((SCREENW - _titleImage.width - kMCToastViewLeftSpace*2)/2, (SCREENH - _titleImage.height - kMCToastViewTopSpace*2)/2, _titleImage.width + kMCToastViewLeftSpace*2, _titleImage.height + kMCToastViewTopSpace*2);
            }
            else
            {
                if (size.width >= _titleImage.image.size.width)
                {
                    _titleImage.frame = CGRectMake((size.width + kMCToastViewLeftSpace*2 - _titleImage.image.size.width)/2, kMCToastViewTopSpace, _titleImage.image.size.width, _titleImage.image.size.height);
                    _titleLabel.frame = CGRectMake(kMCToastViewLeftSpace, _titleImage.y + _titleImage.height + kMCToastViewTopSpace, size.width, size.height);
                    self.bgView.frame = CGRectMake((SCREENW - _titleLabel.width - kMCToastViewLeftSpace*2)/2, (SCREENH - _titleLabel.y - _titleLabel.height - kMCToastViewTopSpace)/2, _titleLabel.width + kMCToastViewLeftSpace*2,_titleLabel.y + _titleLabel.height + kMCToastViewTopSpace);
                }
                else
                {
                    _titleImage.frame = CGRectMake(kMCToastViewLeftSpace, kMCToastViewTopSpace, _titleImage.image.size.width, _titleImage.image.size.height);
                    _titleLabel.frame = CGRectMake((_titleImage.width + kMCToastViewLeftSpace*2 - size.width)/2, _titleImage.y + _titleImage.height + kMCToastViewTopSpace, size.width, size.height);
                    self.bgView.frame = CGRectMake((SCREENW - _titleImage.width - kMCToastViewLeftSpace*2)/2, (SCREENH - _titleLabel.y - _titleLabel.height - kMCToastViewTopSpace)/2, _titleImage.width + kMCToastViewLeftSpace*2, _titleLabel.y + _titleLabel.height + kMCToastViewTopSpace);
                    
                }
            }
            break;
        }
        default: {
            break;
        }
    }
    
//    dispatch_time_t toastDelay = dispatch_time(DISPATCH_TIME_NOW, kMCToastViewDuring * NSEC_PER_SEC);
//    dispatch_queue_t currentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_after(toastDelay, currentQueue, ^{
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self stopToastView];
//        });
//    });
    self.showTimer = [NSTimer scheduledTimerWithTimeInterval:kMCToastViewDuring target:self selector:@selector(stopToastView) userInfo:nil repeats:NO];
    
}


-(void)stopToastView
{
    if (isHavaBlock)
    {
        if (_toastBlock)
        {
            _toastBlock();
        }
    }
    self.hidden = YES;
}

@end
