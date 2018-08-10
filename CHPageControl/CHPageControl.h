//
//  CHPageControl.h
//  张晨晖
//
//  Created by 张晨晖 on 2016/7/10.
//  Copyright © 2017年 张晨晖. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHPageControl : UIPageControl

/// 小圆点的直径
@property (nonatomic ,assign) CGFloat dotDiameter;

/// 小圆点之间的间距
@property (nonatomic ,assign) CGFloat magrin;

/// 当前选中page的颜色
@property (nonatomic ,strong) UIColor *currentPageColor;

/// 正常状态Page的颜色
@property (nonatomic ,strong) UIColor *normalPageColor;

@end
