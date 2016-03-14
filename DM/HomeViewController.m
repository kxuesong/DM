//
//  HomeViewController.m
//  DM
//
//  Created by tepusoft on 15/12/21.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import "HomeViewController.h"
#import "FunctionCollectionViewCell.h"
#import "ImplementCollectionViewCell.h"
#import "ImplementCollectionViewLayout.h"
#import "H5ViewController.h"
#import "SqliteOperateQueue.h"
#import "DMLocalSqliteData.h"
#import "ChannelModel.h"
#import "FunctionListViewController.h"
#import "AdvertisersListViewController.h"
#import "AdversModel.h"
#import "NetworkInterface.h"
#import "ScrollImageModel.h"
#import "UIImageView+WebCache.h"
#import "AdversInfoSingleton.h"


@interface HomeViewController ()<UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate,UITextFieldDelegate,AdvertisersListViewControllerDelegate>


@property (nonatomic,strong) NSArray *functionImageArray;
@property (nonatomic,strong) NSArray *functiontitleArray;
@property (nonatomic, strong) NSArray *functionArray;

@property (nonatomic,strong) NSArray *implementImageArray;
@property (nonatomic,strong) NSArray *implementTitileArray;

@property (nonatomic, strong) NSArray *scrollImageArray;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollImageHeightLayoutConstraint;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchTextField.returnKeyType = UIReturnKeyDone;
    self.searchTextField.delegate = self;
    
    [self addImageViewToScrollView];
    self.searchButton.layer.cornerRadius = 5.0;
    self.functionCollectionView.delegate = self;
    self.functionCollectionView.dataSource = self;
    
    self.implementCollectionView.delegate = self;
    self.implementCollectionView.dataSource = self;
    self.implementCollectionView.collectionViewLayout = [[ImplementCollectionViewLayout alloc]init];
    
    self.functionImageArray = @[@"icon_zhaopin.png",
                                @"icon_fangchan.png",
                                @"icon_shenghuo.png",
                                @"icon_cheliang.png",
                                @"icon_shangwu.png",
                                @"icon_ershou.png",
                                @"icon_jiaoyu.png",
                                @"icon_canyin.png"];
    self.functiontitleArray = @[@"招聘",@"房产",@"生活服务",@"搬家",@"商务服务",@"二手",@"教育",@"餐饮娱乐"];
    
    self.implementImageArray = @[@"home_implement_traffic",
                                 @"home_implement_phone",
                                 @"home_implement_tickets",
                                 @"home_implement_bus_tickets",
                                 @"home_implement_hotel",
                                 @"home_implement_express",
                                 @"home_implement_weather",
                                 @"",
                                 @"home_implement_shares",
                                 @"home_implement_preferential",
                                 @"home_implement_calculator",
                                 @"home_implement_calendar",
                                 @"home_implement_calculator",
                                 @"home_implement_express",
                                 @"home_implement_market",
                                 @""];
    self.implementTitileArray = @[@"公交查询",@"花费充值",@"火车票",@"汽车票",@"酒店预订",@"快递查询",@"天气情况",@"",@"股票市场",@"票务卡券",@"房贷计算",@"万年历",@"计算工具",@"快递查询",@"积分商城",@""];
    [self initFunctionArray];
    
    [self.functionCollectionView registerNib:[UINib nibWithNibName:@"FunctionCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"FunctionCollectionViewCell"];
    [self.implementCollectionView registerNib:[UINib nibWithNibName:@"ImplementCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ImplementCollectionViewCell"];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults boolForKey:@"DMApp_isShow"]) {
        [self addGuideView];
    }
    [_adverButton setTitle:[AdversInfoSingleton shareManager].adversModel.name forState:UIControlStateNormal];
    
    [NetworkInterface getScrollPicturelistWithAreacode:@"370700"
                                          successBlock:^(NetworkInterfaceReturnDataModel *returnDataModel) {
                                              if (returnDataModel.status == 0) {
                                                  if (returnDataModel.data&&returnDataModel.data>0) {
                                                      NSMutableArray *mutableArray = [NSMutableArray array];
                                                      for (NSDictionary *dic in returnDataModel.data) {
                                                          ScrollImageModel *scrollImageModel = [[ScrollImageModel alloc]initWithDictionary:dic];
                                                          [mutableArray addObject:scrollImageModel];
                                                      }
                                                      _scrollImageArray = mutableArray;
                                                      [self addImageViewToScrollView];
                                                  }
                                              }
                                              
                                          } failureBlock:^{
                                              
                                          }];
}

- (IBAction)advertisersClick:(id)sender {
    
    
    
}
- (IBAction)searchClick:(id)sender {
   
}

-(void)carouselImageClick:(UIButton *)sender
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    H5ViewController *h5VC = [sb instantiateViewControllerWithIdentifier:@"H5ViewController"];
    ScrollImageModel *scrollImageModel = _scrollImageArray[sender.tag];
    h5VC.urlString = scrollImageModel.linkUrl;
    h5VC.title = scrollImageModel.title;
    [self.navigationController pushViewController:h5VC animated:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ToAdertisersSelectViewController"]) {
        AdvertisersListViewController *vc = segue.destinationViewController;
        vc.delegate = self;
    }
}
#pragma mark - Coustom function
// add ImageView to  ScrollView

-(void)initFunctionArray
{
    dispatch_async([SqliteOperateQueue shareManager], ^{
        _functionArray = [DMLocalSqliteData categoryListData];
        dispatch_async(dispatch_get_main_queue(), ^{
            [_functionCollectionView reloadData];
        });
    });
}
-(void) addImageViewToScrollView
{
    //删除scrollView 内的原来的控件
    for(NSInteger i = 0;i<[self.ImageScrollView.subviews count];i++){
        [[self.ImageScrollView.subviews objectAtIndex:i]removeFromSuperview];
    }
    float x = 0;
    CGSize size = [UIScreen mainScreen].bounds.size;
    float width = size.width;
    float hight = self.ImageScrollView.frame.size.height;
    
    NSInteger count = _scrollImageArray?_scrollImageArray.count:4;
    
    self.pageControl.numberOfPages = count;
    
    self.ImageScrollView.contentSize = CGSizeMake(width *count ,hight);
    self.ImageScrollView.delegate = self;
    
    for ( NSInteger i = 0; i<count; i++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(x, 0, width, hight)];
        button.tag = i;
        [button addTarget:self action:@selector(carouselImageClick:) forControlEvents:UIControlEventTouchUpInside];
        
        ScrollImageModel *scrollImageModel=_scrollImageArray[i];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(x, 0, width, hight)];
        UIImage *placeImage = [UIImage imageNamed:[NSString stringWithFormat:@"5_0000_L%ld",(long)i+1]];
        CGFloat imageHight = [imageView sd_setimagewithString:scrollImageModel.smallImgUrl placeholderImage:placeImage];
        
        _scrollImageHeightLayoutConstraint.constant = hight;
        
        [self.ImageScrollView addSubview:imageView];
        [self.ImageScrollView addSubview:button];
        
        if (i == 0) {
            hight = imageHight;
            imageView.frame = CGRectMake(x, 0, width, hight);
            self.ImageScrollView.contentSize = CGSizeMake(width *count ,hight);
            self.scrollImageHeightLayoutConstraint.constant = hight;
        }
        x += width;
    }
}


//add guide page view
-(void)addGuideView
{
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBarHidden = YES;
    NSArray *indexArray = @[@"guide_1",@"guide_2",@"guide_3",];
    CGSize size = [UIScreen mainScreen].bounds.size;
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    scrollView.contentSize = CGSizeMake(size.width *3, size.height);
    scrollView.pagingEnabled = YES;
    //    scrollView.bounces = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.delegate = self;
    scrollView.bounces = NO;
    scrollView.tag = 666;
    [self.view addSubview:scrollView];
    
    UIPageControl *pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake((size.width-100)/2, size.height-50, 100, 50)];
    pageControl.numberOfPages = 3;
    pageControl.currentPage = 0;
    pageControl.tag = 555;
    pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    
    for (int i = 0; i< 3; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*size.width, 0, size.width, size.height)];
        imageView.image = [UIImage imageNamed:[indexArray objectAtIndex:i]];
        [scrollView addSubview:imageView];
        if(i == 2){
            UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(i*size.width+size.width/2-100 , size.height*3/4, 200, 100)];
//                        button.backgroundColor = [UIColor redColor];
            [button addTarget:self action:@selector(insertClick) forControlEvents:UIControlEventTouchUpInside];
            [scrollView addSubview:button];
        }
    }
    [self.view addSubview:pageControl];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:YES forKey:@"DMApp_isShow"];
}


-(void)insertClick
{
    [UIView animateWithDuration:0.5 animations:^{
        UIScrollView *scrollView = (UIScrollView *)[self.view viewWithTag:666];
        scrollView.alpha = 0.0;
        UIPageControl *pageControl = (UIPageControl *)[self.view viewWithTag:555];
        pageControl.alpha = 0.0;
        self.navigationController.navigationBarHidden = NO;
        self.tabBarController.tabBar.hidden = NO;
    }];
}


#pragma mark - UIScrollView Delegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x/scrollView.frame.size.width;
    self.pageControl.currentPage = page;
}


#pragma mark - UICollectionViewDelegate and UICollectionDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView.tag == collectionViewTypeFunction) {
        return 8;
    }else{
        return  16 ;
    }
    
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return  1;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (collectionView.tag == collectionViewTypeFunction) {
        FunctionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FunctionCollectionViewCell" forIndexPath:indexPath];
        ChannelModel *channelModel = _functionArray[indexPath.row];
        cell.imageView.image = [UIImage imageNamed:channelModel.iconsrc];
        cell.titleLabel.text = channelModel.name;
        return cell;
        
    }else{
        ImplementCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImplementCollectionViewCell" forIndexPath:indexPath];
        cell.imageView.image = [UIImage imageNamed:self.implementImageArray[indexPath.row]];
        cell.titleLabel.text = self.implementTitileArray[indexPath.row];
        return cell;
    }
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView.tag == collectionViewTypeFunction) {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        FunctionListViewController *vc = [sb instantiateViewControllerWithIdentifier:@"FunctionListViewController"];
        ChannelModel *channelModel = _functionArray[indexPath.row];
        vc.channelId = [NSString stringWithFormat:@"%ld",(long)channelModel.Id];
        vc.rootId = [NSString stringWithFormat:@"%ld",(long)channelModel.rootid];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        
    }
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((self.view.frame.size.width-32)/4, 70);
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

#pragma mark - UIScrollerView Delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.tag == 666) {
        CGSize size = [UIScreen mainScreen].bounds.size;
        UIPageControl *pageControl = (UIPageControl *)[self.view viewWithTag:555];
        pageControl.currentPage = scrollView.contentOffset.x/size.width;
    }
}
#pragma mark - UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}

#pragma mark - AdvertisersListViewControllerDelegate

-(void)didSelectAdvertisers:(AdversModel *)adversModel
{
    [_adverButton setTitle:adversModel.name forState:UIControlStateNormal];
}





@end
