//
//  AreaSelectViewController.m
//  DM
//
//  Created by tepusoft on 16/1/9.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import "AreaSelectViewController.h"
#import "AreaModel.h"
#import "SqliteOperateQueue.h"
#import "DMLocalSqliteData.h"

typedef enum : NSUInteger {
    DataTypeProvince,
    DataTypeCity,
    DataTypeDistrict
} DataType;

@interface AreaSelectViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray *tableArray;
@property (nonatomic, strong) AreaModel *province;//省
@property (nonatomic, strong) AreaModel *city;//市
@property (nonatomic, strong) AreaModel *district;//区

@property (nonatomic, assign) DataType dataType;




@end

@implementation AreaSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc]init];
    
    self.title = @"省";
    
    
    _dataType = DataTypeProvince;
    [self initTableArray];
    // Do any additional setup after loading the view from its nib.
}


#pragma mark -  CoustomFunction
-(void)initTableArray
{
    dispatch_async([SqliteOperateQueue shareManager], ^{
        
        if (_dataType == DataTypeProvince) {
            _tableArray = [DMLocalSqliteData provinceListData];
        }else if (_dataType == DataTypeCity){
            _tableArray = [DMLocalSqliteData cityListDataWithProvinceCode:_province.code];
        }else if (_dataType == DataTypeDistrict){
            _tableArray = [DMLocalSqliteData districtListDataWithCityCode:_city.code];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [_tableView reloadData];
        });
    });
}

#pragma mark - UITableViewDelegate AND UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tableArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AreaSelectViewControllerTableCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AreaSelectViewControllerTableCell"];
    }
    AreaModel *model = _tableArray[indexPath.row];
    cell.textLabel.text = model.name;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_dataType == DataTypeProvince) {
        _dataType = DataTypeCity;
        _province = _tableArray[indexPath.row];
        [self initTableArray];
    }else if (_dataType == DataTypeCity){
        _dataType = DataTypeDistrict;
        _city = _tableArray[indexPath.row];
        [self initTableArray];
    }else if (_dataType == DataTypeDistrict){
        _district = _tableArray[indexPath.row];
        NSString *areaName = [NSString stringWithFormat:@"%@-%@-%@",_province.name,_city.name,_district.name];
        [self.delegate AreaSelectViewControllerFinishSelectWithArea:areaName];
        [self.navigationController popViewControllerAnimated:YES];
    }
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
