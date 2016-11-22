//
//  NSMutableString+Kit.h
//  ZDSApp
//
//  Created by lei on 16/7/19.
//  Copyright © 2016年 lei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSMutableString (Kit)

/**
 *  设置文字不同颜色
 *
 *  @param str      要设置的字符串
 *  @param rangeStr 要改变颜色的字符串
 *  @param color    要设置的颜色
 *
 *  @return 返回字符串
 */
+ (NSMutableAttributedString *)setStringColorWith:(NSString *)str rangeOfString:(NSString *)rangeStr color:(UIColor *)color font:(UIFont *)font;
@end
