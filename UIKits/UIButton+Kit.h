//
//  UIButton+Kit.h
//  UIKit
//
//  Created by lei on 2016/11/21.
//  Copyright © 2016年 lei. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, ImagePosition) {
    ImagePositionLeft = 0,              //图片在左，文字在右，默认
    ImagePositionRight = 1,             //图片在右，文字在左
    ImagePositionTop = 2,               //图片在上，文字在下
    ImagePositionBottom = 3,            //图片在下，文字在上
};
@interface UIButton (Kit)
/**
 背景颜色
 */
-(UIButton *(^)(UIColor *))buttonBackGroundColor;
/**
 文字颜色
 */
-(UIButton *(^)(UIColor *))buttonTitleColor;
/**
 文字选中颜色
 */
-(UIButton *(^)(UIColor *))buttonSelectColor;
/**
 文字高亮颜色
 */
-(UIButton *(^)(UIColor *))buttonHighlightedColor;
/**
 文字(正常状态)
 */
-(UIButton *(^)(NSString *))buttonTitle;
/**
 文字(选中状态)
 */
-(UIButton *(^)(NSString *))buttonSelectTitle;
/**
 字体大小
 */
-(UIButton *(^)(float))buttonFontSize;

/**
 位置大小CGRect
 */
-(UIButton *(^)(CGRect))buttonRect;

/**
 边框颜色
 */
-(UIButton *(^)(UIColor *))buttonBorderColor;

/**
 边框大小
 */
-(UIButton *(^)(float))buttonBorderWidth;

/**
 button圆角
 */
-(UIButton *(^)(float))buttonCornerRadius;
/**
 图片
 */
-(UIButton *(^)(UIImage *))buttonImage;
/**
 选中图片
 */
-(UIButton *(^)(UIImage *))buttonSelectImage;
/**
 图片
 */
-(UIButton *(^)(UIImage *))buttonBackImage;
/**
 选中图片
 */
-(UIButton *(^)(UIImage *))buttonBackSelectImage;
/**
 添加到某个view上
 */
-(UIButton *(^)(UIView *))buttonSuperView;

/**
 设置图片的位置

 @param postion 图片的位置
 @param spacing 图片与文字的距离
 */
- (void)setImagePosition:(ImagePosition)postion spacing:(CGFloat)spacing;

@end
