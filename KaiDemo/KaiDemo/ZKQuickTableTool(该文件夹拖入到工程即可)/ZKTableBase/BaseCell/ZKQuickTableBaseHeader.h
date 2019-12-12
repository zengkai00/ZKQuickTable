//
//  ZKQuickTableBaseHeader.h
//  KaiDemo
//
//  Created by Kai on 2019/12/7.
//  Copyright © 2019 Kai. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZKQuickTableBaseHeaderModel;
NS_ASSUME_NONNULL_BEGIN

@interface ZKQuickTableBaseHeader : UITableViewHeaderFooterView

//header初始化方法
+ (ZKQuickTableBaseHeader *)headerWithIdentifier:(NSString *)headerIdentifier tableView:(UITableView *)tableView;
//初始化UI方法
- (void)setupUI;
//设置数据源方法
- (void)setHeaderDataModel:(ZKQuickTableBaseHeaderModel *)headerModel;
@end

NS_ASSUME_NONNULL_END
