//
//  UITextView+LimitLength.m
//  Material
//
//  Created by Yigol on 2017/5/16.
//  Copyright © 2017年 Injoinow. All rights reserved.
//

#import "UITextView+LimitLength.h"

@implementation UITextView (LimitLength)


- (void)setMaxLength:(NSUInteger)mLength {
    
    if (self.text.length > mLength && self.markedTextRange == nil) {
        self.text = [self.text substringToIndex:NSMaxRange([self.text rangeOfComposedCharacterSequenceAtIndex:mLength - 1])];
    }
    
}

@end
