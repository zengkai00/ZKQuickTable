//
//  ZKQuickTableTool.m
//  KaiDemo
//
//  Created by Kai on 2019/11/17.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickTableTool.h"
#import "ZKQuickTableManager.h"
@interface ZKQuickTableTool()

@property (nonatomic,strong)UIView *fatherView;//添加在哪个view
@property (nonatomic,strong)ZKQuickTableManager *zk_manager;//table的代理类
@property (nonatomic,assign)UITableViewStyle zk_tableStyle;

@end

@implementation ZKQuickTableTool

- (id)initCreateTableWithView:(UIView *)view tableStyle:(UITableViewStyle)tableStyle
{
    self = [super init];
    if (self) {
        //当父类是约束类型，frame无法及时更新
        [view.superview layoutIfNeeded];
        self.zk_manager.quickDataModel = self.quickDataModel;
        self.fatherView = view;
        self.zk_tableStyle = tableStyle;
        self.zk_tableView.showsVerticalScrollIndicator = NO;//垂直滚动条
    }
    return self;
}
#pragma mark - 传入数据源
-(void)setZk_dataSource:(NSMutableArray *)zk_dataSource
{
    _zk_dataSource = zk_dataSource;
    self.zk_manager.zk_dataSource = zk_dataSource;
}
- (void)setZk_headerArray:(NSMutableArray<ZKQuickTableBaseHeaderModel *> *)zk_headerArray
{
    _zk_headerArray = zk_headerArray;
    self.zk_manager.zk_headerArray = zk_headerArray;
}
- (void)setZk_footerArray:(NSMutableArray<ZKQuickTableBaseFooterModel *> *)zk_footerArray
{
    _zk_footerArray = zk_footerArray;
    self.zk_manager.zk_footArray = zk_footerArray;
}
- (void)setIsCanBounces:(BOOL)isCanBounces
{
    _isCanBounces = isCanBounces;
    self.zk_tableView.bounces = isCanBounces;
}
#pragma mark - lazy load
- (UITableView *)zk_tableView
{
    if (!_zk_tableView) {
        NSAssert(self.fatherView != nil, @"table需要一个父类view");
        UITableView *tempTableView = [[UITableView alloc] initWithFrame:CGRectZero style:self.zk_tableStyle];
        tempTableView.frame = self.fatherView.bounds;
        tempTableView.backgroundColor = KColor_GreyMainBgColor;
        tempTableView.delegate = self.zk_manager;
        tempTableView.dataSource = self.zk_manager;
        tempTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.fatherView addSubview:tempTableView];
        _zk_tableView = tempTableView;
    }
    return _zk_tableView;
}

- (ZKQuickTableManager *)zk_manager
{
    if (!_zk_manager) {
        _zk_manager = [[ZKQuickTableManager alloc] init];
    }
    return _zk_manager;
}
- (ZKQuickTableDataModel *)quickDataModel
{
    if (!_quickDataModel) {
        _quickDataModel = [[ZKQuickTableDataModel alloc] init];
    }
    return _quickDataModel;
}
@end
