//
//  UITableView+Kit.m
//  UIKit
//
//  Created by lei on 2016/11/22.
//  Copyright © 2016年 lei. All rights reserved.
//

#import "UITableView+Kit.h"

@implementation UITableView (Kit)
/**
 位置大小CGRect
 */
-(UITableView *(^)(CGRect))tableViewRect{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}
/**
 contentSize(内容大小)
 */
-(UITableView *(^)(CGSize))tableViewContentSize{
    return ^(CGSize size){
        self.contentSize = size;
        return self;
    };
}
/**
 sectionFooterHeight
 */
-(UITableView *(^)(int))tableViewSectionFooterHeight{
    return ^(int sectionFooterHeight){
        self.sectionFooterHeight = sectionFooterHeight;
        return self;
    };
}
/**
 sectionHeaderHeight
 */
-(UITableView *(^)(int))tableViewSectionHeaderHeight{
    return ^(int sectionHeaderHeight){
        self.sectionHeaderHeight = sectionHeaderHeight;
        return self;
    };
}
/**
 剪切边界，默认值是NO
 */
-(UITableView *(^)(BOOL))tableViewClipsToBounds{
    return ^(BOOL clipsToBounds){
        self.clipsToBounds = clipsToBounds;
        return self;
    };
}
/**
 背景颜色
 */
-(UITableView *(^)(UIColor *))tableViewBackGroundColor{
    return ^(UIColor *backGroundColor){
        self.backgroundColor = backGroundColor;
        return self;
    };
}
/**
 委托
 */
-(UITableView *(^)(id<UITableViewDelegate>))tableViewDelegate{
    return ^(id delegate){
        self.delegate = delegate;
        return self;
    };
}
/**
 数据源
 */
-(UITableView *(^)(id<UITableViewDataSource>))tableViewDataSource{
    return ^(id dataSource){
        self.dataSource = dataSource;
        return self;
    };
}
/**
 分割线风格
 */
-(UITableView *(^)(UITableViewCellSeparatorStyle))tableViewCellSeparatorStyle{
    return ^(UITableViewCellSeparatorStyle cellSeparatorStyle){
        self.separatorStyle = cellSeparatorStyle;
        return self;
    };
}
/**
 边缘偏移
 */
-(UITableView *(^)(UIEdgeInsets))tableViewSeparatorInset{
    return ^(UIEdgeInsets separatorInset){
        self.separatorInset = separatorInset;
        return self;
    };
}/**
  头部header
  */
-(UITableView *(^)(UIView *))tableViewHeadView{
    return ^(UIView *headView){
        self.tableHeaderView = headView;
        return self;
    };
}
/**
 尾部footer
 */
-(UITableView *(^)(UIView *))tableViewFootView{
    return ^(UIView *footView){
        self.tableFooterView = footView;
        return self;
    };
}
/**
 添加到某个view上
 */
-(UITableView *(^)(UIView *))tableViewSuperView{
    return ^(UIView *view){
        [view addSubview:self];
        return self;
    };
    
}
@end
