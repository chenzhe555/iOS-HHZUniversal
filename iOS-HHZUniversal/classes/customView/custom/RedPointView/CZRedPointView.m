//
//  CZRedPointView.m
//  TestRedCount
//
//  Created by mc962 on 16/7/1.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "CZRedPointView.h"

#define CZRedPointSpace 5

static UIImage * drawRedPoint(UIColor * color, CGFloat radius) {
    if (radius <= 0) {
        return nil;
    }
    CGRect rect = CGRectMake(0, 0, radius * 2, radius * 2);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    UIBezierPath * circlePath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
    [color setFill];
    [circlePath fill];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

@interface CZRedPointView()

@property (nonatomic, strong) UILabel * numberLabel;

@end

@implementation CZRedPointView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.numberLabel = [[UILabel alloc] init];
        self.numberLabel.font = [UIFont systemFontOfSize:13];
        self.numberLabel.text = @"11";
        self.numberLabel.textColor = [UIColor whiteColor];
        self.numberLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.numberLabel];
    }
    return self;
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    self.image = drawRedPoint([UIColor redColor], frame.size.width);
    self.numberLabel.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
}

-(void)changeRedPointValue:(NSInteger)value
{
    if (value <= 0) {
        self.numberLabel.text = @"";
        self.hidden = YES;
        self.numberLabel.font = [UIFont systemFontOfSize:14];
        return;
    }
    else if (value > 99)
    {
        self.numberLabel.text = @"99+";
        self.numberLabel.font = [UIFont systemFontOfSize:10];
    }
    else
    {
        self.numberLabel.text = [NSString stringWithFormat:@"%ld",(long)value];
        self.numberLabel.font = [UIFont systemFontOfSize:14];

    }
    self.hidden = NO;
}


@end
