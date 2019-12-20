//
//  ZKQuickTableTool.h
//  KaiDemo
//
//  Created by Kai on 2019/11/17.
//  Copyright © 2019 Kai. All rights reserved.
//

//github:   https://github.com/zengkai00/ZKQuickTable

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ZKQuickTableDataModel.h"
@class ZKQuickTableBaseHeaderModel,ZKQuickTableBaseFooterModel;
NS_ASSUME_NONNULL_BEGIN

typedef void(^ZKDidSelectCellBlock)(id model,NSIndexPath *indexPath);

@interface ZKQuickTableTool : NSObject

@property (nonatomic,strong)UITableView *zk_tableView;//主要table
@property (nonatomic,strong)NSMutableArray *zk_dataSource;//cell数据源
@property (nonatomic,strong)NSMutableArray<ZKQuickTableBaseFooterModel *> *zk_footerArray; //footer 数组
@property (nonatomic,strong)NSMutableArray<ZKQuickTableBaseHeaderModel *> *zk_headerArray; //header 数组

//0.tableManager 相关的所有属性
@property (nonatomic,strong)ZKQuickTableDataModel *quickDataModel;

//1.先创建一个表，并且在这个model里面要传入一个view
- (id)initCreateTableWithView:(UIView *)view tableStyle:(UITableViewStyle)tableStyle;

//2.是否可以上下滑动 默认为YES
@property (nonatomic,assign)BOOL isCanBounces;


@end

NS_ASSUME_NONNULL_END
