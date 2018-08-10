//
//  CHPageControl.m
//  张晨晖
//
//  Created by 张晨晖 on 2016/7/10.
//  Copyright © 2017年 张晨晖. All rights reserved.
//

#import "CHPageControl.h"

@implementation CHPageControl

#define DefaultDotDiameter 5

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

#pragma mark setter

#pragma mark getter

- (CGFloat)dotDiameter {
    if (_dotDiameter == 0) {
        _dotDiameter = DefaultDotDiameter;
    }
    return _dotDiameter;
}

- (UIColor *)normalPageColor {
    if (!_normalPageColor) {
        _normalPageColor = [UIColor lightGrayColor];
    }
    return _normalPageColor;
}

- (UIColor *)currentPageColor {
    if (!_currentPageColor) {
        _currentPageColor = [UIColor darkGrayColor];
    }
    return _currentPageColor;
}

#pragma mark UISet

- (void)layoutSubviews {
    [super layoutSubviews];

    //计算圆点间距
    CGFloat marginX = self.dotDiameter + self.magrin;

    //计算整个pageControll的宽度
    CGFloat newW = self.subviews.count * marginX - self.magrin;

    //设置新frame
    self.bounds = CGRectMake(0, 0, newW, self.bounds.size.height);

    //设置居中
    CGPoint center = self.center;
    center.x = self.superview.center.x;
    self.center = center;

    UIView *lastView;
    //遍历subview,设置圆点frame
    for (int i = 0; i < self.subviews.count; i++) {
        UIImageView *dot = [self.subviews objectAtIndex:i];
        dot.layer.cornerRadius = self.dotDiameter / 2;
        if (i == self.currentPage) {///选中颜色
            dot.backgroundColor = self.currentPageColor;
            [dot setFrame:CGRectMake(i * marginX, dot.frame.origin.y, self.dotDiameter, self.dotDiameter)];
        } else {///正常状态颜色
            dot.backgroundColor = self.normalPageColor;
            [dot setFrame:CGRectMake(i * marginX, dot.frame.origin.y, self.dotDiameter, self.dotDiameter)];
        }
        if (i == self.subviews.count - 1) {
            lastView = dot;
        }
    }
//    CGFloat pageContorlWith = lastView.bounds.size.width + self.dotDiameter;
//    CGFloat pageContorlHeight = lastView.bounds.size.height;
//    self.bounds = CGRectMake(0, 0, pageContorlWith, pageContorlHeight);
}

@end
