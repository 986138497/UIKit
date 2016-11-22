//
//  UIButton+Kit.m
//  UIKit
//
//  Created by lei on 2016/11/21.
//  Copyright © 2016年 lei. All rights reserved.
//

#import "UIButton+Kit.h"

@implementation UIButton (Kit)
/**
 背景颜色
 */
-(UIButton *(^)(UIColor *))buttonBackGroundColor{
    return ^(UIColor *backGroundColor){
        self.backgroundColor = backGroundColor;
        return self;
    };
}
/**
 文字颜色
 */
-(UIButton *(^)(UIColor *))buttonTitleColor{
    return ^(UIColor *textColor){
        [self setTitleColor:textColor forState:UIControlStateNormal];
        return self;
    };
}
/**
 文字选中颜色
 */
-(UIButton *(^)(UIColor *))buttonSelectColor{
    return ^(UIColor *textSelectColor){
        [self setTitleColor:textSelectColor forState:UIControlStateSelected];
        return self;
    };
}
/**
 文字高亮颜色
 */
-(UIButton *(^)(UIColor *))buttonHighlightedColor{
    return ^(UIColor *textHighlightedColor){
        [self setTitleColor:textHighlightedColor forState:UIControlStateHighlighted];
        return self;
    };
}
/**
 文字
 */
-(UIButton *(^)(NSString *))buttonTitle{
    return ^(NSString *text){
        [self setTitle:text forState:UIControlStateNormal];
        return self;
    };
}
/**
 文字(选中状态)
 */
-(UIButton *(^)(NSString *))buttonSelectTitle{
    return ^(NSString *selectText){
        [self setTitle:selectText forState:UIControlStateSelected];
        return self;
    };
}
/**
 字体大小
 */
-(UIButton *(^)(float))buttonFontSize{
    return ^(float fontSize){
        self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        return self;
    };
}
/**
 位置大小CGRect
 */
-(UIButton *(^)(CGRect))buttonRect{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}
/**
 边框颜色
 */
-(UIButton *(^)(UIColor *))buttonBorderColor{
    return ^(UIColor *borderColor){
        self.layer.borderColor = borderColor.CGColor;
        return self;
    };
    
}
/**
 边框大小
 */
-(UIButton *(^)(float))buttonBorderWidth{
    return ^(float borderWidth){
        self.layer.borderWidth = borderWidth;
        return self;
    };
}
/**
 button圆角
 */
-(UIButton *(^)(float))buttonCornerRadius{
    return ^(float cornerRadius){
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = cornerRadius;
        return self;
    };
}/**
  图片
  */
-(UIButton *(^)(UIImage *))buttonImage{
    return ^(UIImage *image){
        [self setImage:image forState:UIControlStateNormal];
        return self;
    };
}
/**
 选中图片
 */
-(UIButton *(^)(UIImage *))buttonSelectImage{
    return ^(UIImage *seleImage){
        [self setImage:seleImage forState:UIControlStateSelected];
        return self;
    };
}
/**
 图片
 */
-(UIButton *(^)(UIImage *))buttonBackImage{
    return ^(UIImage *backImage){
        [self setBackgroundImage:backImage forState:UIControlStateSelected];
        return self;
    };
}
/**
 选中图片
 */
-(UIButton *(^)(UIImage *))buttonBackSelectImage{
    return ^(UIImage *backSeleImage){
        [self setBackgroundImage:backSeleImage forState:UIControlStateSelected];
        return self;
    };
}
/**
 添加到某个view上
 */
-(UIButton *(^)(UIView *))buttonSuperView{
    return ^(UIView *view){
        [view addSubview:self];
        return self;
    };
}
/**
 设置图片的位置
 
 @param postion 图片的位置
 @param spacing 图片与文字的距离
 */
- (void)setImagePosition:(ImagePosition)postion spacing:(CGFloat)spacing {
    CGFloat imageWith = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    CGFloat labelWidth = [self.titleLabel.text sizeWithFont:self.titleLabel.font].width;
    CGFloat labelHeight = [self.titleLabel.text sizeWithFont:self.titleLabel.font].height;
#pragma clang diagnostic pop
    
    CGFloat imageOffsetX = (imageWith + labelWidth) / 2 - imageWith / 2;//image中心移动的x距离
    CGFloat imageOffsetY = imageHeight / 2 + spacing / 2;//image中心移动的y距离
    CGFloat labelOffsetX = (imageWith + labelWidth / 2) - (imageWith + labelWidth) / 2;//label中心移动的x距离
    CGFloat labelOffsetY = labelHeight / 2 + spacing / 2;//label中心移动的y距离
    
    switch (postion) {
        case ImagePositionLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2, 0, spacing/2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, -spacing/2);
            break;
            
        case ImagePositionRight:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + spacing/2, 0, -(labelWidth + spacing/2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageHeight + spacing/2), 0, imageHeight + spacing/2);
            break;
            
        case ImagePositionTop:
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            break;
            
        case ImagePositionBottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            break;
            
        default:
            break;
    }
    
}



@end
