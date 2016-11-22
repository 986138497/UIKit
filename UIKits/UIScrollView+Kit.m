//
//  UIScrollView+Kit.m
//  UIKit
//
//  Created by lei on 2016/11/22.
//  Copyright © 2016年 lei. All rights reserved.
//

#import "UIScrollView+Kit.h"

@implementation UIScrollView (Kit)
/**
 位置大小CGRect
 */
-(UIScrollView *(^)(CGRect))scrollViewRect{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}
/**
 contentSize(内容大小)
 */
-(UIScrollView *(^)(CGSize))scrollViewContentSize{
    return ^(CGSize size){
        self.contentSize = size;
        return self;
    };
}
/**
 剪切边界，默认值是NO
 */
-(UIScrollView *(^)(BOOL))scrollViewClipsToBounds{
    return ^(BOOL clipsToBounds){
        self.clipsToBounds = clipsToBounds;
        return self;
    };
}
/**
 翻页，默认值是NO
 */
-(UIScrollView *(^)(BOOL))scrollViewPagingEnabled{
    return ^(BOOL pagingEnabled){
        self.pagingEnabled = pagingEnabled;
        return self;
    };
}
/**
 指标显示，默认YES
 */
-(UIScrollView *(^)(BOOL))scrollViewShowScrollIndicators{
    return ^(BOOL showScrollIndicators){
        self.showsVerticalScrollIndicator = showScrollIndicators;
        return self;
    };
}
/**
 背景颜色
 */
-(UIScrollView *(^)(UIColor *))scrollViewBackGroundColor{
    return ^(UIColor *backGroundColor){
        self.backgroundColor = backGroundColor;
        return self;
    };
}
/**
 委托
 */
-(UIScrollView *(^)(id<UIScrollViewDelegate>))scrollViewDelegate{
    return ^(id delegate){
        self.delegate = delegate;
        return self;
    };
}
/**
 添加到某个view上
 */
-(UIScrollView *(^)(UIView *))scrollViewSuperView{
    return ^(UIView *view){
        [view addSubview:self];
        return self;
    };

}
@end
