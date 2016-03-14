//
//  CategoryViewController.m
//  DM
//
//  Created by tepusoft on 15/12/22.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import "CategoryViewController.h"
#import "CategoryVCTableViewCell.h"
#import "DMLocalSqliteData.h"
#import "SqliteOperateQueue.h"
#import "ChannelModel.h"
#import "DetailCategoryViewController.h"


@interface CategoryViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray *tableDataArray;


@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc]init];
    [self initCollectionArray];
    // Do any additional setup after loading the view.
}



#pragma mark - CoustomFunction


-(void) initCollectionArray
{
    dispatch_async([SqliteOperateQueue shareManager], ^{
        self.tableDataArray = [NSMutableArray new];
        
        self.tableDataArray = [DMLocalSqliteData categoryListData];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    });
}

#pragma mark - UITableViewDelegate and UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableDataArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CategoryVCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CategoryVCTableViewCell"];
    if (cell ==  nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"CategoryVCTableViewCell" owner:nil options:nil][0];
    }
    ChannelModel *dmLocal = self.tableDataArray[indexPath.row];
    cell.headImageView.image = [UIImage imageNamed:dmLocal.iconsrc];
    cell.titleLabel.text = dmLocal.name;
    cell.smallTitleLabel.text = dmLocal.descriptions;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 66.0;
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
