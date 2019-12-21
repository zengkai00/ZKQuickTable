//
//  ZKQuickAnimateCellModel.h
//  KaiDemo
//
//  Created by Kai on 2019/12/18.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickTableBaseCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZKQuickAnimateCellModel : ZKQuickTableBaseCellModel

@property (nonatomic,copy)NSString *name;//
@property (nonatomic,assign)BOOL isSelect;//
@property (nonatomic,assign)BOOL isAnimate;//

//animate 动画属性
@property (nonatomic,assign)CGFloat lineWidth;//
@property (nonatomic,assign)CGFloat nameX;//
@property (nonatomic,strong)UIColor *curRectColor;
@property (nonatomic,assign)CGAffineTransform curRectTransform;
@property (nonatomic,assign)CGFloat curRectCornerRadius;//
@property (nonatomic,assign)int curLineAlpha;
@property (nonatomic,assign)int curIconAlpha;
@property (nonatomic,assign)CGAffineTransform curIconTransform;

@end

NS_ASSUME_NONNULL_END
