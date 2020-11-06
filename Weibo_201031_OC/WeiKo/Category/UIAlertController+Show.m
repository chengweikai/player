//
//  UIAlertController+Show.m
//  自定义alertView
//
//  Created by 樊小聪 on 16/5/31.
//  Copyright © 2016年 樊小聪. All rights reserved.
//

#import "UIAlertController+Show.h"
#import <objc/runtime.h>

BOOL isPropertyName(NSObject *obj, NSString * str)
{
    unsigned int outCount = 0;
    Ivar * ivars = class_copyIvarList([obj class], &outCount);
    for (unsigned int i = 0; i < outCount; i ++)
    {
        Ivar ivar = ivars[i];
        const char * name = ivar_getName(ivar);
        
        NSString *propertyName = [NSString stringWithUTF8String:name];
        
        if ([propertyName isEqualToString:str])
        {
            return true;
        }
    }
    
    free(ivars);
    
    return false;
}

/* 🐖 ***************************** 🐖 华丽的分隔线 🐖 *****************************  🐖 */

static const char message_key;
static const char title_color_key;
static const char title_font_size_key;
static const char message_color_key;
static const char message_font_size_key;
static const char message_line_height_key;

@implementation UIAlertController (Show)

- (void)setTitle:(NSString *)title
{
    if (title && isPropertyName(self, @"_attributedTitle"))
    {
        NSMutableAttributedString *attributedTitle = [[NSMutableAttributedString alloc] initWithString:title];
        
        [self setValue:attributedTitle forKeyPath:@"_attributedTitle"];
    }
    
    [super setTitle:title];
}

- (void)setMessage:(NSString *)message
{
    if (message && isPropertyName(self, @"_attributedMessage"))
    {
        NSMutableAttributedString *attributedMessage = [[NSMutableAttributedString alloc] initWithString:message];
        
        [self setValue:attributedMessage forKeyPath:@"_attributedMessage"];
    }
    
    objc_setAssociatedObject(self, &message_key, message, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)message
{
   return objc_getAssociatedObject(self, &message_key);
}

- (void)setTitleColor:(UIColor *)titleColor
{
    objc_setAssociatedObject(self, &title_color_key, titleColor, OBJC_ASSOCIATION_ASSIGN);
    
    NSMutableAttributedString *attributedTitle = [self valueForKeyPath:@"_attributedTitle"];
    
    if (attributedTitle)
    {
        [attributedTitle addAttribute:NSForegroundColorAttributeName value:titleColor range:NSMakeRange(0, attributedTitle.length)];
    }
}

- (UIColor *)titleColor
{
    return objc_getAssociatedObject(self, &title_color_key);
}

- (void)setTitleFontSize:(CGFloat)titleFontSize
{
    objc_setAssociatedObject(self, &title_font_size_key, @(titleFontSize), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    NSMutableAttributedString *attributedTitle = [self valueForKeyPath:@"_attributedTitle"];
    
    if (attributedTitle)
    {
        [attributedTitle addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:titleFontSize] range:NSMakeRange(0, attributedTitle.length)];
    }
}

- (CGFloat)titleFontSize
{
    NSNumber *fontSize = objc_getAssociatedObject(self, &title_font_size_key);
    
    return fontSize.floatValue;
}

-  (void)setMessageColor:(UIColor *)messageColor
{
    objc_setAssociatedObject(self, &message_color_key, messageColor, OBJC_ASSOCIATION_ASSIGN);
    
    NSMutableAttributedString *attributedMessage = [self valueForKeyPath:@"_attributedMessage"];
    
    if (attributedMessage)
    {
        [attributedMessage addAttribute:NSForegroundColorAttributeName value:messageColor range:NSMakeRange(0, attributedMessage.length)];
    }
}

- (UIColor *)messageColor
{
    return objc_getAssociatedObject(self, &message_color_key);
}

- (void)setMessageFontSize:(CGFloat)messageFontSize
{
    objc_setAssociatedObject(self, &message_font_size_key, @(messageFontSize), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    NSMutableAttributedString *attributedMessage = [self valueForKeyPath:@"_attributedMessage"];
    
    if (attributedMessage)
    {
        [attributedMessage addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:messageFontSize] range:NSMakeRange(0, attributedMessage.length)];
    }
}

- (CGFloat)messageFontSize
{
    NSNumber *fontSize = objc_getAssociatedObject(self, &message_font_size_key);
    
    return fontSize.floatValue;
}

- (void)setMessageLineHeight:(CGFloat)messageLineHeight
{
    objc_setAssociatedObject(self, &message_line_height_key, @(messageLineHeight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    NSMutableAttributedString *attributedMessage = [self valueForKeyPath:@"_attributedMessage"];

    if (attributedMessage)
    {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = messageLineHeight;
        
        [attributedMessage addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attributedMessage.length)];
    }
}

- (CGFloat)messageLineHeight
{
    NSNumber *lineHeight = objc_getAssociatedObject(self, &message_line_height_key);
    
    return lineHeight.floatValue;
}

@end



/* 🐖 ***************************** 🐖 华丽的分隔线 🐖 *****************************  🐖 */

@implementation UIAlertAction (Show)

- (void)setTitleColor:(UIColor *)titleColor
{
    if (self.title && isPropertyName(self, @"_titleTextColor"))
    {
        [self setValue:titleColor forKeyPath:@"_titleTextColor"];
    }
}

- (UIColor *)titleColor
{
    return [self valueForKeyPath:@"_titleTextColor"];
}

@end

















