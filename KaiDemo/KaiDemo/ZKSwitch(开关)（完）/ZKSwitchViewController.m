//
//  ZKSwitchViewController.m
//  KaiDemo
//
//  Created by Kai on 2019/12/8.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKSwitchViewController.h"
#import "ZKSwitch.h"
@interface ZKSwitchViewController ()

@property (nonatomic,strong)ZKSwitch *switchNow;

@end

@implementation ZKSwitchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    self.switchNow = [[ZKSwitch alloc] initWithFrame:CGRectMake(100, 200, 60, 30)];
    self.switchNow = [[ZKSwitch alloc] init];
    self.switchNow.normalBgColor = KColor_Yellow;
    self.switchNow.selectBgColor = KColor_Blue;
//    self.switchNow.isShowBgImage = YES;
//    self.switchNow.selectBgImg = KSys_GetImage(@"switchBg");
//    self.switchNow.normalBgImg = KSys_GetImage(@"switchNormalBg");
    [self.view addSubview:self.switchNow];
    [self.switchNow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(60);
    }];
    self.switchNow.switchBlock = ^(BOOL isOn) {
        KSLog(@"开关%d",isOn);
    };
}
- (IBAction)buttonClicked:(UIButton *)sender {
    self.switchNow.isOn = !self.switchNow.isOn;
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
