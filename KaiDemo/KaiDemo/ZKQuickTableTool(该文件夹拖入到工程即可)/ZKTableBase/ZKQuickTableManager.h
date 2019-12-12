//
//  ZKQuickTableManager.h
//  KaiDemo
//
//  Created by Kai on 2019/11/20.
//  Copyright © 2019 Kai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ZKQuickTableDataModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ZKQuickTableManager : NSObject<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)NSMutableArray *zk_dataSource;//cell数据源
@property (nonatomic,strong)NSMutableArray *zk_headerArray;//header数据源
@property (nonatomic,strong)NSMutableArray *zk_footArray;//footer数据源

@property (nonatomic,strong)ZKQuickTableDataModel *quickDataModel;
@end

NS_ASSUME_NONNULL_END
