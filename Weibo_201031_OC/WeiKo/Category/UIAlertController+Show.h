//
//  UIAlertController+Show.h
//  自定义alertView
//
//  Created by 樊小聪 on 16/5/31.
//  Copyright © 2016年 樊小聪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Show)

/** 👀 标题颜色 👀 */
@property (weak, nonatomic) UIColor *titleColor;

/** 👀 标题字体大小 👀 */
@property (assign, nonatomic) CGFloat titleFontSize;

/** 👀 内容字体的颜色 👀 */
@property (weak, nonatomic) UIColor *messageColor;

/** 👀 内容的字体大小 👀 */
@property (assign, nonatomic) CGFloat messageFontSize;

/** 👀 内容的行间距 👀 */
@property (assign, nonatomic) CGFloat messageLineHeight;

@end


/* 🐖 ***************************** 🐖 华丽的分隔线 🐖 *****************************  🐖 */

@interface UIAlertAction (Show)

/** 👀 按钮文字的颜色 👀 */
@property (weak, nonatomic) UIColor *titleColor;

@end











