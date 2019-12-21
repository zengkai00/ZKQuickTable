//
//  ZKQuickCreateTableVC.m
//  KaiDemo
//
//  Created by Kai on 2019/11/9.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickCreateTableVC.h"
#import "ZKQuickCommonModel.h"
#import "ZKQuickCommonCell.h"
@interface ZKQuickCreateTableVC ()
@property (nonatomic,strong)UIView *tableBgView;
@property (nonatomic,strong)ZKQuickTableTool *quickTableTool;
@end

@implementation ZKQuickCreateTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, KSys_NavAndStatus_Height, KSys_Screen_Width, KSys_Screen_Height - KSys_NavAndStatus_Height)];
    UIView *bgView = [[UIView alloc] init];
    [self.view addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(KSys_NavAndStatus_Height);
        make.bottom.mas_equalTo(0);
    }];
    self.tableBgView = bgView;
    
    //建立数据
    NSMutableArray *finalArray = [[NSMutableArray alloc] init];
    NSArray *titleArray = @[@"DemoOne-自定义我的页面",@"DemoTwo-带有header和footer的table",@"DemoThree-cell带有按钮、输入框",@"DemoFour-服务端返回的数据页面",@"DemoFive-同一个model,根据type进行绑定不同cell",@"DemoSix-cell带有动画的页面",@"删除单元格",@"长按移动单元格",@"上拉加载更多和下拉刷新",@"缺省UI",@"带有tableHeaderView-(tableView已暴露出来，直接赋值)"];
    NSArray *controllerArray = @[@"ZKQuickTableDemoOneVC",@"ZKQuickTableDemoTwoVC",@"ZKQuickTableDemoThreeVC",@"ZKQuickTableDemoFourVC",@"ZKQuickTableDemoFiveVC",@"ZKQuickTableDemoSix"];
    NSMutableArray *sectionOneArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < titleArray.count; i ++) {
        ZKQuickCommonModel *cellOneModel = [[ZKQuickCommonModel alloc] init];
        cellOneModel.titleString = titleArray[i];
        if (i == 4) {
            cellOneModel.fontSize = 12;
        }
        if (controllerArray.count > i) {
            cellOneModel.pushControllerStr = controllerArray[i];
        }
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
        _quickTableTool = [[ZKQuickTableTool alloc] initCreateTableWithView:self.tableBgView tableStyle:UITableViewStyleGrouped];
        _quickTableTool.quickDataModel.tableSelectionStyle = UITableViewCellSelectionStyleDefault;
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
