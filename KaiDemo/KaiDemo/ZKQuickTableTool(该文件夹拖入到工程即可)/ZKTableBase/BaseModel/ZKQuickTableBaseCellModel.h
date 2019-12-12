//
//  ZKQuickTableBaseCellModel.h
//  KaiDemo
//
//  Created by Kai on 2019/12/5.
//  Copyright © 2019 Kai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZKQuickTableBaseCellModel : NSObject

typedef void(^ZKClickCellBlock)(id model);

//基础属性
@property (nonatomic, copy)NSString *identifier;  //唯一标识符(更新会用到)
@property (nonatomic, copy)NSString *cellClassString;  //该模型绑定的cell类名 默认ZKQuickTableBaseCell

@property (nonatomic, assign)UITableViewCellSelectionStyle selectionStyle;//选中cell效果
@property (nonatomic, assign)CGFloat cellHeight;//cell的高度 默认高度44
@property (nonatomic, assign)BOOL isNeedShowLine;//是否需要显示分割先 默认不显示
@property (nonatomic, assign)CGFloat lineLeftAndRight;//分割线距离左右两边距离
@property (nonatomic, strong)UIColor *lineColor;//分割线的颜色 默认灰色
@property (nonatomic, copy)ZKClickCellBlock zkCellBlock; //点击事件

@end

NS_ASSUME_NONNULL_END
