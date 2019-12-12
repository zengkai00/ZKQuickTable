//
//  UIView+ZKExtension.h
//  KaiDemo
//
//  Created by Kai on 2019/12/8.
//  Copyright © 2019 Kai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZKExtension)

@property (nonatomic,assign) CGFloat x_k;
@property (nonatomic,assign) CGFloat y_k;
@property (nonatomic,assign) CGFloat left_k;
@property (nonatomic,assign) CGFloat top_k;
@property (nonatomic,assign) CGFloat height_k;
@property (nonatomic,assign) CGFloat right_k;
@property (nonatomic,assign) CGFloat bottom_k;
@property (nonatomic,assign) CGFloat width_k;
@property (nonatomic,assign) CGPoint origin_k;
@property (nonatomic,assign) CGSize size_k;
@property (nonatomic,assign) CGFloat centerX_k;
@property (nonatomic,assign) CGFloat centerY_k;

//快速创建xib View
+ (instancetype)createViewFromXib;

//判断当前的UIView文件名称
+ (NSString *)identifier;

@end
