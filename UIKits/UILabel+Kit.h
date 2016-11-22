//
//  UILabel+Kit.h
//  UIKit
//
//  Created by lei on 2016/11/21.
//  Copyright © 2016年 lei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Kit)

/**
 位置 ,居左,居中,居右
 */
-(UILabel *(^)(NSTextAlignment))LabelTextAlignment;

/**
 背景颜色
 */
-(UILabel *(^)(UIColor *))LabelBackGroundColor;

/**
 文字颜色
 */
-(UILabel *(^)(UIColor *))LabelTextColor;

/**
 文字
 */
-(UILabel *(^)(NSString *))LabelText;

/**
 字体大小
 */
-(UILabel *(^)(float))LabelFontSize;

/**
 位置大小CGRect
 */
-(UILabel *(^)(CGRect))LabelRect;

/**
 边框颜色
 */
-(UILabel *(^)(UIColor *))LabelBorderColor;

/**
 边框大小
 */
-(UILabel *(^)(float))LabelBorderWidth;

/**
 阴影颜色
 */
-(UILabel *(^)(UIColor *))LabelShadowColor;

/**
 阴影偏移量
 */
-(UILabel *(^)(CGSize))LabelShadowOffset;

/**
 label圆角
 */
-(UILabel *(^)(float))LabelCornerRadius;

/**
 行数
 */
-(UILabel *(^)(int))LabelLines;
/**
 添加到某个view上
 */
-(UILabel *(^)(UIView *))LabelSuperView;




@end
