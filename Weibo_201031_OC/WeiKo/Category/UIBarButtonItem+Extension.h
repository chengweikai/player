//
//  UIBarButtonItem+Extension.h
//  Product
//
//  Created by injoinow on 15/11/16.
//  Copyright (c) 2015年 leftw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

/**
 *  根据文字、文字颜色、文字大小返回一个 UIBarbuttonItem的实例对象
 *
 *  @param title           文字
 *  @param color           普通状态下的文字颜色
 *  @param hightLightColor 高亮状态下的文字颜色
 *  @param fonSize         文字大小
 *  @param target          事件监听者
 *  @param action          事件
 *  @param controlEvents   事件类型
 */
+ (instancetype)barButtonItemWithTitle:(NSString *)title
                            titleColor:(UIColor *)color
                       hightLightColor:(UIColor *)hightLightColor
                              fontSize:(CGFloat)fonSize
                                target:(id)target
                                action:(SEL)action
                      forControlEvents:(UIControlEvents)controlEvents;

/**
 *  根据图片名称返回一个 UIBarbuttonItem的实例对象
 *
 *  @param imgName          普通状态下的图片名称
 *  @param highlightImgName 高亮状态下的图片名称
 *  @param target          事件监听者
 *  @param action          事件
 *  @param controlEvents   事件类型
 */
+ (instancetype)barButtonItemWithImgName:(NSString *)imgName
                        highlightImgName:(NSString *)highlightImgName
                                  target:(id)target
                                  action:(SEL)action
                        forControlEvents:(UIControlEvents)controlEvents;

@end











