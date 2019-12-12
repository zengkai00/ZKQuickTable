//
//  ZKBaseViewController.m
//  KaiDemo
//
//  Created by Kai on 2019/8/13.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKBaseViewController.h"

@interface ZKBaseViewController ()

@end

@implementation ZKBaseViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //用来判断 在导航栏首页时，禁止使用手势右（侧）滑
    if (self.navigationController.viewControllers.firstObject == self) {
        self.navigationController.interactivePopGestureRecognizer.enabled = false;
    }else{
        self.navigationController.interactivePopGestureRecognizer.enabled = true;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = KColor_GreyMainBgColor;
    
    //ios11以下时，使用该属性
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
