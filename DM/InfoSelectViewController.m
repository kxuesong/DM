//
//  InfoSelectViewController.m
//  DM
//
//  Created by tepusoft on 16/1/7.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import "InfoSelectViewController.h"
#import "ChannelModel.h"
#import "SqliteOperateQueue.h"
#import "DMLocalSqliteData.h"

@interface InfoSelectViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *tableArray;
@end

@implementation InfoSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc]init];
    
    _tableArray = [NSArray array];
    
    [self initTableArray];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark -  CoustomFunction
-(void)initTableArray
{
    if (_isWorkPosition) {
        _tableArray = [DMLocalSqliteData workPositionListDataWithParentID:_findType];
    }else{
        _tableArray = [DMLocalSqliteData selectListDataWithType:_findType];
    }
    [_tableView reloadData];
}

#pragma mark - UITableViewDelegate AND UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tableArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InfoSelectTableCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"InfoSelectTableCell"];;
    }
    cell.textLabel.text = _tableArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *title = [_tableArray objectAtIndex:indexPath.row];
    [self.delegate infoSelectViewControllerDidSelectWithTitle:title];
    [self.navigationController popViewControllerAnimated:YES];
}



@end
