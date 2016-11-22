//
//  UIImage+Kit.h
//  UIKit
//
//  Created by lei on 2016/11/21.
//  Copyright © 2016年 lei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Kit)

//对图片进行压缩
+(UIImage*)compressedImageToLimitSizeOfKB:(CGFloat)kb image:(UIImage*)image;
//大于多少kb的图片需要压缩
+(NSData*)returnDataCompressedImageToLimitSizeOfKB:(CGFloat)kb image:(UIImage*)image;
//对图片进行处理 画圆并增加外圈
+(UIImage*) circleImage:(UIImage*) image withParam:(CGFloat) inset;
//指定宽度按比例缩放
+(UIImage *) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;
//按比例缩放,size 是你要把图显示到 多大区域 CGSizeMake(300, 140)
+(UIImage *)compressImage:(UIImage *)sourceImage toTargetWidth:(CGFloat)targetWidth;
//缩放图片
+(UIImage*) OriginImage:(UIImage *)image scaleToSize:(CGSize)size;
//图片背景颜色
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
/*! 获得的就是一个圆形的图片 */
-(UIImage *)circleImage;
//上传图片的位置始终都是正方向
+(UIImage *)fixOrientation:(UIImage *)aImage;
/*! 加载最原始的图片，没有渲染 */
+ (instancetype)imageWithOriginalName:(NSString *)imageName;
/**
 *  图片的压缩方法
 *
 *  @param sourceImg   要被压缩的图片
 *  @param defineWidth 要被压缩的尺寸(宽)
 *
 *  @return 被压缩的图片
 */
+ (UIImage *)imgCompressed:(UIImage *)sourceImg targetWidth:(CGFloat)defineWidth;
/**
 *  图片等比例压缩
 *
 *  @param sourceImage 要压缩的图片
 *  @param maxWidth    最大宽度
 *  @param maxHeight   最大高度
 *
 *  @return 压缩后的图片
 */
+ (UIImage *)imageCompressWithSourceImage:(UIImage *)sourceImage MaxWidth:(CGFloat)maxWidth MaxHeight:(CGFloat)maxHeight;


@end
