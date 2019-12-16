# ZKQuickTable
#### UITableView快速建立
#### 通过模型控制cell的显示，服务端数据返回解析成model，手动绑定cell直接刷新表。
#### 1.支持自由自定义cell 2.通过model控制cell，添加指定的model即可。
#### gif示例图（https://github.com/zengkai00/ZKQuickTable/gif/屏幕录制2019-12-1610.01.08.gif）
        注意：
        所有的cellModel都需要继承ZKQuickTableBaseCellModel，
        所有的cell都需要继承ZKQuickTableBaseCell

        cell的.m文件中需要实现两个方法
        //-----以下2个方法属于需要实现
        - (void)setupUI;
        - (void)setDataModel:(ZKQuickTableBaseCellModel *)model;

        使用步骤：
        一、创建ZKQuickTableTool
        ZKQuickTableTool *quickTableTool = [[ZKQuickTableTool alloc] initCreateTableWithView:self.tableBgView ableStyle:UITableViewStyleGrouped];

        二、建立数据源
        NSMutableArray *finalArray = [[NSMutableArray alloc] init];
        NSArray *titleArray = @[@"自定义我的页面-DemoOne",
                                @"带有header和footer的table",
                                @"服务端返回的数据页面",@"cell带有动画的页面",
                                @"cell带有按钮输入框",@"服务端数据带有type，
                                根据type进行绑定不同cell",@"带有tableHeaderView",
                                @"长按移动单元格",@"删除单元格"];
    
        NSMutableArray *sectionOneArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < titleArray.count; i ++) {
            ZKQuickCommonModel *cellOneModel = [[ZKQuickCommonModel alloc] init];
            cellOneModel.titleString = titleArray[i];
            if (i == 0) {
                cellOneModel.pushControllerStr = @"ZKQuickTableDemoOneVC";
            }else if (i == 1)
            {
                cellOneModel.pushControllerStr = @"ZKQuickTableDemoTwoVC";
            }
            [sectionOneArray addObject:cellOneModel];
        }
        [finalArray addObject:sectionOneArray];

        KSys_WeakSelf;
        //传入数据，刷新列表，点击block返回
        self.quickTableTool.zk_dataSource = finalArray;
        //刷新数据
        [self.quickTableTool.zk_tableView reloadData];
        //单元格点击方法
        self.quickTableTool.quickDataModel.manage_didSelectCellBlock = ^(id  _Nonnull model, NSIndexPath * _Nonnull indexPath) {
            [weakSelf didSelectWithModel:model indexPath:indexPath];
        };
    
        //点击单元格
        - (void)didSelectWithModel:(id)model indexPath:(NSIndexPath *)indexPath
        {
            ZKQuickCommonModel *tempModel = (ZKQuickCommonModel *)model;
            KSLog(@"%@,%ld,%ld",tempModel.titleString,indexPath.section,indexPath.row);
            id vc = [[NSClassFromString(tempModel.pushControllerStr) alloc] init];
            if ([vc isKindOfClass:[UIViewController class]]) {
                UIViewController *tempVc = (UIViewController *)vc;
                tempVc.title = tempModel.titleString;
                [self.navigationController pushViewController:vc animated:YES];
            }
        }
        
        --------------以下是cellModel的使用方式
        创建一个Model继承ZKQuickTableBaseCellModel 
        ZKQuickTableTextModel : ZKQuickTableBaseCellModel
        
        @property (nonatomic,copy)NSString *iconImageName;//图标图片
        @property (nonatomic,copy)NSString *titleString;//标题
        @property (nonatomic,copy)NSString *detailString;//详情
        @property (nonatomic,copy)NSString *arrowImageName;//箭头图片
        //创建model
        - (id)initWithIconImageName:(NSString *)iconImageName title:(NSString *)title detailString:(NSString *)detailString clickBlock:(ZKClickCellBlock)clickBlock;
        
        //创建model
        - (id)initWithIconImageName:(NSString *)iconImageName title:(NSString *)title detailString:(NSString *)detailString clickBlock:(ZKClickCellBlock)clickBlock
        {
        self = [super init];
        if (self) {
              self.zkCellBlock = clickBlock;
              self.isNeedShowLine = YES;
              self.cellClassString = @"ZKQuickTableTextCell";
              self.arrowImageName = @"zk_arrow";
              self.selectionStyle = UITableViewCellSelectionStyleDefault;
              self.iconImageName = iconImageName;
              self.titleString = title;
              self.detailString = detailString;
           }
           return self;
        }
        
        -------------一下是cell的使用方式
        创建cell继承于ZKQuickTableBaseCell
        ZKQuickTableTextCell : ZKQuickTableBaseCell
        
        //-----以下2个方法属于必需实现
        - (void)setupUI
        {
        }
        - (void)setDataModel:(ZKQuickTableBaseCellModel *)model
        {
            [super setDataModel:model];
            ZKQuickTableTextModel *finalModel = (ZKQuickTableTextModel *)model;
            if (finalModel.iconImageName.length <= 0 || finalModel.arrowImageName.length <= 0) {
               KSLog(@"图片没名字");
            }
            self.iconImageView.image = KSys_GetImage(finalModel.iconImageName);
            self.titleLabel.text = finalModel.titleString;
            self.detailLabel.text = finalModel.detailString;
            self.arraowImage.image = KSys_GetImage(finalModel.arrowImageName);
        }
