//
//  UIView+ZKExtension.m
//  KaiDemo
//
//  Created by Kai on 2019/12/8.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "UIView+ZKExtension.h"

@implementation UIView (ZKExtension)

- (void)setX_k:(CGFloat)x_k
{
    CGRect frame = self.frame;
    frame.origin.x = x_k;
    self.frame = frame;
}

- (void)setY_k:(CGFloat)y_k
{
    CGRect frame = self.frame;
    frame.origin.y = y_k;
    self.frame = frame;
}

- (CGFloat)x_k
{
    return self.frame.origin.x;
}

- (CGFloat)y_k
{
    return self.frame.origin.y;
}


- (CGFloat)left_k
{
    return self.frame.origin.x;
}

- (void)setLeft_k:(CGFloat)left_k
{
    CGRect frame = self.frame;
    frame.origin.x = left_k;
    self.frame = frame;
}

- (CGFloat)top_k
{
    return self.frame.origin.y;
}

- (void)setTop_k:(CGFloat)top_k
{
    CGRect frame = self.frame;
    frame.origin.y = top_k;
    self.frame = frame;
}

- (CGFloat)right_k {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight_k:(CGFloat)right_k {
    CGRect frame = self.frame;
    frame.origin.x = right_k - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom_k {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom_k:(CGFloat)bottom_k {
    CGRect frame = self.frame;
    frame.origin.y = bottom_k - frame.size.height;
    self.frame = frame;
}

- (CGFloat)width_k {
    return self.frame.size.width;
}

- (void)setWidth_k:(CGFloat)width_k {
    CGRect frame = self.frame;
    frame.size.width = width_k;
    self.frame = frame;
}

- (CGFloat)height_k {
    return self.frame.size.height;
}

- (void)setHeight_k:(CGFloat)height_k {
    CGRect frame = self.frame;
    frame.size.height = height_k;
    self.frame = frame;
}

- (CGPoint)origin_k {
    return self.frame.origin;
}

- (void)setOrigin_k:(CGPoint)origin_k {
    CGRect frame = self.frame;
    frame.origin = origin_k;
    self.frame = frame;
}

- (CGSize)size_k {
    return self.frame.size;
}

- (void)setSize_k:(CGSize)size_k {
    CGRect frame = self.frame;
    frame.size = size_k;
    self.frame = frame;
}

- (void)setCenterX_k:(CGFloat)centerX_k
{
    CGPoint center = self.center;
    center.x = centerX_k;
    self.center = center;
}

- (CGFloat)centerX_k
{
    return self.center.x;
}

- (void)setCenterY_k:(CGFloat)centerY_k
{
    CGPoint center = self.center;
    center.y = centerY_k;
    self.center = center;
}

- (CGFloat)centerY_k
{
    return self.center.y;
}

+ (instancetype)createViewFromXib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

+ (NSString *)identifier {
    return NSStringFromClass([self class]);
}

@end
