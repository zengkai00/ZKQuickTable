//
//  ZKSwitch.h
//  KaiDemo
//
//  Created by Kai on 2019/12/8.
//  Copyright © 2019 Kai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZKSwitch : UIControl

@property (nonatomic,assign)BOOL isOn;//默认为关
@property (nonatomic,copy)void (^switchBlock)(BOOL isOn);
@property (nonatomic,strong)UIColor *normalBgColor;//正常的背景颜色
@property (nonatomic,strong)UIColor *selectBgColor;//选择后的背景颜色

@property (nonatomic,assign)CGFloat bgColorSpacing;//有颜色的背景view对上线的距离 默认是0
@property (nonatomic,assign)BOOL isShowBgImage;//是否显示背景图 默认为NO
@property (nonatomic,strong)UIImage *normalBgImg;//背景未选择图片
@property (nonatomic,strong)UIImage *selectBgImg;//背景选择的图片

@property (nonatomic,strong)UIImage *roundNormalImg;//圆圈未选择图片
@property (nonatomic,strong)UIImage *roundSelectImg;//圆圈选择的图片

@end

NS_ASSUME_NONNULL_END
