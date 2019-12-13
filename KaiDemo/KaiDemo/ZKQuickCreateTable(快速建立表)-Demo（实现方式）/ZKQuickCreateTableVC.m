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
    NSArray *titleArray = @[@"自定义我的页面-DemoOne(能用)",@"带有header和footer的table-DemoTwo(能用)",
                            @"服务端返回的数据页面",
                            @"cell带有动画的页面",
                            @"cell带有按钮输入框",
                            @"服务端数据带有type，根据type进行绑定不同cell",@"带有tableHeaderView",@"长按移动单元格",@"删除单元格",@"1",@"2",@"1",@"2",@"1",@"2",@"1",@"2",@"1",@"2",@"1",@"2",@"1",@"2",@"1",@"2",@"1",@"2",@"1",@"2",@"1",@"2",@"1",@"2",@"1",@"99999"];
//    NSArray *controllerArray = @[@""];
    NSMutableArray *sectionOneArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < titleArray.count; i ++) {
        ZKQuickCommonModel *cellOneModel = [[ZKQuickCommonModel alloc] init];
        cellOneModel.titleString = titleArray[i];
        if (i == 0) {
            cellOneModel.pushControllerStr = @"ZKQuickTableDemoOneVC";
        }else if (i == 1)
        {
            cellOneModel.pushControllerStr = @"ZKQuickTableDemoTwoVC";
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
        _quickTableTool.quickDataModel.selectionStyle = UITableViewCellSelectionStyleDefault;
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
