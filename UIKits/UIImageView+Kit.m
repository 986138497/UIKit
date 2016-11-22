//
//  UIImageView+Kit.m
//  UIKit
//
//  Created by lei on 2016/11/21.
//  Copyright © 2016年 lei. All rights reserved.
//

#import "UIImageView+Kit.h"

@implementation UIImageView (Kit)
/**
 背景颜色
 */
-(UIImageView *(^)(UIColor *))imageViewBackGroundColor{
    return ^(UIColor *backGroundColor){
        self.backgroundColor = backGroundColor;
        return self;
    };
}
/**
 位置大小CGRect
 */
-(UIImageView *(^)(CGRect))imageViewRect{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}

/**
 边框颜色
 */
-(UIImageView *(^)(UIColor *))imageViewBorderColor{
    return ^(UIColor *borderColor){
        self.layer.borderColor = borderColor.CGColor;
        return self;
    };
}

/**
 边框大小
 */
-(UIImageView *(^)(float))imageViewBorderWidth{
    return ^(float borderWidth){
        self.layer.borderWidth = borderWidth;
        return self;
    };
}

/**
 imageView圆角
 */
-(UIImageView *(^)(float))imageViewCornerRadius{
    return ^(float cornerRadius){
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = cornerRadius;
        return self;
    };
}
/**
 添加到某个view上
 */
-(UIImageView *(^)(UIView *))imageViewSuperView{
    return ^(UIView *view){
        [view addSubview:self];
        return self;
    };
}
@end
