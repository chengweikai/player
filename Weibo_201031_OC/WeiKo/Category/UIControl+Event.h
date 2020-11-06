//
//  UIControl+Event.h
//  KVO
//
//  Created by 樊小聪 on 16/5/9.
//  Copyright © 2016年 樊小聪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (Event)

/**
 *  给 UIControl 添加事件
 *
 *  @param target        事件目标
 *  @param events        事件类型
 *  @param handle        执行事件的回调
 */
- (void)addTarget:(id)target
           events:(UIControlEvents)events
           handle:(void(^)(UIControl *ctl))handle;

@end
