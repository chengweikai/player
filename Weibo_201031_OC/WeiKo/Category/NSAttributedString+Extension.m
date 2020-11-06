//
//  NSAttributedString+Extension.m
//  OA
//
//  Created by 樊小聪 on 16/3/26.
//  Copyright © 2016年 Injoinow. All rights reserved.
//

#import "NSAttributedString+Extension.h"

@implementation NSAttributedString (Extension)

//设置行间距

+ (instancetype)attributedStringWithText:(NSString *)text lineSpace:(CGFloat)linespace {
    if (!text) return nil;
    NSMutableAttributedString *contenAttr   = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *parapraphStyle = [[NSMutableParagraphStyle alloc] init];
    [parapraphStyle setLineSpacing:linespace];
    [contenAttr addAttribute:NSParagraphStyleAttributeName value:parapraphStyle range:NSMakeRange(0, text.length)];
    return contenAttr;
}

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
                                 imgSize:(CGSize)size
{

    NSMutableAttributedString *mainTitle = [NSMutableAttributedString attributedStringWithText:text fontSize:font textColor:color imageName:imgName imgSize:size position:CGPointMake(0, -3)];
    return mainTitle;
}

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
                                position:(CGPoint)position
{
    NSMutableAttributedString *mainTitle = [[NSMutableAttributedString alloc] initWithString:text];
    [mainTitle addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:NSMakeRange(0, mainTitle.length)];
    [mainTitle addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, mainTitle.length)];
    
    NSTextAttachment *attament     = [[NSTextAttachment alloc] init];
    attament.bounds                = CGRectMake(position.x, position.y, size.width, size.height);
    UIImage *img                   = [UIImage imageNamed:imgName];
    attament.image                 = img;
    NSAttributedString *iconString = [NSAttributedString attributedStringWithAttachment:attament];
    [mainTitle appendAttributedString:iconString];
    return mainTitle;
}

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
                                    textColor:(UIColor *)color
{
    NSMutableAttributedString *mainTitle = [[NSMutableAttributedString alloc] initWithString:text];
    [mainTitle addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:NSMakeRange(0, mainTitle.length)];
    [mainTitle addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, mainTitle.length)];
    NSTextAttachment *attament      = [[NSTextAttachment alloc] init];
    attament.image                  = [UIImage imageNamed:imgName];
    NSAttributedString *iconString  = [NSAttributedString attributedStringWithAttachment:attament];
    [mainTitle insertAttributedString:iconString atIndex:0];
    return mainTitle;
}

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
                                  minColor:(UIColor *)minColor
{
    
    NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc] initWithString:string];
    [attriString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:maxSize] range:maxRange];
    [attriString addAttribute:NSForegroundColorAttributeName value:maxColor range:maxRange];
    [attriString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:minSize] range:minRange];
    [attriString addAttribute:NSForegroundColorAttributeName value:minColor range:minRange];
    
    return attriString;
}

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
                         underlineColor:(UIColor *)color
{
    NSMutableAttributedString *mAttStr = [[NSMutableAttributedString alloc] initWithString:string];
    [mAttStr addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:range];
    [mAttStr addAttribute:NSUnderlineColorAttributeName value:color range:range];
    [mAttStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:range];
    [mAttStr addAttribute:NSForegroundColorAttributeName value:textColor range:NSMakeRange(0, string.length)];
    
    return mAttStr;
}

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
                        strikethroughColor:(UIColor *)color
{
    NSMutableAttributedString *mAttStr = [[NSMutableAttributedString alloc] initWithString:string];
    
    [mAttStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:range];
    [mAttStr addAttribute:NSForegroundColorAttributeName value:textColor range:range];
    [mAttStr addAttribute:NSStrikethroughColorAttributeName value:color range:range];
    [mAttStr addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:range];
    return mAttStr;
}



/**
 *     UIlabel 在html 显示文字
 */

+ (instancetype)attributedStringWithText:(NSString *)text
{
    
    if (!text) {
        return nil;
    }
    
    NSAttributedString *attrstr=[[NSAttributedString alloc]initWithData:[text dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    
    return attrstr;
    
}


@end
