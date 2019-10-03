//
//  AdvacedViewController.m
//  AviaScan
//
//  Created by Sergey on 02/10/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

#import "AdvacedViewController.h"

@interface AdvacedViewController () <UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView* collectionView;

@end

@implementation AdvacedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UICollectionViewFlowLayout* collectionLayout = [[UICollectionViewFlowLayout alloc]init];
    collectionLayout.minimumLineSpacing = 10.0; //минимальное расстояние
    collectionLayout.minimumInteritemSpacing = 10.0; //отступ между айтемами
    collectionLayout.itemSize = CGSizeMake(50, 50);
    collectionLayout.scrollDirection = UICollectionViewScrollDirectionVertical; //куда скролится
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:collectionLayout];
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CollectionCell"];
    [self.collectionView setDataSource: self];

    
    [self.view addSubview:self.collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    return cell;
}

- (void)viewWillLayoutSubviews {
    NSLog(@"%f", self.navigationController.navigationBar.frame.size.height);
}



@end
