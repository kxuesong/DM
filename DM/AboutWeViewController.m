//
//  AboutWeViewController.m
//  DM
//
//  Created by tepusoft on 15/12/25.
//  Copyright © 2015年 tepusoft. All rights reserved.
//

#import "AboutWeViewController.h"
#import "AboutWeVCTableViewCell.h"


@interface AboutWeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)NSArray *tableNameArray;
@property (nonatomic, strong)NSArray *tableDetailArray;

@end

@implementation AboutWeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableNameArray = @[@"开发商",@"联系方式"];
    self.tableDetailArray = @[@"特普软件",@""];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] init];
    
}

#pragma mark - UITableViewDelegate and UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableNameArray.count;
}




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AboutWeVCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AboutWeVCTableViewCell"];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"AboutWeVCTableViewCell" owner:nil options:nil][0];
    }
    cell.nameLabel.text = self.tableNameArray[indexPath.row];
    cell.detailLabel.text = self.tableDetailArray[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
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
