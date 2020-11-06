//
//  NSAttributedString+Extension.h
//  OA
//
//  Created by 樊小聪 on 16/3/26.
//  Copyright © 2016年 Injoinow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSAttributedString (Extension)

/**
 *  根据文字的内容调整行间距
 *
 *  @param text      文字的内容
 *  @param linespace 行间距
 *
 *  @return 返回一个已经调整好行间距的attribuedString
 */
+ (instancetype)attributedStringWithText:(NSString *)text lineSpace:(CGFloat)linespace;

/**
 *  图文混排（文字在前面，图片在后面）
 *
 *  @param text    文字
 *  @param font    文字的大小
 *  @param color   文字的颜色
 *  @param imgName 图片的名字
 *  @param size    图片的尺寸
 *
 *  @return 返回一个已经设置好文字和图片的attributedString
 */
+ (instancetype)attributedStringWithText:(NSString *)text
                                fontSize:(CGFloat)font
                               textColor:(UIColor *)color
                               imageName:(NSString *)imgName
                                 imgSize:(CGSize)size;

/**
 *  图文混排（文字在前面，图片在后面）
 *
 *  @param text     文字
 *  @param font     文字的大小
 *  @param color    文字的颜色
 *  @param imgName  图片的名字
 *  @param size     图片的尺寸
 *  @param position 图片的位置
 *
 *  @return 返回一个已经设置好文字和图片的attributedString
 */
+ (instancetype)attributedStringWithText:(NSString *)text
                                fontSize:(CGFloat)font
                               textColor:(UIColor *)color
                               imageName:(NSString *)imgName
                                 imgSize:(CGSize)size
                                position:(CGPoint)position;

/**
 *  图文混排 （图片在前面，文字在后面）
 *
 *  @param imgName 图片的名称
 *  @param size    图片的大小
 *  @param text    文字
 *  @param font    文字的大小
 *  @param color   文字的颜色
 *
 *  @return 返回一个已经设置好图片和文字的attributedString
 */
+ (instancetype)attributedStringWithImageName:(NSString *)imgName
                                      imgSize:(CGSize)size
                                         text:(NSString *)text
                                     fontSize:(CGFloat)font
                                    textColor:(UIColor *)color;

/**
 *  设置文字不同范围内的文字大小和颜色
 *
 *  @param string   文字
 *  @param maxRange 放大的文字范围
 *  @param maxSize  需要放大的尺寸
 *  @param maxColor 放大的文字颜色
 *  @param minRange 缩小的文字范围
 *  @param minSize  需要缩小的尺寸
 *  @param minColor 缩小的文字颜色
 *
 *  @return 返回一个已经设置好文字和颜色的attributedString
 */
+ (instancetype)attributedStringWithString:(NSString *)string
                             maxScaleRange:(NSRange)maxRange
                               maxFontSize:(CGFloat)maxSize
                                  maxColor:(UIColor *)maxColor
                             minScaleRange:(NSRange)minRange
                               minFontSize:(CGFloat)minSize
                                  minColor:(UIColor *)minColor;



/**
 *  给attributedStirng添加下划线
 *
 *  @param string    文字
 *  @param font      要加入下划线的文字的大小
 *  @param textColor 要加入下划线的文字的颜色
 *  @param range     要加入下划线的文字的范围
 *  @param color     下划线的颜色
 *
 *  @return 返回一个已经设置好下划线的attributedString
 */
+ (instancetype)attribuStringWithString:(NSString *)string
                      underlineTextFont:(CGFloat)font
                     underlineTextColor:(UIColor *)textColor
                         underlineRange:(NSRange)range
                         underlineColor:(UIColor *)color;

/**
 *  给attributedString添加删除线
 *
 *  @param string    文字
 *  @param font      要加入删除线的文字大小
 *  @param textColor 要加入删除线的文字的颜色
 *  @param range     要加入删除线的文字的范围
 *  @param color     删除线的颜色
 *
 *  @return 返回一个已经设置好删除线的attributedString
 */
+ (instancetype)attributedStringWithString:(NSString *)string
                     strikethroughTextFont:(CGFloat)font
                    strikethroughTextColor:(UIColor *)textColor
                    strikethroughTextRange:(NSRange)range
                        strikethroughColor:(UIColor *)color;


/**
 *   @param  text     html格式
 */
+ (instancetype)attributedStringWithText:(NSString *)text;


@end









