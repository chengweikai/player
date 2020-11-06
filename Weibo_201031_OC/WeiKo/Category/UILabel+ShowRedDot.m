//
//  UILabel+ShowRedDot.m
//  OA
//
//  Created by 樊小聪 on 16/7/4.
//  Copyright © 2016年 Injoinow. All rights reserved.
//

#import "UILabel+ShowRedDot.h"
#import "NSAttributedString+Extension.h"

@implementation UILabel (ShowRedDot)

/**
 *  是否显示小红点
 *
 *  @param unReadCount 未读数量
 */
- (void)showRedDotWithUnReadCount:(NSString *)unReadCount
{
    if (unReadCount.integerValue)    // 有未读数，显示小红点
    {
        self.attributedText = [NSMutableAttributedString attributedStringWithText:self.text fontSize:self.font.pointSize textColor:self.textColor imageName:@"label_unread_s" imgSize:CGSizeMake(6, 6) position:CGPointMake(0, 8)];
    }
    else        // 没有未读数，隐藏小红点
    {
        self.attributedText = [NSMutableAttributedString attributedStringWithText:self.text fontSize:self.font.pointSize textColor:self.textColor imageName:@"label_unread_ssss" imgSize:CGSizeMake(6, 6) position:CGPointMake(0, 8)];
    }
}



@end
