//
//  InformationColumnViewController.m
//  DM
//
//  Created by tepusoft on 15/12/26.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import "InformationColumnViewController.h"
#import "SqliteOperateQueue.h"
#import "DMLocalSqliteData.h"
#import "InformationCollectionViewCell.h"
#import "ChannelModel.h"
#import "InformationCollectionReusableView.h"
#import "RecruitInfoViewController.h"
@interface InformationColumnViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray *collectionViewDataArray;


@end

@implementation InformationColumnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self  initCollectionViewDataArray];
    
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"InformationCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"InformationCollectionViewCell"];
   

    [self.collectionView registerNib:[UINib nibWithNibName:@"InformationCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"InformationCollectionReusableView"];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - CoustomFunction
- (void)initCollectionViewDataArray
{
    self.collectionViewDataArray = [NSArray array];
    dispatch_async([SqliteOperateQueue shareManager], ^{
         self.collectionViewDataArray = [DMLocalSqliteData publicRecruit];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
    });
}


#pragma mark - UICollectionViewDataSource and UICollectionViewDelegate and UICollectionViewDeleteFlowLayout

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
//    self.collectionViewDataArray
    
    if (self.collectionViewDataArray[section]) {
        return ((NSArray *)((NSArray *)self.collectionViewDataArray[section])[1]).count;
    }
    return 0;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.collectionViewDataArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    InformationCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"InformationCollectionViewCell" forIndexPath:indexPath];
    NSArray *array = ((NSArray *)self.collectionViewDataArray[indexPath.section])[1];
    cell.nameLabel.text = ((ChannelModel *)array[indexPath.row]).name;
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    return  CGSizeMake((size.width-32)/3, 46);
}


-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(8, 16, 8, 16);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 8.0;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString: UICollectionElementKindSectionHeader]) {
        InformationCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"InformationCollectionReusableView" forIndexPath:indexPath];
         NSArray *array = self.collectionViewDataArray[indexPath.section];
        view.nameLabel.text = array[0];
        return view;
    }
    return nil;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, 40);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        RecruitInfoViewController *vc = [sb instantiateViewControllerWithIdentifier:@"RecruitInfoViewController"];
        NSArray *array = ((NSArray *)self.collectionViewDataArray[indexPath.section])[1];
        vc.chanelModel = array[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }else if (indexPath.section > 0){
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        RecruitInfoViewController *vc = [sb instantiateViewControllerWithIdentifier:@"RecruitInfoViewController"];
        NSArray *array = ((NSArray *)self.collectionViewDataArray[indexPath.section])[1];
        vc.chanelModel = array[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
