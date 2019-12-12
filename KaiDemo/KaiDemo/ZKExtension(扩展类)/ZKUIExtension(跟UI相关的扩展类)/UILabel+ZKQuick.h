//
//  UILabel+ZKQuick.h
//  KaiDemo
//
//  Created by Kai on 2019/11/30.
//  Copyright © 2019 Kai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (ZKQuick)

+ (UILabel *)createZKLabelWithFatherView:(UIView *)fatherView textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment font:(UIFont *)font;

@end

NS_ASSUME_NONNULL_END
