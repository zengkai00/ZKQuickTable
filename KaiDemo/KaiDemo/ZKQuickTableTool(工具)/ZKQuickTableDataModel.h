//
//  ZKQuickTableDataModel.h
//  KaiDemo
//
//  Created by Kai on 2019/12/7.
//  Copyright © 2019 Kai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
typedef void(^ZKDidSelectCellBlock)(id model,NSIndexPath *indexPath);
@interface ZKQuickTableDataModel : NSObject

//1.单元格点击事件
@property (nonatomic,copy)ZKDidSelectCellBlock manage_didSelectCellBlock;

//2.是否开启cellModel中的 cellHeight属性。(默认为关)  关闭状态就是默认使用cellHeight的高度
@property (nonatomic,assign)BOOL isOpenCellModelHeight;

//3.cellHeight 默认44
@property (nonatomic,assign)CGFloat cellHeight;

//4.是否开启headerModel中的 headerHeight属性。(默认为关) 关闭状态就是默认使用headerHeight的高度
@property (nonatomic,assign)BOOL isOpenHeaderModelHeight;

//5.headerView heigh 默认0.01
@property (nonatomic,assign)CGFloat headerHeight;

//6.是否开启footerModel中的 headerHeight属性。(默认为关) 关闭状态就是默认使用footerHeight的高度
@property (nonatomic,assign)BOOL isOpenFooterModelHeight;

//8.footerView heigh 默认0.01
@property (nonatomic,assign)CGFloat footerHeight;

//9.cellSelectionStyle 单元格点击效果 默认UITableViewCellSelectionStyleNone
@property (nonatomic,assign)UITableViewCellSelectionStyle tableSelectionStyle;

//10.是否开启使用model自定义selectionStyle 默认不开启，即使用上面的tableSelectionStyle
@property (nonatomic,assign)BOOL isOpenModelSelectionStyle;

@end

NS_ASSUME_NONNULL_END
