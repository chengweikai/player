//
//  NSNull+NullExtension.m
//  Racative coacoa初探一
//
//  Created by 樊小聪 on 16/6/15.
//  Copyright © 2016年 樊小聪. All rights reserved.
//

#import "NSNull+NullExtension.h"
#import <objc/runtime.h>

#define NSNullObjects @[@"", @0, @{}, @[]]

@implementation NSNull (NullExtension)

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *sig = [super methodSignatureForSelector:aSelector];
    
    if (!sig)
    {
        for (NSObject *obj in NSNullObjects)
        {
            sig = [obj methodSignatureForSelector:aSelector];
            
            if (sig)
            {
                return sig;
            }
        }
    }
    
    return sig;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    for (NSObject *obj in NSNullObjects)
    {
        if ([obj respondsToSelector:[anInvocation selector]])
        {
            [anInvocation invokeWithTarget:obj];
            
            return;
        }
    }
    
    [self doesNotRecognizeSelector:[anInvocation selector]];
}

@end




















