//
//  HomeViewController.h
//  DM
//
//  Created by tepusoft on 15/12/21.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    collectionViewTypeFunction = 1,
    collectionViewTypeImplement = 2
} collectionViewType;

@interface HomeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@property (weak, nonatomic) IBOutlet UICollectionView *functionCollectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIScrollView *ImageScrollView;
@property (weak, nonatomic) IBOutlet UICollectionView *implementCollectionView;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UIButton *adverButton;
@end
