# UIKit
UIKit基础控件基于点语法实现,超简单写法



//创建Label
 UILabel *label = [[UILabel alloc]init];
    label.LabelBackGroundColor([UIColor redColor])
    .LabelText(@"afdf")
    .LabelRect(CGRectMake(100, 100, 100, 100))
    .LabelFontSize(18.f)
    .LabelSuperView(self.view)
    .LabelTextColor([UIColor whiteColor])
    .LabelTextAlignment(1)
    .LabelBorderColor([UIColor yellowColor])
    .LabelBorderWidth(1)
    .LabelShadowColor([UIColor greenColor])
    .LabelShadowOffset(CGSizeMake(5, 4))
    .LabelCornerRadius(4);





//创建button
 UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.buttonRect(CGRectMake(100, 100, 100, 100))
    .buttonTitle(@"111")
    .buttonFontSize(14)
    .buttonTitleColor([UIColor redColor])
    .buttonBackGroundColor([UIColor greenColor])
    .buttonImage([UIImage imageNamed:@"choose_default"])
    .buttonSelectImage([UIImage imageNamed:@"choose_selected"])
    .buttonSuperView(self.view)
    .buttonBorderColor([UIColor whiteColor])
    .buttonBorderWidth(3)
    .buttonCornerRadius(10);
    [btn setImagePosition:2 spacing:10];

    [btn addTarget:self action:@selector(onclick:) forControlEvents:UIControlEventTouchUpInside];
    
    
//创建
 UITextField *textField = [[UITextField alloc]init];
    textField.textFieldRect(CGRectMake(100, 100, 100, 100))
    .textFieldPlaceholderTitle(@"111")
    .textFieldFontSize(14)
    .textFieldTitleColor([UIColor redColor])
    .textFieldReturnType(0)
    .textFieldDelegate(self)
    .textFieldSecurety(NO)
    .textFieldBorderStyle(UITextBorderStyleRoundedRect)
    .textFieldSuperView(self.view);
    
    
    
    
    
 //  UITextView *textView = [[UITextView alloc]init];
    textView.textViewRect(CGRectMake(100, 100, 100, 100))
    .textViewFontSize(14)
    .textViewTitleColor([UIColor redColor])
    .textViewDelegate(self)
    .textViewBackGroundColor([UIColor whiteColor])
    .textViewSuperView(self.view)
    .textViewBorderWidth(3)
    .textViewBorderColor([UIColor redColor])
    .textViewCornerRadius(3);
    [textView addPlaceHolder:@"1111"];
    
    
    
//创建UItableView
  //一个分区
//    UITableView *testTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//    [self.view addSubview:testTableView];
//    self.testTableView = testTableView;
//    [[[self.testTableView zzl_numberOfSectionsInTableViewBlock:^NSInteger(UITableView * _Nonnull tableView) {
//        return 1;
//    }] zzl_tableViewNumberOfRowsInSectionBlock:^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
//        return 10;
//    }] zzl_tableViewCellForRowAtIndexPathBlock:^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
//        static NSString *const cellID = @"cellID";
//        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
//        cell.textLabel.text = @"textLabel";
//        cell.detailTextLabel.text = @"detailTextLabel";
//        
//        return cell;
//    }];

    //多个分区
    UITableView *testTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:testTableView];
    self.testTableView = testTableView;
    // UITableView三大基本方法
    [[[self.testTableView zzl_numberOfSectionsInTableViewBlock:^NSInteger(UITableView * _Nonnull tableView) {
        return 2;
    }] zzl_tableViewNumberOfRowsInSectionBlock:^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
        return 3;
    }] zzl_tableViewCellForRowAtIndexPathBlock:^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        static NSString *const cellID = @"cellID";
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        cell.textLabel.text = @"textLabel";
        cell.detailTextLabel.text = @"detailTextLabel";
        
        return cell;
    }];
    
    // 组头尾标题
    [[self.testTableView zzl_tableViewTitleForHeaderInSectionBlock:^NSString * _Nonnull(UITableView * _Nonnull tableView, NSInteger section) {
        return @"You";
    }] zzl_tableViewTitleForFooterInSectionBlock:^NSString * _Nonnull(UITableView * _Nonnull tableView, NSInteger section) {
        return @"Me";
    }];
    
    //  避免Block循环引用!!!
    //  __weak typeof(self) weakSelf = self;
    //  __strong typeof(weakSelf) strongSelf = weakSelf;
    __weak typeof(self) weakSelf = self;
    [self.testTableView zzl_tableViewDidSelectRowAtIndexPathBlock:^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (!strongSelf) {
            return;
        }
        
        NSLog(@"打印 = %@", indexPath);
      
    }];
    
    
    
    
//如有问题,请联系我qq:986138497
