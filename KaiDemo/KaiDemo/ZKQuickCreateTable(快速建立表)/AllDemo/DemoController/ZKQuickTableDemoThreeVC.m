//
//  ZKQuickTableDemoThreeVC.m
//  KaiDemo
//
//  Created by Kai on 2019/12/12.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickTableDemoThreeVC.h"
#import "ZKQuickTextFieldCell.h"
#import "ZKQuickTextFieldCellModel.h"
#import "ZKQuickButtonTypeOneModel.h"
#import "ZKQuickButtonTypeOneCell.h"

@interface ZKQuickTableDemoThreeVC ()

@property (nonatomic,strong)UIView *tableBgView;
@property (nonatomic,strong)ZKQuickTableTool *quickTableTool;

@end

@implementation ZKQuickTableDemoThreeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, KSys_NavAndStatus_Height, KSys_Screen_Width, KSys_Screen_Height - KSys_NavAndStatus_Height)];
    [self.view addSubview:bgView];
    self.tableBgView = bgView;
    
    //建立数据
    NSMutableArray *finalArray = [[NSMutableArray alloc] init];
    NSMutableArray *sectionArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 30; i ++) {
        if (i % 2 == 0) {
            ZKQuickTextFieldCellModel *textFieldModel = [[ZKQuickTextFieldCellModel alloc] init];
            textFieldModel.titleString = @"请输入姓名";
            [sectionArray addObject:textFieldModel];
        }else
        {
            ZKQuickButtonTypeOneModel *buttonTypeOneModel = [[ZKQuickButtonTypeOneModel alloc] init];
            buttonTypeOneModel.titleString = @"选择数据";
            [sectionArray addObject:buttonTypeOneModel];
        }
    }
    [finalArray addObject:sectionArray];
    
    KSys_WeakSelf;
    //传入数据，刷新列表，点击block返回
    self.quickTableTool.zk_dataSource = finalArray;
    [self.quickTableTool.zk_tableView reloadData];
    self.quickTableTool.quickDataModel.manage_didSelectCellBlock = ^(id  _Nonnull model, NSIndexPath * _Nonnull indexPath) {
        [weakSelf didSelectWithModel:model indexPath:indexPath];
    };
}

//点击单元格
- (void)didSelectWithModel:(id)model indexPath:(NSIndexPath *)indexPath
{
    
}

- (ZKQuickTableTool *)quickTableTool
{
    if (!_quickTableTool) {
        _quickTableTool = [[ZKQuickTableTool alloc] initCreateTableWithView:self.tableBgView tableStyle:UITableViewStyleGrouped];
//        _quickTableTool.
    }
    return _quickTableTool;
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
