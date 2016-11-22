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
@interface ViewController ()<UITextFieldDelegate,UITextViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *testTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor whiteColor];
 
//    [self createTextView];
//    [self createBtn];
//    [self createLabel];
//    [self createTextFiled];

    [self createTableView];
    
}
-(void)createTableView{
    
   
    self.testTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 40)];
    bgView.backgroundColor = [UIColor redColor];
    self.testTableView.tableViewDelegate(self)
    .tableViewDataSource(self)
    .tableViewSuperView(self.view)
    .tableViewBackGroundColor([UIColor grayColor])
    .tableViewHeadView(bgView)
    .tableViewFootView([[UIView alloc] init]);
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
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *const cellID = @"cellID";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    cell.textLabel.text = @"textLabel";
    cell.detailTextLabel.text = @"detailTextLabel";
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
