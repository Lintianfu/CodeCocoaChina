//
//  FlowChangeViewController.m
//  CodeCocoaChina
//
//  Created by Mr.TF on 2020/2/20.
//  Copyright © 2020 Mr.TF. All rights reserved.
//

#import "FlowChangeViewController.h"
#import "FlowCollectionViewCell.h"
#define s_width [UIScreen mainScreen].bounds.size.width
#define s_height [UIScreen mainScreen].bounds.size.height
@interface FlowChangeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(strong,nonatomic)UICollectionViewFlowLayout *listLayout;
@property(strong,nonatomic)UICollectionViewFlowLayout *gridLayout;
@property(strong,nonatomic)UICollectionView *collectionView;
@property(strong,nonatomic)UIButton *btn;
@property (nonatomic, assign)BOOL isList;
@end

@implementation FlowChangeViewController
static NSString *const CollectionViewCellID = @"CollectionViewCellID";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initcollectionView];
    // Do any additional setup after loading the view.
}
-(UICollectionViewFlowLayout *)listLayout
{
    if(_listLayout==nil)
    {
        _listLayout=[[UICollectionViewFlowLayout alloc]init];
        _listLayout.itemSize=CGSizeMake(s_width-20, 100);
        _listLayout.minimumLineSpacing=10;
        _listLayout.sectionInset=UIEdgeInsetsMake(10, 10, 10, 10);
    }
    return _listLayout;
}
-(UICollectionViewFlowLayout *)gridLayout
{
    if(_gridLayout==nil)
    {
        _gridLayout=[[UICollectionViewFlowLayout alloc]init];
        CGFloat width = floorf((s_width- 30) * 0.5);
        _gridLayout.itemSize = CGSizeMake(width, width+80);
        _gridLayout.minimumLineSpacing = 10;
        _gridLayout.minimumInteritemSpacing = 10;
        _gridLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    }
    return _gridLayout;
}
-(void)initcollectionView
{
    self.collectionView=[[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:self.gridLayout];
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    self.collectionView.backgroundColor=[UIColor whiteColor];
    [self.collectionView registerClass:[FlowCollectionViewCell class] forCellWithReuseIdentifier:CollectionViewCellID];
    [self.view addSubview:self.collectionView];
    
    self.btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.btn setTitle:@"切换" forState:UIControlStateNormal];
    self.btn.frame=CGRectMake(s_width-50, 20, 44, 44);
    self.btn.titleLabel.font=[UIFont systemFontOfSize:15];
    self.btn.backgroundColor=[UIColor redColor];
    [self.btn addTarget:self action:@selector(changeClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
    
}
-(void)changeClick
{
    _isList = !_isList;
    NSArray *array = [self.collectionView indexPathsForVisibleItems];
    for(NSIndexPath *indexPath in array){
        FlowCollectionViewCell *cell = (FlowCollectionViewCell*) [self.collectionView cellForItemAtIndexPath:indexPath];
        cell.animation = YES;
        cell.isList = _isList;
    }
    if (_isList) {
        [self.collectionView setCollectionViewLayout:self.listLayout animated:YES];
    }else{
        [self.collectionView setCollectionViewLayout:self.gridLayout animated:YES];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 100;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FlowCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewCellID forIndexPath:indexPath];
    cell.animation = NO;
    cell.isList = _isList;
    return cell;
}

@end
