//
//  ZKQuickTableBaseHeaderModel.h
//  KaiDemo
//
//  Created by Kai on 2019/12/5.
//  Copyright © 2019 Kai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZKQuickTableBaseHeaderModel : NSObject

//基础属性-----------------------
//唯一标识符(更新会用到)
@property (nonatomic, copy)NSString *identifierHeader;

//该模型绑定的header类名 默认ZKQuickTableBaseHeader
@property (nonatomic, copy)NSString *headerClassString;

//header的高度 默认高度0.01
@property (nonatomic, assign)CGFloat headerHeight;

//是否需要显示分割先 默认不显示
@property (nonatomic, assign)BOOL isNeedShowLine;

//分割线距离左右两边距离
@property (nonatomic, assign)CGFloat lineLeftAndRight;

//分割线的颜色 默认灰色
@property (nonatomic, strong)UIColor *lineColor;

//当前的table
@property (nonatomic, strong)UITableView *currentTable;

//当前的Section
@property (nonatomic, assign)NSInteger currentSection;

//当前header最终高度(只作为临时赋值，不作为最终header高度)
@property (nonatomic, assign)CGFloat finalTableHeaderHeight;//table的最终header的高度 默认高度0.01

@end

