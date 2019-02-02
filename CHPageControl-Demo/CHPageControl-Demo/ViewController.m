//
//  ViewController.m
//  CHPageControl-Demo
//
//  Created by 张晨晖 on 2018/8/10.
//  Copyright © 2018年 张晨晖. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "CHPageControl.h"

@interface ViewController () <UICollectionViewDataSource ,UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout>

@property (nonatomic ,strong) UICollectionView *collectionView;

@property (nonatomic ,strong) CHPageControl *pageControl;

@end

@implementation ViewController

static NSString *UICollectionViewCellID = @"UICollectionViewCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.headerReferenceSize = CGSizeMake(0, 0);
    flowLayout.footerReferenceSize = CGSizeMake(0, 0);
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.pagingEnabled = YES;
    [self.view addSubview:self.collectionView];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];

    self.pageControl = [[CHPageControl alloc] init];
    [self.view addSubview:self.pageControl];

    self.pageControl.numberOfPages = 10;
    
    self.pageControl.dotDiameter = 30;


    self.pageControl.interval = 10;
    self.pageControl.isDoc = NO;

    self.pageControl.normalPageColor = [UIColor redColor];
    self.pageControl.currentPageColor = [UIColor greenColor];

    
    self.pageControl.docType = CHPageControlDocTypeImage;
//    self.pageControl.currentPageImage = [UIImage imageNamed:@"personal1"];
//    7e3e6709c93d70cf6c8ec337f4dcd100baa12b97
    self.pageControl.currentPageImage = [UIImage imageNamed:@"u=703370381,1685271557&fm=26&gp=0"];
    self.pageControl.normalPageImage = [UIImage imageNamed:@"personal2"];

    self.pageControl.imageType = CHPageControlImageTypeArray;
    self.pageControl.currentPageImageArray = @[
                                               [UIImage imageNamed:@"7e3e6709c93d70cf6c8ec337f4dcd100baa12b97"] ,
                                               [UIImage imageNamed:@"冰峰开水"],
                                               [UIImage imageNamed:@"电脑"],
                                               [UIImage imageNamed:@"寝室报修"],
                                               [UIImage imageNamed:@"校园兼职"],
                                               [UIImage imageNamed:@"校园约跑"],
                                               [UIImage imageNamed:@"校园租赁"],
                                               [UIImage imageNamed:@"personal1"],
                                               [UIImage imageNamed:@"personal2"],
                                               [UIImage imageNamed:@"u=703370381,1685271557&fm=26&gp=0"],
                                               ];
    self.pageControl.normalPageImageArray = @[
                                              [UIImage imageNamed:@"多云"],
                                              [UIImage imageNamed:@"角标"],
                                              [UIImage imageNamed:@"链接"],
                                              [UIImage imageNamed:@"下拉"],
                                              [UIImage imageNamed:@"下一步"],
                                              [UIImage imageNamed:@"怎么玩"],
                                              [UIImage imageNamed:@"阵雪"],
//                                              [UIImage imageNamed:@"阵雨"],
//                                              [UIImage imageNamed:@"中雪"],
//                                              [UIImage imageNamed:@"radio button_2"],
                                              ];

    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.collectionView);
        make.bottom.equalTo(self.mas_bottomLayoutGuide).offset(-8);
    }];

    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:UICollectionViewCellID];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:UICollectionViewCellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1];
    return cell;
}

#pragma mark UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(collectionView.bounds.size.width, collectionView.bounds.size.height);
}

#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    /// Item的宽度
    CGFloat width = self.collectionView.bounds.size.width;
    NSInteger currentPage = (scrollView.contentOffset.x + width / 2) / width;
    self.pageControl.currentPage = currentPage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
