//
//  UIBarButtonItem+Extension.m
//  Product
//
//  Created by injoinow on 15/11/16.
//  Copyright (c) 2015年 leftw. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

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
                      forControlEvents:(UIControlEvents)controlEvents
{
    
    UIButton *btn       = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = [UIFont systemFontOfSize:fonSize];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [btn setTitleColor:hightLightColor forState:UIControlStateHighlighted];
    [btn sizeToFit];
    
    [btn addTarget:target action:action forControlEvents:controlEvents];
    
    return  [[UIBarButtonItem alloc] initWithCustomView:btn];
}

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
                        forControlEvents:(UIControlEvents)controlEvents
{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (imgName) {
        [btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    }
    if (highlightImgName) {
        [btn setImage:[UIImage imageNamed:highlightImgName] forState:UIControlStateHighlighted];
    }
    [btn sizeToFit];
    
    [btn addTarget:target action:action forControlEvents:controlEvents];
    
    return  [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
