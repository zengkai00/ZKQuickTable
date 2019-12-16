//
//  ZKQuickTableDemoFourVC.m
//  KaiDemo
//
//  Created by Kai on 2019/12/14.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickTableDemoFourVC.h"
#import "ZKQuickJsonDataCellModel.h"
#import "ZKQuickJsonDataHeaderModel.h"
#import <YYModel/YYModel.h>
@interface ZKQuickTableDemoFourVC ()

@property (nonatomic,strong)UIView *tableBgView;
@property (nonatomic,strong)ZKQuickTableTool *quickTableTool;

@end

@implementation ZKQuickTableDemoFourVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, KSys_NavAndStatus_Height, KSys_Screen_Width, KSys_Screen_Height - KSys_NavAndStatus_Height)];
    [self.view addSubview:bgView];
    self.tableBgView = bgView;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"JsonDataDemo" ofType:@"txt"];
    NSString *rsponseStr = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    rsponseStr = [rsponseStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *returnValue = [[rsponseStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    NSArray *dataArray = [NSArray yy_modelArrayWithClass:[ZKQuickJsonDataHeaderModel class] json:returnValue];
    
    //建立数据
    NSMutableArray *finalArray = [[NSMutableArray alloc] init];
    NSMutableArray *sectionArray = [[NSMutableArray alloc] init];
    KSys_WeakSelf;
    for (int i = 0; i < dataArray.count; i ++) {
        ZKQuickJsonDataHeaderModel *headerModel = dataArray[i];
        headerModel.switchHeaderBlock = ^(ZKQuickJsonDataHeaderModel * _Nonnull currentHeaderModel) {
            [weakSelf clickHeaderBlock:currentHeaderModel];
        };
        [sectionArray addObject:headerModel];
        
        //------
//        NSMutableArray *cellArray = [[NSMutableArray alloc] init];
//        [cellArray addObjectsFromArray:headerModel.cellList];
        
        for (int j = 0; j < headerModel.cellList.count; j ++) {
            ZKQuickJsonDataCellModel *cellModel = headerModel.cellList[j];
            if (headerModel.sectionSwitchOn == YES) {
                if (cellModel.switchOn == YES) {
                    cellModel.cellHeight = ZKQuickJsonData_ClickCellHeight;
                    cellModel.saveCellHeight = cellModel.cellHeight;
                }
            }else
            {
                cellModel.cellHeight = 0;
                if (cellModel.switchOn == YES) {
                    cellModel.saveCellHeight = ZKQuickJsonData_ClickCellHeight;
                }
            }
            cellModel.switchCellBlock = ^(ZKQuickJsonDataCellModel * _Nonnull currentModel) {
                [weakSelf clickCellBlock:currentModel];
            };
        }
        [finalArray addObject:headerModel.cellList];
    }
    
    //传入数据，刷新列表，点击block返回
    self.quickTableTool.zk_dataSource = finalArray;
    self.quickTableTool.zk_headerArray = sectionArray;
    [self.quickTableTool.zk_tableView reloadData];
    
    self.quickTableTool.quickDataModel.manage_didSelectCellBlock = ^(id  _Nonnull model, NSIndexPath * _Nonnull indexPath) {
        [weakSelf didSelectWithModel:model indexPath:indexPath];
    };
}
//当前点击的headerModel
- (void)clickHeaderBlock:(ZKQuickJsonDataHeaderModel *)currentClickHeaderModel
{
    KSLog(@"当前点击的setion%ld",(long)currentClickHeaderModel.currentSection);
    if (self.quickTableTool.zk_dataSource.count > currentClickHeaderModel.currentSection) {
        NSMutableArray *selectSectionArray = self.quickTableTool.zk_dataSource[currentClickHeaderModel.currentSection];
        for (ZKQuickJsonDataCellModel *tempCellModel in selectSectionArray) {
            if (currentClickHeaderModel.sectionSwitchOn == YES) {
                tempCellModel.cellHeight = tempCellModel.saveCellHeight;
            }else
            {
                tempCellModel.cellHeight = 0;
            }
        }
        [self.quickTableTool.zk_tableView reloadSections:[NSIndexSet indexSetWithIndex:currentClickHeaderModel.currentSection] withRowAnimation:UITableViewRowAnimationFade];
    }
    
}
//当前点击的cellModel
- (void)clickCellBlock:(ZKQuickJsonDataCellModel *)currentClickCellModel
{
    KSLog(@"当前点击的-row%ld,setion%ld",(long)currentClickCellModel.currentIndex.row,
          (long)currentClickCellModel.currentIndex.section);
    [self.quickTableTool.zk_tableView reloadRowsAtIndexPaths:@[currentClickCellModel.currentIndex] withRowAnimation:UITableViewRowAnimationFade];
    
}
//点击单元格
- (void)didSelectWithModel:(id)model indexPath:(NSIndexPath *)indexPath
{
    KSLog(@"区间%ld,单元格%ld",indexPath.section,indexPath.row);
}

- (ZKQuickTableTool *)quickTableTool
{
    if (!_quickTableTool) {
        _quickTableTool = [[ZKQuickTableTool alloc] initCreateTableWithView:self.tableBgView tableStyle:UITableViewStyleGrouped];
        _quickTableTool.quickDataModel.isOpenCellModelHeight = YES;
        _quickTableTool.quickDataModel.isOpenHeaderModelHeight = YES;
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
