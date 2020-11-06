//
//  UIImage+Extension.m
//  OA
//
//  Created by 樊小聪 on 16/3/26.
//  Copyright © 2016年 Injoinow. All rights reserved.
//

#import "UIImage+Extension.h"
#import "UIColor+Util.h"
#import "ColorMacros.h"

@implementation UIImage (Extension)

/**
 *  压缩图片
 *
 *  @param sourceImage 源图片
 *  @param defineWidth 目标宽度
 *
 */
//- (UIImage *)imageCompressForWidth:(UIImage *)sourceImage
//                       targetWidth:(CGFloat)defineWidth
//{
//　  CGSize imageSize = sourceImage.size;
// 　 CGFloat width = imageSize.width;
//　　CGFloat height = imageSize.height;
//　　CGFloat targetWidth = defineWidth;
//　　CGFloat targetHeight = (targetWidth / width) * height;
//　　UIGraphicsBeginImageContext(CGSizeMake(targetWidth, targetHeight));
//　　[sourceImage drawInRect:CGRectMake(0,0,targetWidth, targetHeight)];
//　　UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
//　　UIGraphicsEndImageContext();
//　　return newImage;
//}


+ (UIImage *)imageForDefaultBackgroundImage
{
    return [UIImage imageFormColor:COLOR_C1 frame:CGRectMake(0, 0, 2.0f, 2.0f)];
}

+ (UIImage *)imageForTranslucent
{
    
    return [UIImage imageFormColor:[UIColor clearColor] frame:CGRectMake(0, 0, 2.0f, 2.0f)];
}

+ (UIImage *)imageFormColor:(UIColor *)color frame:(CGRect)frame
{
    CGRect rect = CGRectMake(0, 0, frame.size.width, frame.size.height);
    
    // 开启一个 位图上下文
    UIGraphicsBeginImageContext(rect.size);
    
    // 获取当前的位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 设置填充颜色
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    // 开始填充
    CGContextFillRect(context, rect);
    
    // 获得 当前上下文的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 结束 位图上下文
    UIGraphicsEndImageContext();
    return image;
}


+ (UIImage *)imageFromColor:(UIColor *)color
{
    return [self imageFormColor:color frame:CGRectMake(0, 0, 1, 1)];
}


- (UIImage *)imageWithTitle:(NSString *)title fontSize:(CGFloat)fontSize {
    //画布大小
    CGSize size=CGSizeMake(self.size.width,self.size.height);
    //创建一个基于位图的上下文
    UIGraphicsBeginImageContextWithOptions(size,NO,0.0);//opaque:NO  scale:0.0
    
    [self drawAtPoint:CGPointMake(0.0,0.0)];
    
    //文字居中显示在画布上
    NSMutableParagraphStyle* paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paragraphStyle.alignment=NSTextAlignmentCenter;//文字居中
    
    //计算文字所占的size,文字居中显示在画布上
    CGSize sizeText=[title boundingRectWithSize:self.size options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}context:nil].size;
    CGFloat width = self.size.width;
    CGFloat height = self.size.height;
    
    CGRect rect = CGRectMake((width-sizeText.width)/2, (height-sizeText.height)/2, sizeText.width, sizeText.height);
    //绘制文字
    [title drawInRect:rect withAttributes:@{ NSFontAttributeName:[UIFont systemFontOfSize:fontSize],NSForegroundColorAttributeName:[UIColor orangeColor],NSParagraphStyleAttributeName:paragraphStyle}];
    
    //返回绘制的新图形
    UIImage *newImage= UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}



+ (UIImage *)snapshotImageFromView:(UIView *)view {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}

+ (UIImage *)snapshotImageAfterScreenUpdates:(BOOL)afterUpdates fromView:(UIView *)view {
    if (![self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        return [self snapshotImageFromView:view];
    }
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0);
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:afterUpdates];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}


@end
