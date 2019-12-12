//
//  ViewController.m
//  KaiDemo
//
//  Created by Kai on 2019/8/13.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ViewController.h"
#import "ZKQuickCommonModel.h"
#import "ZKQuickCommonCell.h"

#import "ZKQuickCreateTableVC.h"

@interface ViewController ()

@property (nonatomic,strong)UIView *tableBgView;
@property (nonatomic,strong)ZKQuickTableTool *quickTableTool;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //ios11以下时，使用该属性
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, KSys_NavAndStatus_Height, KSys_Screen_Width, KSys_Screen_Height - KSys_NavAndStatus_Height)];
    [self.view addSubview:bgView];
    self.tableBgView = bgView;
    
    
    //建立数据
    NSMutableArray *finalArray = [[NSMutableArray alloc] init];
    NSArray *titleArray = @[@"ZKQuickCreateTable(快速建立表)",
                            @"ZKSwitch"];
    NSArray *controllerArray = @[@"ZKQuickCreateTableVC",
                                 @"ZKSwitchViewController"];
    NSMutableArray *sectionOneArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < titleArray.count; i ++) {
        ZKQuickCommonModel *cellOneModel = [[ZKQuickCommonModel alloc] init];
        cellOneModel.titleString = titleArray[i];
        cellOneModel.pushControllerStr = controllerArray[i];
        [sectionOneArray addObject:cellOneModel];
    }
    [finalArray addObject:sectionOneArray];
    
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
    ZKQuickCommonModel *tempModel = (ZKQuickCommonModel *)model;
    KSLog(@"%@,%ld,%ld",tempModel.titleString,indexPath.section,indexPath.row);
    id vc = [[NSClassFromString(tempModel.pushControllerStr) alloc] init];
    if ([vc isKindOfClass:[UIViewController class]]) {
        UIViewController *tempVc = (UIViewController *)vc;
        tempVc.title = tempModel.titleString;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (ZKQuickTableTool *)quickTableTool
{
    if (!_quickTableTool) {
        _quickTableTool = [[ZKQuickTableTool alloc] initCreateTableWithView:self.tableBgView tableStyle:UITableViewStylePlain];
    }
    return _quickTableTool;
}
@end
