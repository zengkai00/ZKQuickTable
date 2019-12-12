//
//  ZKQuickTableDemoTwoVC.m
//  KaiDemo
//
//  Created by Kai on 2019/12/10.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickTableDemoTwoVC.h"
#import "ZKQuickCommonModel.h"
#import "ZKQuickCommonCell.h"
#import "ZKQuickSwitchHeaderModel.h"
#import "ZKQuickSwitchFooterModel.h"
@interface ZKQuickTableDemoTwoVC ()

@property (nonatomic,strong)UIView *tableBgView;
@property (nonatomic,strong)ZKQuickTableTool *quickTableTool;

@end

@implementation ZKQuickTableDemoTwoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, KSys_NavAndStatus_Height, KSys_Screen_Width, KSys_Screen_Height - KSys_NavAndStatus_Height)];
    [self.view addSubview:bgView];
    self.tableBgView = bgView;
    
    //建立数据
    NSMutableArray *finalArray = [[NSMutableArray alloc] init];
    NSMutableArray *finalSectionModelArray = [[NSMutableArray alloc] init];
    NSMutableArray *finalFooterModelArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 6; i ++) {
        NSMutableArray *sectionArray = [[NSMutableArray alloc] init];
        ZKQuickSwitchHeaderModel *headerModel = [[ZKQuickSwitchHeaderModel alloc] init];
        headerModel.titleString = [NSString stringWithFormat:@"header%d",i];
        headerModel.headerHeight = arc4random()%30 + 40;
        [finalSectionModelArray addObject:headerModel];
        
        ZKQuickSwitchFooterModel *footerModel = [[ZKQuickSwitchFooterModel alloc] init];
        footerModel.titleString = [NSString stringWithFormat:@"footer%d",i];
        footerModel.footerHeight = arc4random()%30 + 40;
        [finalFooterModelArray addObject:footerModel];
        
        for (int j = 0; j < 5; j ++) {
            ZKQuickCommonModel *cellOneModel = [[ZKQuickCommonModel alloc] init];
            cellOneModel.titleString = [NSString stringWithFormat:@"%d",i];
            [sectionArray addObject:cellOneModel];
        }
        [finalArray addObject:sectionArray];
    }
    
    
    
    KSys_WeakSelf;
    //传入数据，刷新列表，点击block返回
    self.quickTableTool.zk_dataSource = finalArray;
    self.quickTableTool.zk_headerArray = finalSectionModelArray;
    self.quickTableTool.zk_footerArray = finalFooterModelArray;
    [self.quickTableTool.zk_tableView reloadData];
    self.quickTableTool.quickDataModel.manage_didSelectCellBlock = ^(id  _Nonnull model, NSIndexPath * _Nonnull indexPath) {
        [weakSelf didSelectWithModel:model indexPath:indexPath];
    };
}
//点击单元格
- (void)didSelectWithModel:(id)model indexPath:(NSIndexPath *)indexPath
{
    ZKQuickCommonModel *tempModel = (ZKQuickCommonModel *)model;
    KSLog(@"标题%@,区间%ld,单元格%ld",tempModel.titleString,indexPath.section,indexPath.row);
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
        _quickTableTool = [[ZKQuickTableTool alloc] initCreateTableWithView:self.tableBgView tableStyle:UITableViewStyleGrouped];
        _quickTableTool.quickDataModel.isOpenHeaderModelHeight = YES;
        _quickTableTool.quickDataModel.isOpenFooterModelHeight = YES;
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
