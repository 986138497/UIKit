//
//  UITableView+Kit.h
//  UIKit
//
//  Created by lei on 2016/11/22.
//  Copyright © 2016年 lei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Kit)
/**
 位置大小CGRect
 */
-(UITableView *(^)(CGRect))tableViewRect;
/**
 contentSize(内容大小)
 */
-(UITableView *(^)(CGSize))tableViewContentSize;
/**
 剪切边界，默认值是NO
 */
-(UITableView *(^)(BOOL))tableViewClipsToBounds;
/**
 背景颜色
 */
-(UITableView *(^)(UIColor *))tableViewBackGroundColor;
/**
 委托
 */
-(UITableView *(^)(id<UITableViewDelegate>))tableViewDelegate;
/**
 数据源
 */
-(UITableView *(^)(id<UITableViewDataSource>))tableViewDataSource;
/**
 分割线风格
 */
-(UITableView *(^)(UITableViewCellSeparatorStyle))tableViewCellSeparatorStyle;
/**
 边缘偏移
 */
-(UITableView *(^)(UIEdgeInsets))tableViewSeparatorInset;
/**
 头部header
 */
-(UITableView *(^)(UIView *))tableViewHeadView;
/**
 尾部footer
 */
-(UITableView *(^)(UIView *))tableViewFootView;
/**
 添加到某个view上
 */
-(UITableView *(^)(UIView *))tableViewSuperView;
@end
