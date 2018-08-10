# CHPageControl

---

## 效果

---

![](https://github.com/MeteoriteMan/Assets/blob/master/gif/CHPageControl-iPhone%208.gif?raw=true)

## 使用

---
```
    self.pageControl = [[CHPageControl alloc] init];
    [self.view addSubview:self.pageControl];
    self.pageControl.numberOfPages = 10;
    
    /// CHPageControl属性设置
    self.pageControl.dotDiameter = 10;
    self.pageControl.magrin = 10;
    self.pageControl.normalPageColor = [UIColor redColor];
    self.pageControl.currentPageColor = [UIColor greenColor];
    
    
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.collectionView);
        make.bottom.offset(-8);
    }];

```



## 安装

---

使用 CocoaPods 集成. 首先在podfile中

>pod 'CHPageControl'

安装一下pod

>#import <CHPageControl/CHPageControl.h>
