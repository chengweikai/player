//
//  UIControl+Event.m
//  KVO
//
//  Created by 樊小聪 on 16/5/9.
//  Copyright © 2016年 樊小聪. All rights reserved.
//

#import "UIControl+Event.h"
#import <objc/runtime.h>

@implementation UIControl (Event)

static char event_key;

/**
 *  给 UIControl 添加事件
 *
 *  @param target        事件目标
 *  @param events        事件类型
 *  @param handle        执行事件的回调
 */
- (void)addTarget:(id)target
           events:(UIControlEvents)events
           handle:(void(^)(UIControl *ctl))handle
{
    if (!target || !events)  return;
    
    objc_setAssociatedObject(self, &event_key, handle, OBJC_ASSOCIATION_COPY);
    
    [self addTarget:self action:@selector(eventAction) forControlEvents:events];
}

/** 事件回调 */
- (void)eventAction
{
    void (^handle)(UIControl *ctl) = objc_getAssociatedObject(self, &event_key);
    
    if (handle)
    {
        handle(self);
    }
}

@end

































