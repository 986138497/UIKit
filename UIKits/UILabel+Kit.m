//
//  UILabel+Kit.m
//  UIKit
//
//  Created by lei on 2016/11/21.
//  Copyright © 2016年 lei. All rights reserved.
//

#import "UILabel+Kit.h"


@implementation UILabel (Kit)

/**
 位置 ,居左,居中,居右
 */
-(UILabel *(^)(NSTextAlignment))LabelTextAlignment{
    return ^(NSTextAlignment textAlignment){
        self.textAlignment = textAlignment;
        return self;
    };
}
/**
 背景颜色
 */
-(UILabel *(^)(UIColor *))LabelBackGroundColor{
    return ^(UIColor *backGroundColor){
        self.backgroundColor = backGroundColor;
        return self;
    };
}
/**
 文字颜色
 */
-(UILabel *(^)(UIColor *))LabelTextColor{
    return ^(UIColor *textColor){
        self.textColor = textColor;
        return self;
    };
}
/**
 文字
 */
-(UILabel *(^)(NSString *))LabelText{
    return ^(NSString *text){
        self.text = text;
        return self;
    };
}
/**
 字体大小
 */
-(UILabel *(^)(float))LabelFontSize{
    return ^(float fontSize){
        self.font = [UIFont systemFontOfSize:fontSize];
        return self;
    };
}
/**
 位置大小CGRect
 */
-(UILabel *(^)(CGRect))LabelRect{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}
/**
 边框颜色
 */
-(UILabel *(^)(UIColor *))LabelBorderColor{
    return ^(UIColor *borderColor){
        self.layer.borderColor = borderColor.CGColor;
        return self;
    };

}
/**
 边框大小
 */
-(UILabel *(^)(float))LabelBorderWidth{
    return ^(float borderWidth){
        self.layer.borderWidth = borderWidth;
        return self;
    };
}
/**
 阴影颜色
 */
-(UILabel *(^)(UIColor *))LabelShadowColor{
    return ^(UIColor *shadowColor){
        self.shadowColor = shadowColor;
        return self;
    };

}
/**
 阴影偏移量
 */
-(UILabel *(^)(CGSize))LabelShadowOffset{
    return ^(CGSize size){
        self.shadowOffset = size;
        return self;
    };
}

/**
 label圆角
 */
-(UILabel *(^)(float))LabelCornerRadius{
    return ^(float cornerRadius){
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = cornerRadius;
        return self;
    };
}
/**
 行数
 */
-(UILabel *(^)(int))LabelLines{
    return ^(int lines){
        self.numberOfLines = lines;
        return self;
    };
}
/**
 添加到某个view上
 */
-(UILabel *(^)(UIView *))LabelSuperView{
    return ^(UIView *view){
        [view addSubview:self];
        return self;
    };
}


@end
