//
//  UITextField+Kit.m
//  UIKit
//
//  Created by lei on 2016/11/21.
//  Copyright © 2016年 lei. All rights reserved.
//

#import "UITextField+Kit.h"

@implementation UITextField (Kit)
/**
 位置大小CGRect
 */
-(UITextField *(^)(CGRect))textFieldRect{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}
/**
 背景颜色
 */
-(UITextField *(^)(UIColor *))textFieldBackGroundColor{
    return ^(UIColor *backGroundColor){
        self.backgroundColor = backGroundColor;
        return self;
    };
}
/**
 文字颜色
 */
-(UITextField *(^)(UIColor *))textFieldTitleColor{
    return ^(UIColor *textColor){
        self.textColor = textColor;
        return self;
    };
}
/**
 占位符
 */
-(UITextField *(^)(NSString *))textFieldPlaceholderTitle{
    return ^(NSString *placeholderTitle){
        self.placeholder = placeholderTitle;
        return  self;
    };
}
/**
 字体大小
 */
-(UITextField *(^)(float))textFieldFontSize{
    return ^(float fontSize){
        self.font = [UIFont systemFontOfSize:fontSize];
        return self;
    };}

/**
 回车键行为
 */
-(UITextField *(^)(UIReturnKeyType))textFieldReturnType{
    return ^(UIReturnKeyType returnType){
        self.returnKeyType = returnType;
        return  self;
    };
}

/**
 键盘类型
 */
-(UITextField *(^)(UIKeyboardType))textFieldKeyboardType{
        return ^(UIKeyboardType keyboardTypes){
            self.keyboardType = keyboardTypes;
            return  self;
        };
}

/**
 密文和明文
 */
-(UITextField *(^)(BOOL))textFieldSecurety{
    return ^(BOOL isSecurety){
        self.secureTextEntry = isSecurety;
        return self;
    };
}

/**
 边框样式
 */
-(UITextField *(^)(UITextBorderStyle))textFieldBorderStyle{
    return ^(UITextBorderStyle borderStyles){
        self.borderStyle = borderStyles;
        return self;
    };
}
/**
 自动大写
 */
-(UITextField *(^)(UITextAutocapitalizationType))textFieldCapitalization{
    return ^(UITextAutocapitalizationType capitalizations){
        self.autocapitalizationType = capitalizations;
        return self;
    };
}
/**
 键盘外观样式
 */
-(UITextField *(^)(UIKeyboardAppearance))textFieldKeyboardAppearence{
    return ^(UIKeyboardAppearance keyboardAppearences){
        self.keyboardAppearance = keyboardAppearences;
        return self;
    };
}
/**
 开启return键
 */
-(UITextField *(^)(BOOL))textFieldEnablesReturnKeyAutomatically{
    return ^(BOOL enablesReturnKeyAutomaticallys){
        self.enablesReturnKeyAutomatically = enablesReturnKeyAutomaticallys;
        return self;
    };
}
/**
 清除按钮类型
 */
-(UITextField *(^)(UITextFieldViewMode))textFieldClearButtonMode{
    return ^(UITextFieldViewMode clearButtonModes){
        self.clearButtonMode = clearButtonModes;
        return self;
    };
}
/**
 自动更正风格
 */
-(UITextField *(^)(UITextAutocorrectionType))textFieldAutoCorrectionType{
    return ^(UITextAutocorrectionType autoCorrectionTypes){
        self.autocorrectionType = autoCorrectionTypes;
        return self;
    };
}
/**
 委托
 */
-(UITextField *(^)(id<UITextFieldDelegate>))textFieldDelegate{
    return ^(id delegate){
        self.delegate = delegate;
        return self;
    };
}
/**
 位置 ,居左,居中,居右
 */
-(UITextField *(^)(NSTextAlignment))textFieldTextAlignment{
    return ^(NSTextAlignment textAlignment){
        self.textAlignment = textAlignment;
        return self;
    };
}
/**
 添加到某个view上
 */
-(UITextField *(^)(UIView *))textFieldSuperView{
    return ^(UIView *view){
        [view addSubview:self];
        return self;
    };
}
@end
