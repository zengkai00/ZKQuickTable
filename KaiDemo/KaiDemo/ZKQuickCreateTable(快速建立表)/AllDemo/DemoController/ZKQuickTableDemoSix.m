//
//  ZKQuickTableDemoSix.m
//  KaiDemo
//
//  Created by Kai on 2019/12/18.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickTableDemoSix.h"
#import "ZKQuickAnimateCellModel.h"
#import "ZKQuickAnimateCell.h"
@interface ZKQuickTableDemoSix ()
@property (nonatomic,strong)UIView *tableBgView;
@property (nonatomic,strong)ZKQuickTableTool *quickTableTool;
@end

@implementation ZKQuickTableDemoSix

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    NSArray *titleArray = @[@"自定义我的页面-DemoOne",@"带有header和footer的table-DemoTwo",@"cell带有按钮、输入框-DemoThree",@"服务端返回的数据页面-DemoFour",@"同一个model,根据type进行绑定不同cell-DemoFive",@"删除单元格",@"cell带有动画的页面",@"长按移动单元格",@"带有tableHeaderView-(tableView已暴露出来，直接赋值)"];
    
    NSMutableArray *sectionOneArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < titleArray.count; i ++) {
        ZKQuickAnimateCellModel *cellOneModel = [[ZKQuickAnimateCellModel alloc] init];
        cellOneModel.name = titleArray[i];
        cellOneModel.isSelect = NO;
        cellOneModel.cellClassString = @"ZKQuickAnimateCell";
        cellOneModel.lineWidth = 0;
        cellOneModel.nameX = 30;
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
    ZKQuickAnimateCellModel *currentModel = (ZKQuickAnimateCellModel *)model;
    currentModel.isAnimate = YES;
    currentModel.isSelect = !currentModel.isSelect;
    [self.quickTableTool.zk_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

- (ZKQuickTableTool *)quickTableTool
{
    if (!_quickTableTool) {
        _quickTableTool = [[ZKQuickTableTool alloc] initCreateTableWithView:self.tableBgView tableStyle:UITableViewStyleGrouped];
        _quickTableTool.quickDataModel.cellHeight = 80;
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
