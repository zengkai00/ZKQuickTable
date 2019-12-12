//
//  ZKQuickTableBaseFooter.h
//  KaiDemo
//
//  Created by Kai on 2019/12/7.
//  Copyright © 2019 Kai. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZKQuickTableBaseFooterModel;

@interface ZKQuickTableBaseFooter : UITableViewHeaderFooterView

//footer初始化方法
+ (ZKQuickTableBaseFooter *)footerWithIdentifier:(NSString *)footerIdentifier tableView:(UITableView *)tableView;
//初始化UI方法
- (void)setupUI;
//设置数据源方法
- (void)setFooterDataModel:(ZKQuickTableBaseFooterModel *)footerModel;

@end


