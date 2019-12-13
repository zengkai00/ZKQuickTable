//
//  ZKQuickTableBaseCell.h
//  KaiDemo
//
//  Created by Kai on 2019/12/5.
//  Copyright © 2019 Kai. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZKQuickTableBaseCellModel;
NS_ASSUME_NONNULL_BEGIN

@interface ZKQuickTableBaseCell : UITableViewCell

//初始化UI方法
- (void)setupUI;
//设置数据源方法
- (void)setDataModel:(ZKQuickTableBaseCellModel *)model;

@end

NS_ASSUME_NONNULL_END
