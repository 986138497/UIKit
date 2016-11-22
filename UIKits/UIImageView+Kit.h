//
//  UIImageView+Kit.h
//  UIKit
//
//  Created by lei on 2016/11/21.
//  Copyright © 2016年 lei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Kit)
/**
 背景颜色
 */
-(UIImageView *(^)(UIColor *))imageViewBackGroundColor;
/**
 位置大小CGRect
 */
-(UIImageView *(^)(CGRect))imageViewRect;

/**
 边框颜色
 */
-(UIImageView *(^)(UIColor *))imageViewBorderColor;

/**
 边框大小
 */
-(UIImageView *(^)(float))imageViewBorderWidth;

/**
 imageView圆角
 */
-(UIImageView *(^)(float))imageViewCornerRadius;
/**
 添加到某个view上
 */
-(UIImageView *(^)(UIView *))imageViewSuperView;
@end
