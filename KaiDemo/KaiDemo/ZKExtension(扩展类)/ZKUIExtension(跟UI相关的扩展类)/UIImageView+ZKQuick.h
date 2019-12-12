//
//  UIImageView+ZKQuick.h
//  KaiDemo
//
//  Created by Kai on 2019/12/1.
//  Copyright © 2019 Kai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (ZKQuick)

//创建带有图片imageView
+ (UIImageView *)createZKImageViewWithFatherView:(UIView *)fatherView ImageName:(NSString *)imageName;

@end

NS_ASSUME_NONNULL_END
