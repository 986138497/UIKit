//
//  NSMutableString+Kit.m
//  ZDSApp
//
//  Created by lei on 16/7/19.
//  Copyright © 2016年 lei. All rights reserved.
//

#import "NSMutableString+Kit.h"

@implementation NSMutableString (Kit)


+ (NSMutableAttributedString *)setStringColorWith:(NSString *)str rangeOfString:(NSString *)rangeStr color:(UIColor *)color font:(UIFont *)font
{
    NSMutableAttributedString *strA = [[NSMutableAttributedString alloc] initWithString:str];
    [strA addAttribute:NSForegroundColorAttributeName value:color range:[str rangeOfString:rangeStr]];
    [strA addAttribute:NSFontAttributeName value:font range:[str rangeOfString:rangeStr]];
    return strA;
}

@end
