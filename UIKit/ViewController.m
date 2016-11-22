//
//  ViewController.m
//  UIKit
//
//  Created by lei on 2016/11/21.
//  Copyright © 2016年 lei. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+Kit.h"
#import "UIButton+Kit.h"
#import "UITextField+Kit.h"
#import "UITextView+Kit.h"
#import "UITableView+Kit.h"
@interface ViewController ()<UITextFieldDelegate,UITextViewDelegate>
@property (nonatomic, strong)UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
 
//    [self createTextView];
//    [self createBtn];
//    [self createLabel];
//    [self createTextFiled];

    [self createTableView];
    
}
-(void)createTableView{
       //用法,直接创建UITableView,不用写代理方法,直接复制上面的代码用就行了
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    //[_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
    //cell高度
    [[ [[self.tableView tableViewHeightForRowAtIndexPathBlock:^CGFloat(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        return 60;
        
    }]numberOfSectionsInTableViewBlock:^NSInteger(UITableView * _Nonnull tableView) {
        return 1;
    }]tableViewNumberOfRowsInSectionBlock:^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
        return 10;
    } ] tableViewCellForRowAtIndexPathBlock:^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        static NSString *cellId = @"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (cell==nil) {
            cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
        return cell;
    }];
    //cell的选择
    [self.tableView tableViewDidSelectRowAtIndexPathBlock:^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        
    }];
}
-(void)createLabel{
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
}
-(void)createBtn{
    
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
}
-(void)createTextFiled{
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
}
-(void)createTextView{

    UITextView *textView = [[UITextView alloc]init];
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
}
-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
    [textView resignFirstResponder];
    return YES;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
-(void)onclick:(UIButton *)btn{
    btn.selected = !btn.selected;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
