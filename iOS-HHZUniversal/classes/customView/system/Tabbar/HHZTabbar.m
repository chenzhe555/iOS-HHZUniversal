//
//  HHZTabbar.m
//  iOS-HHZUniversal
//
//  Created by chenzhe.376811578@qq.com on 16/12/6.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZTabbar.h"
#import "HHZMACROConfig.h"
#import "UIView+HHZCategory.h"

//红点坐标X,Y
static CGFloat redPointX;
static CGFloat redPoingY;

@interface HHZTabbar()
/**
 *  自定义的tabbarView，放在tabVC上面
 */
@property (readonly,strong, nonatomic) UIView * customBarView;

/**
 *  当前Item
 */
@property (nonatomic, strong) HHZTabbarItem * currentItem;

/**
 *  存放item的数组
 */
@property (nonatomic, strong) NSMutableArray * itemArray;

/**
 *  用于记录tabbar的高度，用于可复用于手动适配
 */
@property (nonatomic, assign) CGFloat tabbarHeight;

/**
 *  底部显示视图的类型
 */
@property (nonatomic, assign) HHZTabbarItemType itemType;


/***数据源***/
@property (nonatomic, strong) NSArray * titleArray;
@property (nonatomic, strong) NSArray * normalImageArray;
@property (nonatomic, strong) NSArray * selectedImageArray;
/**
 *  额外配置参数数组
 */
@property (nonatomic, strong) NSArray * extraArray;

#pragma mark 一些基本参数设置
/**
 *  动画时间
 */
@property (nonatomic, assign) CGFloat animationTime;

/**
 *  由于添加一些超过顶部的图片,添加的额外往下移高度
 */
@property (nonatomic, assign) CGFloat extraHeight;
@end

@implementation HHZTabbar
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    _itemArray = nil;
}

-(void)initSomeData
{
    _animationTime = 0.3;
    _extraHeight = 30;
}

-(void)setTitleArray:(NSArray *)titleArr normalImageArray:(NSArray *)normalArray selectedImageArray:(NSArray *)selectedArray
{
    _titleArray = titleArr;
    _normalImageArray = normalArray;
    _selectedImageArray = selectedArray;
}

-(void)setTitleArray:(NSArray *)titleArr normalImageArray:(NSArray *)normalArray selectedImageArray:(NSArray *)selectedArray ExtraArray:(NSArray *)extraArray
{
    [self setTitleArray:titleArr normalImageArray:normalArray selectedImageArray:selectedArray];
    _extraArray = extraArray;
}


-(void)createTabbar
{
    _itemArray = [NSMutableArray array];
    _itemType = HHZTabbarItemTypeImageAndText1;
    
    //隐藏系统的Tabbar
    [self hideRealTabbar];
    
    //创建自定义Tabbar
    [self createCustomTabbar];
    
    //    [self registNotification];
    
    [self loadRedPointRect];
}

-(void)hideRealTabbar
{
    for(UIView * vie in self.view.subviews)
    {
        if ([vie isKindOfClass:[UITabBar class]])
        {
            _tabbarHeight = vie.frame.size.height;
            vie.hidden = YES;
            break;
        }
    }
}

-(void)createCustomTabbar
{
    [self initSomeData];
    
    _customBarView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREENH - _tabbarHeight,SCREENW, _tabbarHeight)];
    _customBarView.backgroundColor = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1.0f];
    
    NSInteger count = _normalImageArray.count;
    NSString * configStr = @"";
    NSInteger extraIndex = 111;
    CGFloat itemWidth = 0;
    for (int i = 0; i < count; i++)
    {
        HHZTabbarItem * item = [[HHZTabbarItem alloc] init];
        item.frame = CGRectMake(i * SCREENW/count, 0, SCREENW/count, _tabbarHeight);
        item.tag = i + 666;
        
        /*根据配置参数决定Item的行为*/
        configStr = _extraArray[i];
        if (configStr.length > 0) {
            if ([configStr hasPrefix:@"m_"]) {
                item.itemType = HHZTabbarItemTypeOnlyImage;
            } else if ([configStr hasPrefix:@"mt1_"]) {
                item.itemType = HHZTabbarItemTypeImageAndText1;
            }
            item.isBigNoClicked = YES;
            extraIndex = i;
            itemWidth = item.width;
        }
        else {
            item.itemType = _itemType;
        }
        
        switch (item.itemType) {
            case HHZTabbarItemTypeOnlyImage:
            {
                [item createWithText:nil normalImage:[UIImage imageNamed:_normalImageArray[i]] selectedImage:[UIImage imageNamed:_selectedImageArray[i]] Delegate:self];
            }
                break;
            case HHZTabbarItemTypeImageAndText1:
            {
                [item createWithText:_titleArray[i] normalImage:[UIImage imageNamed:_normalImageArray[i]] selectedImage:[UIImage imageNamed:_selectedImageArray[i]] Delegate:self];
            }
                break;
            default:
                break;
        }
        if(0 == i)
        {
            _currentItem = item;
            _currentItem.isSelected = YES;
            self.selectedIndex = 0;
        }
        [_customBarView addSubview:item];
        [_itemArray addObject:item];
    }
    if(extraIndex != 111) {
        CGFloat space = (itemWidth - [UIImage imageNamed:_normalImageArray[extraIndex]].size.width)/2.0;
        
        UIView * vie1 = [[UIView alloc] init];
        vie1.frame = CGRectMake(0, 0, extraIndex*itemWidth + space, 0.5);
        vie1.backgroundColor = [UIColor lightGrayColor];
        [_customBarView addSubview:vie1];
        
        UIView * vie2 = [[UIView alloc] init];
        vie2.frame = CGRectMake((extraIndex+1)*itemWidth - space, 0, (SCREENW - (extraIndex+1)*itemWidth) + space, 0.5);
        vie2.backgroundColor = [UIColor lightGrayColor];
        [_customBarView addSubview:vie2];
    }
    else {
        UIView * vie1 = [[UIView alloc] init];
        vie1.frame = CGRectMake(0, 0, SCREENW, 0.5);
        vie1.backgroundColor = [UIColor lightGrayColor];
        [_customBarView addSubview:vie1];
    }
    
    [self.view addSubview:_customBarView];
    
}


-(void)loadRedPointRect
{
    if (kIS_iPhone6Plus)
    {
        redPointX = 58.0f;
        redPoingY = 5.0f;
    }
    else if (kIS_iPhone6)
    {
        redPointX = 52.0f;
        redPoingY = 5.0f;
    }
    else
    {
        redPointX = 44.0f;
        redPoingY = 5.0f;
    }
}

#pragma mark MCTabbarItemDelegate回调
-(void)barItemClicked:(HHZTabbarItem *)item
{
    [self exchangeCurrentItem:item];
}

#pragma mark Tabbar显示规则
-(void)showTabbarView:(BOOL)isAnimate
{
    if (isAnimate)
    {
        if (_customBarView.frame.origin.y >= SCREENH)
        {
            [UIView animateWithDuration:_animationTime animations:^{
                _customBarView.frame = CGRectMake(0, SCREENH - _tabbarHeight, SCREENW, _tabbarHeight);
            } completion:^(BOOL finished) {
                
            }];
        }
    }
    else
    {
        _customBarView.frame = CGRectMake(0, SCREENH - _tabbarHeight, SCREENW, _tabbarHeight);
    }
}


-(void)hideTabbarView:(BOOL)isAnimate
{
    if (isAnimate)
    {
        if (_customBarView.frame.origin.y < (SCREENH + _extraHeight))
        {
            [UIView animateWithDuration:_animationTime animations:^{
                _customBarView.frame = CGRectMake(0, SCREENH + _extraHeight, SCREENW, _tabbarHeight);
            } completion:^(BOOL finished) {
                
            }];
        }
    }
    else
    {
        _customBarView.frame = CGRectMake(0, SCREENH + _extraHeight, SCREENW, _tabbarHeight);
    }
}

/**
 *  供外部调用的切换Item
 *
 *  @param index 切换的Item索引值
 */
-(void)switchTabbarItem:(NSInteger)index
{
    [self showTabbarView:NO];
    for(UIView * vie in self.customBarView.subviews)
    {
        if (vie.tag == (index + 666))
        {
            _currentItem.isSelected = NO;
            _currentItem = (HHZTabbarItem *)vie;
            _currentItem.isSelected = YES;
            self.selectedIndex = index;
        }
    }
}

/**
 *  供类内部调用的切换Item
 *
 *  @param item
 */
-(void)exchangeCurrentItem:(HHZTabbarItem *)item
{
    if (![item isEqual:_currentItem])
    {
        if (!item.isBigNoClicked) [item startAnimation];
        _currentItem.isSelected = NO;
        _currentItem = item;
        _currentItem.isSelected = YES;
        self.selectedIndex = (_currentItem.tag - 666);
    }
}

#pragma mark 设置一些基本参数(必须在create之前传入)
-(void)setAnimationTime:(CGFloat)time
{
    _animationTime = time;
}

-(CGFloat)getTabbarHeight
{
    return self.customBarView.frame.size.height;
}

@end
