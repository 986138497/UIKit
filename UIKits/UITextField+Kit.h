//
//  UITextField+Kit.h
//  UIKit
//
//  Created by lei on 2016/11/21.
//  Copyright © 2016年 lei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Kit)
/**
 位置大小CGRect
 */
-(UITextField *(^)(CGRect))textFieldRect;
/**
 背景颜色
 */
-(UITextField *(^)(UIColor *))textFieldBackGroundColor;
/**
 文字颜色
 */
-(UITextField *(^)(UIColor *))textFieldTitleColor;
/**
 占位符
 */
-(UITextField *(^)(NSString *))textFieldPlaceholderTitle;
/**
 字体大小
 */
-(UITextField *(^)(float))textFieldFontSize;

/**
 回车键行为
 */
-(UITextField *(^)(UIReturnKeyType))textFieldReturnType;

/**
 键盘类型
 */
-(UITextField *(^)(UIKeyboardType))textFieldKeyboardType;

/**
 密文和明文
 */
-(UITextField *(^)(BOOL))textFieldSecurety;

/**
 边框样式
 */
-(UITextField *(^)(UITextBorderStyle))textFieldBorderStyle;
/**
 自动大写
 */
-(UITextField *(^)(UITextAutocapitalizationType))textFieldCapitalization;
/**
 键盘外观样式
 */
-(UITextField *(^)(UIKeyboardAppearance))textFieldKeyboardAppearence;
/**
 开启return键
 */
-(UITextField *(^)(BOOL))textFieldEnablesReturnKeyAutomatically;
/**
 清除按钮类型
 */
-(UITextField *(^)(UITextFieldViewMode))textFieldClearButtonMode;
/**
 自动更正风格
 */
-(UITextField *(^)(UITextAutocorrectionType))textFieldAutoCorrectionType;
/**
 委托
 */
-(UITextField *(^)(id<UITextFieldDelegate>))textFieldDelegate;
/**
 位置 ,居左,居中,居右
 */
-(UITextField *(^)(NSTextAlignment))textFieldTextAlignment;
/**
 添加到某个view上
 */
-(UITextField *(^)(UIView *))textFieldSuperView;
@end
