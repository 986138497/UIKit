//
//  UIScrollView+Kit.h
//  UIKit
//
//  Created by lei on 2016/11/22.
//  Copyright © 2016年 lei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Kit)
/**
 位置大小CGRect
 */
-(UIScrollView *(^)(CGRect))scrollViewRect;
/**
 contentSize(内容大小)
 */
-(UIScrollView *(^)(CGSize))scrollViewContentSize;
/**
 剪切边界，默认值是NO
 */
-(UIScrollView *(^)(BOOL))scrollViewClipsToBounds;
/**
 翻页，默认值是NO
 */
-(UIScrollView *(^)(BOOL))scrollViewPagingEnabled;
/**
 指标显示，默认YES
 */
-(UIScrollView *(^)(BOOL))scrollViewShowScrollIndicators;
/**
 背景颜色
 */
-(UIScrollView *(^)(UIColor *))scrollViewBackGroundColor;
/**
 委托
 */
-(UIScrollView *(^)(id<UIScrollViewDelegate>))scrollViewDelegate;
/**
 添加到某个view上
 */
-(UIScrollView *(^)(UIView *))scrollViewSuperView;
@end
