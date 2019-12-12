//
//  ZKSwitch.m
//  KaiDemo
//
//  Created by Kai on 2019/12/8.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKSwitch.h"
#import "UIView+ZKExtension.h"
#define KSwitchColor_16RGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]// rgb颜色转换（16进制->10进制）

//圆形对view的间距
#define ZKSwitch_RoundSpacing 1.5

//圆形点击时，增加的长度
#define ZKSwitch_RoundAddWidth 10

@interface ZKSwitch()
@property (nonatomic,assign)CGRect currentSwitchFrame;//当前选择的大小
@property (nonatomic,assign)CGRect startSmallRoundFrame;//变小的round的开始位置
@property (nonatomic,assign)CGRect startBigRoundFrame;//变大的round的开始位置
@property (nonatomic,assign)CGRect stopSmallRoundFrame;//变小的round的结束位置
@property (nonatomic,assign)CGRect stopBigRoundFrame;//变大的round的结束位置
@property (nonatomic,strong)UIView *showBgView;//显示的背景View
@property (nonatomic,strong)UIImageView *showBgImageView;//显示的背景图片
@property (nonatomic,strong)UIImageView *roundImageView;//圆形按钮

@end
@implementation ZKSwitch
- (id)init
{
    self = [super init];
    if (self) {
        [self createView];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
        [self loadSubViewFrame];
    }
    return self;
}
- (void)layoutSubviews
{
    if (CGRectEqualToRect(self.currentSwitchFrame, self.frame)) {
        //KSLog(@"frame相同");
    }else
    {
        self.currentSwitchFrame = self.frame;
        [self loadSubViewFrame];
        KSLog(@"ZKSwitch的frame变化%@",NSStringFromCGRect(self.frame));
    }
    
}
- (void)createView
{
    self.currentSwitchFrame = self.frame;
    //1.
    self.layer.masksToBounds = YES;
    [self addTarget:self action:@selector(switchTouchDown) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(switchTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(switchTouchUpOutside) forControlEvents:UIControlEventTouchUpOutside];
    
    self.normalBgColor = [UIColor redColor];
    self.selectBgColor = KSwitchColor_16RGB(0x0CA762);
    //2.
    self.showBgView.backgroundColor = self.normalBgColor;
    
    //3.
    self.roundImageView.backgroundColor = [UIColor whiteColor];
    self.roundImageView.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    self.roundImageView.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset(4,4)阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.roundImageView.layer.shadowOpacity = 0.5;//阴影透明度，默认0
    self.roundImageView.layer.shadowRadius = 2;//阴影半径，默认3
}
//第一次加载
- (void)loadSubViewFrame
{
    self.layer.cornerRadius = self.bounds.size.height *0.5;
    self.showBgView.frame = self.bounds;
    self.showBgView.layer.cornerRadius = self.showBgView.height_k * 0.5;
    self.showBgImageView.frame = self.showBgView.bounds;
    if (_isOn) {
        self.roundImageView.frame = self.stopSmallRoundFrame;
        self.roundImageView.layer.cornerRadius = self.roundImageView.height_k * 0.5;
    }else
    {
        self.roundImageView.frame = CGRectMake(ZKSwitch_RoundSpacing, ZKSwitch_RoundSpacing, self.bounds.size.height-2*ZKSwitch_RoundSpacing, self.bounds.size.height-2*ZKSwitch_RoundSpacing);
        self.roundImageView.layer.cornerRadius = self.roundImageView.height_k * 0.5;
    }
    
    
    self.startSmallRoundFrame = CGRectMake(ZKSwitch_RoundSpacing, ZKSwitch_RoundSpacing, self.bounds.size.height-2*ZKSwitch_RoundSpacing, self.bounds.size.height-2*ZKSwitch_RoundSpacing);
    self.startBigRoundFrame = CGRectMake(self.startSmallRoundFrame.origin.x, self.startSmallRoundFrame.origin.y, self.startSmallRoundFrame.size.width + ZKSwitch_RoundAddWidth, self.startSmallRoundFrame.size.height);
    
    self.stopSmallRoundFrame = CGRectMake(self.width_k - self.startSmallRoundFrame.size.width - ZKSwitch_RoundSpacing,self.startSmallRoundFrame.origin.y, self.startSmallRoundFrame.size.width, self.startSmallRoundFrame.size.height);
    self.stopBigRoundFrame = CGRectMake(self.width_k - self.startBigRoundFrame.size.width - ZKSwitch_RoundSpacing,self.startBigRoundFrame.origin.y, self.startBigRoundFrame.size.width, self.startBigRoundFrame.size.height);
}
#pragma mark - set up property设置属性
- (void)setIsOn:(BOOL)isOn
{
    _isOn = isOn;
    [self moveRoundAnimateIsAnimate:NO];
}
//未选择的颜色
- (void)setNormalBgColor:(UIColor *)normalBgColor
{
    _normalBgColor = normalBgColor;
    if (!_isOn) {
        self.showBgView.backgroundColor = normalBgColor;
    }
}
//已选择的颜色
- (void)setSelectBgColor:(UIColor *)selectBgColor
{
    _selectBgColor = selectBgColor;
    if (_isOn) {
        self.showBgView.backgroundColor = selectBgColor;
    }
}
//背景颜色对于上线的间距
- (void)setBgColorSpacing:(CGFloat)bgColorSpacing
{
    _bgColorSpacing = bgColorSpacing;
    if (self.height_k > (2*bgColorSpacing)) {
        self.showBgView.y_k = bgColorSpacing;
        self.showBgView.height_k = self.height_k - 2*bgColorSpacing;
        self.showBgView.layer.cornerRadius = self.showBgView.height_k * 0.5;
    }
}
//是否显示背景图片
- (void)setIsShowBgImage:(BOOL)isShowBgImage
{
    _isShowBgImage = isShowBgImage;
    self.showBgImageView.hidden = !isShowBgImage;
}
//未选择的背景图
- (void)setNormalBgImg:(UIImage *)normalBgImg
{
    _normalBgImg = normalBgImg;
    if (!_isOn) {
        self.showBgImageView.image = normalBgImg;
    }
}
//已选择的背景图
- (void)setSelectBgImg:(UIImage *)selectBgImg
{
    _selectBgImg = selectBgImg;
    if (_isOn) {
        self.showBgImageView.image = selectBgImg;
    }
}

#pragma mark - control event
- (void)switchTouchDown
{
    //KSLog(@"点击switchTouchDown");
    [self showRoundAnimateIsChangeBig:YES];
}
- (void)switchTouchUpInside
{
    //KSLog(@"点击switchTouchUpInside");
    _isOn = !_isOn;
    [self moveRoundAnimateIsAnimate:YES];
}
- (void)switchTouchUpOutside
{
    //KSLog(@"点击switchTouchUpOutside");
    [self showRoundAnimateIsChangeBig:NO];
}

#pragma mark - animate
//改变round的大小
- (void)showRoundAnimateIsChangeBig:(BOOL)isChangeBig
{
    //这边的isOn，都属于点下去 未抬起的时候。所以isOn都还没有变化
    CGRect tempRect = CGRectZero;
    if (_isOn) {
        if (isChangeBig) {
            tempRect = self.stopBigRoundFrame;
        }
        else
        {
            tempRect = self.stopSmallRoundFrame;
        }
    }else
    {
        if (isChangeBig) {
            tempRect = self.startBigRoundFrame;
        }else
        {
            tempRect = self.startSmallRoundFrame;
        }
    }
    [UIView animateWithDuration:0.3 animations:^{
        self.roundImageView.frame = tempRect;
    }];
}
//移动圆形
- (void)moveRoundAnimateIsAnimate:(BOOL)isAnimate
{
    CGRect tempRect = self.startSmallRoundFrame;
    UIColor *tempColor = self.normalBgColor;
    UIImage *tempBgImage = self.normalBgImg;
    UIImage *tempRoundImage = self.roundNormalImg;
    if (_isOn) {
        tempRect = self.stopSmallRoundFrame;
        tempColor = self.selectBgColor;
        tempBgImage = self.selectBgImg;
        tempRoundImage = self.roundSelectImg;
    }
    if (isAnimate) {
        [UIView animateWithDuration:0.3 animations:^{
            self.showBgView.backgroundColor = tempColor;
            self.roundImageView.frame = tempRect;
            self.showBgImageView.image = tempBgImage;
            self.roundImageView.image = tempRoundImage;
        }completion:^(BOOL finished) {
            
        }];
    }
    else
    {
        self.showBgView.backgroundColor = tempColor;
        self.roundImageView.frame = tempRect;
    }
    if (self.switchBlock) {
        self.switchBlock(_isOn);
    }
}

#pragma mark - lazy load
- (UIView *)showBgView
{
    if (!_showBgView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        view.userInteractionEnabled = NO;
        [self addSubview:view];
        _showBgView = view;
    }
    return _showBgView;
}
- (UIImageView *)showBgImageView
{
    if (!_showBgImageView) {
        UIImageView *imageV = [[UIImageView alloc] init];
        imageV.hidden = YES;
        [self.showBgView addSubview:imageV];
        _showBgImageView = imageV;
    }
    return _showBgImageView;
}
- (UIImageView *)roundImageView
{
    if (!_roundImageView) {
        UIImageView *imageV = [[UIImageView alloc] init];
        [self.self addSubview:imageV];
        _roundImageView = imageV;
    }
    return _roundImageView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
