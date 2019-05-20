//
//  CHPageControl.h
//  张晨晖
//
//  Created by 张晨晖 on 2016/7/10.
//  Copyright © 2017年 张晨晖. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CHPageControlDocType) {///指示器样式
    CHPageControlDocTypeDoc,//圆点
    CHPageControlDocTypeImage,//图片
};

@interface CHPageControl : UIView

/// 指示器样式
@property (nonatomic ,assign) CHPageControlDocType docType;

/// 多少个page
@property(nonatomic) NSInteger numberOfPages;          // default is 0

/// 当前的page
@property(nonatomic) NSInteger currentPage;            // default is 0. value pinned to 0..numberOfPages-1

/// 当只有一个Page的时候隐藏
@property(nonatomic) BOOL hidesForSinglePage;

/// 正常状态颜色(CHPageControlDocTypeDoc时有效)
@property(nullable, nonatomic,strong) UIColor *pageIndicatorTintColor;

/// 当前状态颜色(CHPageControlDocTypeDoc时有效)
@property(nullable, nonatomic,strong) UIColor *currentPageIndicatorTintColor;

/// pageControl之间的间距
@property (nonatomic ,assign) CGFloat interval;

/// MARK:图片
/// 指示器图片数组.正常状态(doc的type为image的时候需要大于0).**注意:page的大小根据pageIndicatorPageImages中对应的image来计算的**
@property (nullable, nonatomic ,strong) NSArray <UIImage *> *pageIndicatorPageImages;

/// 指示器图片数组.选中状态(doc的type为image的时候需要大于0).
@property (nullable, nonatomic ,strong) NSArray <UIImage *> *currentPageIndicatorPageImages;

@end
