//
//  CHPageControl.m
//  张晨晖
//
//  Created by 张晨晖 on 2016/7/10.
//  Copyright © 2017年 张晨晖. All rights reserved.
//

#import "CHPageControl.h"
#import "Masonry.h"

@interface CHPageControl ()

@end

@implementation CHPageControl {

@private BOOL needsReload;

@private NSArray <UIImageView *> *pageControls;

}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setConfig];
    }
    return self;
}

- (void)setConfig {
    needsReload = YES;
}

#pragma mark setter

- (void)setNumberOfPages:(NSInteger)numberOfPages {
    _numberOfPages = numberOfPages;
    [self reloadData];
}

- (void)setCurrentPage:(NSInteger)currentPage {
    _currentPage = currentPage;
    for (int i = 0; i < self.numberOfPages; i++) {
        UIImageView *imageView = pageControls[i];
        if (self.docType == CHPageControlDocTypeDoc) {
            if (i == currentPage) {
                imageView.backgroundColor = self.currentPageIndicatorTintColor;
            } else {
                imageView.backgroundColor = self.pageIndicatorTintColor;
            }
        } else {
            imageView.backgroundColor = [UIColor clearColor];
            UIImage *image;
            if (i == self.currentPage) {
                image = self.currentPageIndicatorPageImages[i % self.currentPageIndicatorPageImages.count];
            } else {
                image = self.pageIndicatorPageImages[i % self.pageIndicatorPageImages.count];
            }
            imageView.image = image;
        }

    }
}

#pragma mark getter
- (UIColor *)pageIndicatorTintColor {
    if (!_pageIndicatorTintColor) {
        _pageIndicatorTintColor = [UIColor lightGrayColor];
    }
    return _pageIndicatorTintColor;
}

- (UIColor *)currentPageIndicatorTintColor {
    if (!_currentPageIndicatorTintColor) {
        _currentPageIndicatorTintColor = [UIColor darkGrayColor];
    }
    return _currentPageIndicatorTintColor;
}

// 重新刷新控件
- (void)reloadData {
    if (self.numberOfPages == 1 && self.hidesForSinglePage) {
        self.hidden = YES;
    } else {
        self.hidden = NO;
    }

    for (UIView *subView in pageControls) {
        [subView removeFromSuperview];
    }
    pageControls = nil;

    UIView *lastView;
    NSMutableArray *arrayM = [NSMutableArray array];
    for (int i = 0; i < self.numberOfPages; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        CGFloat multiplied;
        if (self.docType == CHPageControlDocTypeDoc) {
            if (i == self.currentPage) {
                imageView.backgroundColor = self.currentPageIndicatorTintColor;
            } else {
                imageView.backgroundColor = self.pageIndicatorTintColor;
            }
            multiplied = 1.0;
        } else {
            UIImage *image;
            UIImage *computeSizeImage = self.pageIndicatorPageImages[i % self.pageIndicatorPageImages.count];
            if (i == self.currentPage) {
                image = self.currentPageIndicatorPageImages[i % self.currentPageIndicatorPageImages.count];
            } else {
                image = self.pageIndicatorPageImages[i % self.pageIndicatorPageImages.count];
            }
            imageView.image = image;
            multiplied = CGImageGetWidth(computeSizeImage.CGImage) / CGImageGetHeight(computeSizeImage.CGImage);
        }
        [self addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (lastView) {
                make.left.equalTo(lastView.mas_right).offset(self.interval);
            } else {
                make.left.offset(0);
            }
            make.height.equalTo(self);
            make.centerY.equalTo(self);
            make.width.equalTo(self.mas_height).multipliedBy(multiplied);
        }];
        [arrayM addObject:imageView];
        lastView = imageView;
    }
    pageControls = arrayM.copy;
    [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
    }];


}

- (void)layoutSubviews {
    [self setNeedsReload];
    [super layoutSubviews];
    if (self.docType == CHPageControlDocTypeDoc) {
        for (UIImageView *imageView in pageControls) {
            imageView.layer.cornerRadius = imageView.bounds.size.height * .5;
            imageView.layer.masksToBounds = YES;
        }
    } else {
        for (UIImageView *imageView in pageControls) {
            imageView.layer.cornerRadius = 0;
            imageView.layer.masksToBounds = NO;
        }
    }
}

- (void)setNeedsReload {
    if (needsReload) {
        needsReload = NO;
        [self reloadData];  
    }
}

@end
