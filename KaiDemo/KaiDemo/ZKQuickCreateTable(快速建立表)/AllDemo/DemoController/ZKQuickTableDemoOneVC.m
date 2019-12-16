//
//  ZKQuickTableDemoOneVC.m
//  KaiDemo
//
//  Created by Kai on 2019/12/5.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickTableDemoOneVC.h"
#import "ZKQuickTableTextModel.h"
#import "ZKQuickTableSwitchModel.h"
@interface ZKQuickTableDemoOneVC ()
@property (nonatomic,strong)UIView *topBgView;//
@property (nonatomic,strong)UIView *tableBgView;
@property (nonatomic,strong)ZKQuickTableTool *quickTableTool;
@end

@implementation ZKQuickTableDemoOneVC
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //建立数据
    NSMutableArray *finalArray = [[NSMutableArray alloc] init];
    
    ZKQuickTableTextModel *bankModel = [[ZKQuickTableTextModel alloc] initWithIconImageName:@"icon_ftd" title:@"账户明细" detailString:@"¥ 511.12" clickBlock:^(id  _Nonnull model) {
        
    }];
    
    ZKQuickTableTextModel *bankAccountModel = [[ZKQuickTableTextModel alloc] initWithIconImageName:@"icon_jybb_grey" title:@"收款账户" detailString:@"" clickBlock:^(id  _Nonnull model) {
        
    }];
    
    ZKQuickTableTextModel *merDetailModel = [[ZKQuickTableTextModel alloc] initWithIconImageName:@"icon_sbgl" title:@"商户信息" detailString:@"" clickBlock:^(id  _Nonnull model) {
        
    }];
    
    
    ZKQuickTableTextModel *setUpManageModel = [[ZKQuickTableTextModel alloc] initWithIconImageName:@"icon_shxx" title:@"设备管理" detailString:@"" clickBlock:^(id  _Nonnull model) {
        
    }];
    
    ZKQuickTableSwitchModel *phoneVoiceModel = [[ZKQuickTableSwitchModel alloc] initWithIconImageName:@"icon_shxx" title:@"手机语音提醒" detailString:@"" clickBlock:^(id  _Nonnull model) {
        
    }];
    
    ZKQuickTableSwitchModel *skipOutModel = [[ZKQuickTableSwitchModel alloc] initWithIconImageName:@"icon_shxx" title:@"防逃单语音提醒" detailString:@"打开后，顾客扫码后“取消付款”，语音会自动提醒" clickBlock:^(id  _Nonnull model) {
        
    }];
    skipOutModel.cellHeight = 60;
    
    ZKQuickTableSwitchModel *phoneVoiceModel2 = [[ZKQuickTableSwitchModel alloc] initWithIconImageName:@"icon_shxx" title:@"手机语音提醒" detailString:@"" clickBlock:^(id  _Nonnull model) {
        
    }];
    
    ZKQuickTableSwitchModel *phoneVoiceModel3 = [[ZKQuickTableSwitchModel alloc] initWithIconImageName:@"icon_shxx" title:@"手机语音提醒" detailString:@"" clickBlock:^(id  _Nonnull model) {
        
    }];
    ZKQuickTableSwitchModel *phoneVoiceModel4 = [[ZKQuickTableSwitchModel alloc] initWithIconImageName:@"icon_shxx" title:@"手机语音提醒" detailString:@"" clickBlock:^(id  _Nonnull model) {
        
    }];
    ZKQuickTableSwitchModel *phoneVoiceModel5 = [[ZKQuickTableSwitchModel alloc] initWithIconImageName:@"icon_shxx" title:@"手机语音提醒" detailString:@"" clickBlock:^(id  _Nonnull model) {
        
    }];
    ZKQuickTableSwitchModel *phoneVoiceModel6 = [[ZKQuickTableSwitchModel alloc] initWithIconImageName:@"icon_shxx" title:@"手机语音提醒" detailString:@"" clickBlock:^(id  _Nonnull model) {
        
    }];
    ZKQuickTableSwitchModel *phoneVoiceModel7 = [[ZKQuickTableSwitchModel alloc] initWithIconImageName:@"icon_shxx" title:@"手机语音提醒" detailString:@"" clickBlock:^(id  _Nonnull model) {
        
    }];
    ZKQuickTableSwitchModel *phoneVoiceModel8 = [[ZKQuickTableSwitchModel alloc] initWithIconImageName:@"icon_shxx" title:@"手机语音提醒" detailString:@"" clickBlock:^(id  _Nonnull model) {
        
    }];
    ZKQuickTableSwitchModel *phoneVoiceModel9 = [[ZKQuickTableSwitchModel alloc] initWithIconImageName:@"icon_shxx" title:@"手机语音提醒" detailString:@"" clickBlock:^(id  _Nonnull model) {
        
    }];
    ZKQuickTableSwitchModel *phoneVoiceModel10 = [[ZKQuickTableSwitchModel alloc] initWithIconImageName:@"icon_shxx" title:@"手机语音提醒" detailString:@"" clickBlock:^(id  _Nonnull model) {
        
    }];
    ZKQuickTableSwitchModel *phoneVoiceModel11 = [[ZKQuickTableSwitchModel alloc] initWithIconImageName:@"icon_shxx" title:@"手机语音提醒" detailString:@"" clickBlock:^(id  _Nonnull model) {
        
    }];
    ZKQuickTableSwitchModel *phoneVoiceModel12 = [[ZKQuickTableSwitchModel alloc] initWithIconImageName:@"icon_shxx" title:@"手机语音提醒" detailString:@"" clickBlock:^(id  _Nonnull model) {
        
    }];
    
    NSMutableArray *sec1 = [[NSMutableArray alloc] initWithObjects:bankModel,bankAccountModel,merDetailModel,setUpManageModel, nil];
    NSMutableArray *sec2 = [[NSMutableArray alloc] initWithObjects:merDetailModel,setUpManageModel, nil];
    NSMutableArray *sec3 = [[NSMutableArray alloc] initWithObjects:phoneVoiceModel,skipOutModel, nil];
    NSMutableArray *sec4 = [[NSMutableArray alloc] initWithObjects:phoneVoiceModel2,phoneVoiceModel3, nil];
    NSMutableArray *sec5 = [[NSMutableArray alloc] initWithObjects:phoneVoiceModel4,phoneVoiceModel5, nil];
    NSMutableArray *sec6 = [[NSMutableArray alloc] initWithObjects:phoneVoiceModel6,phoneVoiceModel7, nil];
    NSMutableArray *sec7 = [[NSMutableArray alloc] initWithObjects:phoneVoiceModel8,phoneVoiceModel9, nil];
    NSMutableArray *sec8 = [[NSMutableArray alloc] initWithObjects:phoneVoiceModel10,phoneVoiceModel11,phoneVoiceModel12, nil];
    [finalArray addObject:sec1];
    [finalArray addObject:sec2];
    [finalArray addObject:sec3];
    [finalArray addObject:sec4];
    [finalArray addObject:sec5];
    [finalArray addObject:sec6];
    [finalArray addObject:sec7];
    [finalArray addObject:sec8];
    
    KSys_WeakSelf;
    //传入数据，刷新列表，点击block返回
    self.quickTableTool.zk_dataSource = finalArray;
    [self.quickTableTool.zk_tableView reloadData];
    self.quickTableTool.quickDataModel.manage_didSelectCellBlock = ^(id  _Nonnull model, NSIndexPath * _Nonnull indexPath) {
        [weakSelf didSelectWithModel:model indexPath:indexPath];
    };
}
//点击单元格
- (void)didSelectWithModel:(id)model indexPath:(NSIndexPath *)indexPath
{
    ZKQuickTableTextModel *tempModel = (ZKQuickTableTextModel *)model;
    KSLog(@"%@,%ld,%ld",tempModel.titleString,indexPath.section,indexPath.row);
}
#pragma mark - lazy load
- (UIView *)topBgView
{
    if (!_topBgView) {
        _topBgView = [UIView createZKViewWithFatherView:self.view];
        [_topBgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(240);
        }];
        
        UIImageView *imageV = [UIImageView createZKImageViewWithFatherView:_topBgView ImageName:@"pic_bg"];
        [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_offset(190);
        }];
        
        UIView *tempView = [UIView createZKViewWithFatherView:_topBgView];
        tempView.layer.shadowColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:0.4].CGColor;
        tempView.layer.shadowOffset = CGSizeMake(0,3);
        tempView.layer.shadowOpacity = 1;
        tempView.layer.shadowRadius = 5;
        tempView.layer.cornerRadius = 10;
        [tempView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.right.mas_equalTo(-12);
            make.height.mas_equalTo(70);
            make.bottom.mas_equalTo(-12);
        }];
        
        UIButton *backBt = [UIButton buttonWithType:UIButtonTypeSystem];
        [backBt setTitle:@"返回" forState:UIControlStateNormal];
        [backBt addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [tempView addSubview:backBt];
        [backBt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.centerY.mas_equalTo(0);
        }];
    }
    return _topBgView;
}
- (void)backButtonClick:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (UIView *)tableBgView
{
    if (!_tableBgView) {
        _tableBgView = [UIView createZKViewWithFatherView:self.view];
        [_tableBgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.top.equalTo(self.topBgView.mas_bottom).offset(0);
            make.bottom.mas_equalTo(0);
        }];
    }
    return _tableBgView;
}
- (ZKQuickTableTool *)quickTableTool
{
    if (!_quickTableTool) {
        _quickTableTool = [[ZKQuickTableTool alloc] initCreateTableWithView:self.tableBgView tableStyle:UITableViewStyleGrouped];
        _quickTableTool.isCanBounces = NO;
        _quickTableTool.quickDataModel.isOpenCellModelHeight = YES;
        _quickTableTool.quickDataModel.footerHeight = 10;
    }
    return _quickTableTool;
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
