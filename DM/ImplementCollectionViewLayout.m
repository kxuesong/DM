//
//  ImplementCollectionViewLayout.m
//  DM
//
//  Created by tepusoft on 15/12/24.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import "ImplementCollectionViewLayout.h"

@implementation ImplementCollectionViewLayout

-(void)prepareLayout
{
    [super prepareLayout];
}

-(CGSize)collectionViewContentSize
{
     CGSize size = [UIScreen mainScreen].bounds.size;
    return CGSizeMake(size.width *2, 156);
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    CGSize size = [UIScreen mainScreen].bounds.size;
    CGFloat x = (indexPath.row/8)*size.width + 16 +(indexPath.row%4 *((size.width-32)/4));
    CGFloat y = (indexPath.row/4)%2* 70 +8;
    attributes.frame = CGRectMake(x , y, (size.width-32)/4, 70);
    return attributes;
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *attributes = [NSMutableArray array];
    for (NSInteger i= 0 ; i <16; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    return attributes;
}

@end
