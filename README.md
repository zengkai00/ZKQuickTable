# ZKQuickTable
注意：
所有的cellModel都需要继承ZKQuickTableBaseCellModel， 所有的cell都需要继承ZKQuickTableBaseCell
所有的headerModel都需要继承ZKQuickTableBaseHeaderModel，所有的header都需要继承ZKQuickTableBaseHeader
所有的footerModel都需要继承ZKQuickTableBaseFooterModel，所有的footer都需要继承ZKQuickTableBaseFooter

cell的.m文件中需要实现两个方法
//-----以下2个方法属于必需实现
+ (ZKQuickTableBaseCell *)cellWithIdentifier:(NSString *)cellIdentifier tableView:(UITableView *)tableView;
{
    ZKQuickTableTextCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[ZKQuickTableTextCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}
- (void)setDataModel:(ZKQuickTableBaseCellModel *)model
{
    [super setDataModel:model];
    ZKQuickTableTextModel *finalModel = (ZKQuickTableTextModel *)model;
}


使用步骤：
一、创建ZKQuickTableTool

ZKQuickTableTool *quickTableTool = [[ZKQuickTableTool alloc] initCreateTableWithView:self.tableBgView tableStyle:UITableViewStyleGrouped];

二、建立数据源
//建立数据
NSMutableArray *finalArray = [[NSMutableArray alloc] init];

NSArray *titleArray = @[@"自定义我的页面-DemoOne",@"带有header和footer的table",@"服务端返回的数据页面",@"cell带有动画的页面",
    @"cell带有按钮输入框",@"服务端数据带有type，根据type进行绑定不同cell",@"带有tableHeaderView",@"长按移动单元格",
    @"删除单元格",@"1",@"2",@"1",@"2",@"1",@"2",@"1",@"2",@"1",@"2",@"1",@"99999"];
    
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
//刷新数据
[self.quickTableTool.zk_tableView reloadData];
//单元格点击方法
self.quickTableTool.quickDataModel.manage_didSelectCellBlock = ^(id  _Nonnull model, NSIndexPath * _Nonnull indexPath) {
    [weakSelf didSelectWithModel:model indexPath:indexPath];
};
    
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
