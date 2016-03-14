//
//  PublicViewController.m
//  DM
//
//  Created by tepusoft on 15/12/22.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import "PublicViewController.h"
#import "PublicCollectionViewCell.h"
#import "ChannelModel.h"
#import "SqliteOperateQueue.h"
#import "DMLocalSqliteData.h"
#import "DetailCategoryViewController.h"
#import "AdversInfoSingleton.h"
#import "AdvertisersListViewController.h"

@interface PublicViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,AdvertisersListViewControllerDelegate>

@property (nonatomic, strong) NSArray *collectionViewDataArray;

@end

@implementation PublicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.changeButton.layer.cornerRadius = 3.0;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"PublicCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"PublicCollectionViewCell"];
    
    [self initCollectionArray];
    
    
    
    // Do any additional setup after loading the view from its nib.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PublicViewController ToAdertisersSelectViewController"]) {
        AdvertisersListViewController *vc = segue.destinationViewController;
        vc.delegate = self;
    }
}


-(void)viewWillAppear:(BOOL)animated
{
    _advertisersLabel.text = [AdversInfoSingleton shareManager].adversModel.name;
}

-(void) initCollectionArray
{
    dispatch_async([SqliteOperateQueue shareManager], ^{
        self.collectionViewDataArray = [NSMutableArray new];
        self.collectionViewDataArray = [DMLocalSqliteData publicListData];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
    });
}

#pragma  mark - UICollectionViewDelegate and UIcollectionViewDataSource 

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.collectionViewDataArray.count;
    
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return  1;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PublicCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PublicCollectionViewCell" forIndexPath:indexPath];
    ChannelModel *dm = self.collectionViewDataArray[indexPath.row];
    cell.headImageView.image = [UIImage imageNamed:dm.iconsrc];
    cell.nameLable.text = dm.name;
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"InformationColumnViewController"];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    ChannelModel *channelModel = _collectionViewDataArray[indexPath.row];
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailCategoryViewController *vc = [sb instantiateViewControllerWithIdentifier:@"DetailCategoryViewController"];
    vc.parentId = [NSString stringWithFormat:@"%ld", channelModel.Id];
    [self.navigationController pushViewController:vc animated:YES];
    
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((self.view.frame.size.width-32)/3, 90);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return  8.0;
}

-(UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(8, 16, 8, 16);
}

#pragma mark -  AdvertisersListViewControllerDelegate
-(void)didSelectAdvertisers:(AdversModel *)adversModel
{
    _advertisersLabel.text = [AdversInfoSingleton shareManager].adversModel.name;
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
