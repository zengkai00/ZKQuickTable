//
//  ZKQuickTableManager.m
//  KaiDemo
//
//  Created by Kai on 2019/11/20.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickTableManager.h"
#import "ZKQuickTableBaseCell.h"
#import "ZKQuickTableBaseCellModel.h"
#import "ZKQuickTableBaseHeader.h"
#import "ZKQuickTableBaseHeaderModel.h"
#import "ZKQuickTableBaseFooter.h"
#import "ZKQuickTableBaseFooterModel.h"
@implementation ZKQuickTableManager

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

#pragma mark - TableView dataSource
//section count - section数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.zk_dataSource.count;
}

//cell count - cell数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSMutableArray *rows = [self.zk_dataSource objectAtIndex:section];
    NSAssert([rows isKindOfClass:[NSMutableArray class]], @"此对象必须为一个可变数组,请检查数据源组装方式是否正确!");
    return rows.count;
}
//cell height - cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.quickDataModel.isOpenCellModelHeight) {
        NSMutableArray *sections = self.zk_dataSource[indexPath.section];
        NSAssert([sections isKindOfClass:[NSMutableArray class]], @"此对象必须为一个可变数组,请检查数据源组装方式是否正确!");
        ZKQuickTableBaseCellModel *cellModel = (ZKQuickTableBaseCellModel *)sections[indexPath.row];
        return cellModel.cellHeight;
    }
    else
    {
        return self.quickDataModel.cellHeight;
    }
}

//布局cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *sections = self.zk_dataSource[indexPath.section];
    NSAssert([sections isKindOfClass:[NSMutableArray class]], @"此对象必须为一个可变数组,请检查数据源组装方式是否正确!");
    ZKQuickTableBaseCellModel *cellModel = (ZKQuickTableBaseCellModel *)sections[indexPath.row];
    Class class = NSClassFromString(cellModel.cellClassString);
    NSAssert([class isSubclassOfClass:[ZKQuickTableBaseCell class]], @"此cellClassString类别必须存在,并且继承ZKQuickTableBaseCell");
    ZKQuickTableBaseCell *baseCell = [tableView dequeueReusableCellWithIdentifier:cellModel.cellClassString];
    if (baseCell == nil) {
        if (cellModel.isXibCell == YES) {
            baseCell = [ZKQuickTableBaseCell loadXibCellName:cellModel.cellClassString];
        }else
        {
            baseCell = [[class alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellModel.cellClassString];
        }
    }
    baseCell.accessoryType = UITableViewCellAccessoryNone;
    
    if (self.quickDataModel.isOpenModelSelectionStyle == YES) {
        baseCell.selectionStyle = cellModel.selectionStyle;
    }else
    {
        baseCell.selectionStyle = self.quickDataModel.tableSelectionStyle;
    }
    cellModel.currentIndex = indexPath;//传入当前的Indexpath
    cellModel.currentTable = tableView;//传入当前table
    
    //因为先执行cellForRowAtIndexPath 在执行heightForRowAtIndexPath
    if (self.quickDataModel.isOpenCellModelHeight) {
        cellModel.finalTableCellHeight = cellModel.cellHeight;
    }
    else
    {
        cellModel.finalTableCellHeight = self.quickDataModel.cellHeight;
    }
    [baseCell setDataModel:cellModel];
    return baseCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *sections = self.zk_dataSource[indexPath.section];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSAssert([sections isKindOfClass:[NSMutableArray class]], @"此对象必须为一个可变数组,请检查数据源组装方式是否正确!");
    ZKQuickTableBaseCellModel *cellModel = (ZKQuickTableBaseCellModel *)sections[indexPath.row];
    if(cellModel.zkCellBlock){
        cellModel.zkCellBlock(cellModel);
    }
    if (self.quickDataModel.manage_didSelectCellBlock) {
        self.quickDataModel.manage_didSelectCellBlock(cellModel, indexPath);
    }
}

#pragma mark - header or footer
//footer
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (self.zk_footArray.count > section) {
        ZKQuickTableBaseFooterModel *footerModel = self.zk_footArray[section];
        Class class = NSClassFromString(footerModel.footerClassString);
        NSAssert([class isSubclassOfClass:[ZKQuickTableBaseFooter class]], @"此footerClassString类别必须存在,并且继承ZKQuickTableBaseFooter");
        ZKQuickTableBaseFooter *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:footerModel.footerClassString];
        if (!footerView) {
            footerView = [[class alloc] initWithReuseIdentifier:footerModel.footerClassString];
        }
        footerModel.currentTable = tableView;
        footerModel.currentSection = section;
        if (self.quickDataModel.isOpenFooterModelHeight) {
            footerModel.finalTableFooterHeight = footerModel.footerHeight;
        }
        else
        {
            footerModel.finalTableFooterHeight = self.quickDataModel.footerHeight;
        }
        [footerView setFooterDataModel:footerModel];
        return footerView;
    }
    return nil;
}
//header
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (self.zk_headerArray.count > section) {
        ZKQuickTableBaseHeaderModel *headerModel = self.zk_headerArray[section];
        Class class = NSClassFromString(headerModel.headerClassString);
        NSAssert([class isSubclassOfClass:[ZKQuickTableBaseHeader class]], @"此headerClassString类别必须存在,并且继承ZKQuickTableBaseHeader");
        ZKQuickTableBaseHeader *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerModel.headerClassString];
        if (!headerView) {
            headerView = [[class alloc] initWithReuseIdentifier:headerModel.headerClassString];
        }
        headerModel.currentTable = tableView;
        headerModel.currentSection = section;
        if (self.quickDataModel.isOpenHeaderModelHeight) {
            headerModel.finalTableHeaderHeight = headerModel.headerHeight;
        }
        else
        {
            headerModel.finalTableHeaderHeight = self.quickDataModel.headerHeight;
        }
        [headerView setHeaderDataModel:headerModel];
        return headerView;
    }
    return nil;
}
//header height
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.quickDataModel.isOpenHeaderModelHeight && self.zk_headerArray.count > section) {
        ZKQuickTableBaseHeaderModel *headerModel = self.zk_headerArray[section];
        return headerModel.headerHeight;
    }
    else
    {
        return self.quickDataModel.headerHeight;
    }
}
//footer height
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (self.quickDataModel.isOpenFooterModelHeight && self.zk_footArray.count > section) {
        ZKQuickTableBaseFooterModel *footerModel = self.zk_footArray[section];
        return footerModel.footerHeight;
    }
    else
    {
        return self.quickDataModel.footerHeight;
    }
}
@end
