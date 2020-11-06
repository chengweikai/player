//
//  UIImage+Extension.h
//  OA
//
//  Created by 樊小聪 on 16/3/26.
//  Copyright © 2016年 Injoinow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**
 *  压缩图片
 *
 *  @param sourceImage 源图片
 *  @param defineWidth 目标宽度
 *
 */
//- (UIImage *)imageCompressForWidth:(UIImage *)sourceImage
//                       targetWidth:(CGFloat)defineWidth;

/**
 *  根据 颜色生成一个 image 对象
 *
 *  @param color 颜色
 *  @param frame 尺寸
 */
+ (UIImage *)imageFormColor:(UIColor *)color frame:(CGRect)frame;

/** 👀 取颜色color背景图片 👀 */ 
+ (UIImage *)imageFromColor:(UIColor *)color;


/**
 *  @brief 透明的图片
 *
 *  @return UIImage
 */
+ (UIImage *)imageForTranslucent;

/**
 *  @brief 导航栏默认的图片
 *
 *  @return UIImage
 */
+ (UIImage *)imageForDefaultBackgroundImage;

/**
 *  带居中文字的图片
 *
 *  @param title    文字
 *  @param fontSize 文字大小
 *
 *  @return
 */
- (UIImage *)imageWithTitle:(NSString *)title fontSize:(CGFloat)fontSize;

/**
 *  根据一个 view 返回一个 UIImage 对象
 *
 */
+ (UIImage *)snapshotImageAfterScreenUpdates:(BOOL)afterUpdates fromView:(UIView *)view;

@end
