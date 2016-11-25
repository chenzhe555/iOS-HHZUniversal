//
//  MCQRCenterView.m
//  core-ios-oc
//
//  Created by 陈哲#376811578@qq.com on 16/2/22.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "MCQRCenterView.h"

@implementation MCQRCenterView

-(void)drawRect:(CGRect)rect
{
    CGRect screenRect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    if (_centerClearRect.size.width > 0)
    {
        CGContextRef contextRef = UIGraphicsGetCurrentContext();
        //先画屏幕颜色
        [self drawScreenRect:contextRef andRect:screenRect];
        //再画中心白色
        [self drawCenterRect:contextRef andRect:_centerClearRect];
        //再画四条白线
        [self drawWhiteLineRect:contextRef andRect:_centerClearRect];
        //最后画四个角
        [self drawCornerLineRect:contextRef andRect:_centerClearRect];
    }
    else
    {
        return;
    }
}

-(void)drawScreenRect:(CGContextRef)ref andRect:(CGRect)rect
{
    const CGFloat * colorArray = CGColorGetComponents(_borderColor.CGColor);
    CGContextSetRGBFillColor(ref, colorArray[0], colorArray[1], colorArray[2], 0.5f);
    CGContextFillRect(ref, rect);
}

-(void)drawCenterRect:(CGContextRef)ref andRect:(CGRect)rect
{
    CGContextClearRect(ref, rect);
}

-(void)drawWhiteLineRect:(CGContextRef)ref andRect:(CGRect)rect
{
    CGContextStrokeRect(ref, rect);
    CGContextSetRGBStrokeColor(ref, 1, 1, 1, 1);
    CGContextSetLineWidth(ref, 1);
    CGContextAddRect(ref, rect);
    CGContextStrokePath(ref);
}

-(void)drawCornerLineRect:(CGContextRef)ref andRect:(CGRect)rect
{
    CGContextSetLineWidth(ref, 2);
    const CGFloat * cornerColorArray = CGColorGetComponents(_cornerColor.CGColor);
    CGContextSetRGBStrokeColor(ref, cornerColorArray[0], cornerColorArray[1], cornerColorArray[2], cornerColorArray[3]);
    
    //左上角
    CGPoint topLeftPoints[7];
    topLeftPoints[0] = CGPointMake(rect.origin.x + 0.5, rect.origin.y + 0.5);
    topLeftPoints[1] = CGPointMake(rect.origin.x + 0.5 + _cornerWidth, rect.origin.y + 0.5);
    topLeftPoints[2] = CGPointMake(rect.origin.x + 0.5 + _cornerWidth, rect.origin.y + 0.5 + 1);
    topLeftPoints[3] = CGPointMake(rect.origin.x + 0.5 + 1, rect.origin.y + 0.5 + 1);
    topLeftPoints[4] = CGPointMake(rect.origin.x + 0.5 + 1, rect.origin.y + 0.5 + _cornerWidth);
    topLeftPoints[5] = CGPointMake(rect.origin.x + 0.5, rect.origin.y + 0.5 + _cornerWidth);
    topLeftPoints[6] = CGPointMake(rect.origin.x + 0.5, rect.origin.y + 0.5);
    CGContextAddLines(ref, topLeftPoints, 7);
    
    //左下角
    CGPoint bottomLeftPoints[7];
    bottomLeftPoints[0] = CGPointMake(rect.origin.x + 0.5, rect.origin.y + rect.size.height + 0.5);
    bottomLeftPoints[1] = CGPointMake(rect.origin.x + 0.5 + _cornerWidth, rect.origin.y + rect.size.height + 0.5);
    bottomLeftPoints[2] = CGPointMake(rect.origin.x + 0.5 + _cornerWidth, rect.origin.y + rect.size.height + 0.5 - 1);
    bottomLeftPoints[3] = CGPointMake(rect.origin.x + 0.5 + 1, rect.origin.y + rect.size.height + 0.5 - 1);
    bottomLeftPoints[4] = CGPointMake(rect.origin.x + 0.5 + 1, rect.origin.y + rect.size.height + 0.5 - _cornerWidth);
    bottomLeftPoints[5] = CGPointMake(rect.origin.x + 0.5, rect.origin.y + rect.size.height + 0.5 - _cornerWidth);
    bottomLeftPoints[6] = CGPointMake(rect.origin.x + 0.5, rect.origin.y + rect.size.height + 0.5);
    CGContextAddLines(ref, bottomLeftPoints, 7);
    
    //右上角
    CGPoint topRightPoints[7];
    topRightPoints[0] = CGPointMake(rect.origin.x + rect.size.width + 0.5, rect.origin.y + 0.5);
    topRightPoints[1] = CGPointMake(rect.origin.x + rect.size.width + 0.5, rect.origin.y + 0.5 + _cornerWidth);
    topRightPoints[2] = CGPointMake(rect.origin.x + rect.size.width + 0.5 - 1, rect.origin.y + 0.5 + _cornerWidth);
    topRightPoints[3] = CGPointMake(rect.origin.x + rect.size.width + 0.5 - 1, rect.origin.y + 0.5 + 1);
    topRightPoints[4] = CGPointMake(rect.origin.x + rect.size.width + 0.5 - _cornerWidth, rect.origin.y + 0.5 + 1);
    topRightPoints[5] = CGPointMake(rect.origin.x + rect.size.width + 0.5 - _cornerWidth, rect.origin.y + 0.5);
    topRightPoints[6] = CGPointMake(rect.origin.x + rect.size.width + 0.5, rect.origin.y + 0.5);
    CGContextAddLines(ref, topRightPoints, 7);
    
    //右下角
    CGPoint bottomRightPoints[7];
    bottomRightPoints[0] = CGPointMake(rect.origin.x + rect.size.width + 0.5, rect.origin.y + rect.size.height + 0.5);
    bottomRightPoints[1] = CGPointMake(rect.origin.x + rect.size.width + 0.5 - _cornerWidth, rect.origin.y + rect.size.height + 0.5);
    bottomRightPoints[2] = CGPointMake(rect.origin.x + rect.size.width + 0.5 - _cornerWidth, rect.origin.y + rect.size.height + 0.5 - 1);
    bottomRightPoints[3] = CGPointMake(rect.origin.x + rect.size.width + 0.5 - 1, rect.origin.y + rect.size.height + 0.5 - 1);
    bottomRightPoints[4] = CGPointMake(rect.origin.x + rect.size.width + 0.5 - 1, rect.origin.y + rect.size.height + 0.5 - _cornerWidth);
    bottomRightPoints[5] = CGPointMake(rect.origin.x + rect.size.width + 0.5, rect.origin.y + rect.size.height + 0.5 - _cornerWidth);
    bottomRightPoints[6] = CGPointMake(rect.origin.x + rect.size.width + 0.5, rect.origin.y + rect.size.height + 0.5);
    CGContextAddLines(ref, bottomRightPoints, 7);
    
    
    
    CGContextStrokePath(ref);
    
}

@end
