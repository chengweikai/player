//
//  NSString+Extension.m
//  OA
//
//  Created by 樊小聪 on 16/7/25.
//  Copyright © 2016年 Injoinow. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)


//金额数字千位符
- (NSString *)separatedDigitStringWithStr
{
    if (self.length == 0) return self;
    
    NSString *str1 = self;
    if (![str1 containsString:@"."])
    {
        str1 = [NSString stringWithFormat:@"%@%@", self, @".00"];
    }

    NSArray *digitsArr = [str1 componentsSeparatedByString:@"."];
    NSString *digitString = digitsArr[0];
    
    NSLog(@"%@",digitString);
    
    if (digitString.length <= 3) {
        NSString *resultStr = [NSString stringWithFormat:@"%@.%@",digitString,digitsArr[1]];
        return resultStr;
    } else {
        NSMutableString *processString = [NSMutableString stringWithString:digitString];
        
        // 1
        NSUInteger location = processString.length;
        NSMutableArray *processArray = [NSMutableArray array];
        while (location >3 ) {
            NSString *temp = [processString substringWithRange:NSMakeRange(location-3, 3)];
            
            NSLog(@"%@",temp);
            location-=3;
            [processArray addObject:temp];
        }
        [processArray addObject:[processString substringWithRange:NSMakeRange(0, location)]];
        
        // 2
        NSMutableArray *resultsArray = [NSMutableArray array];
        int k = 0;
        for (NSString *str in processArray)
        {
            k++;
            NSMutableString *tmp = [NSMutableString stringWithString:str];
            if (str.length > 2 && k < processArray.count )
            {
                [tmp insertString:@"," atIndex:0];
                [resultsArray addObject:tmp];
            } else {
                [resultsArray addObject:tmp];
            }
        }
        //    NSLog(@"resultsArray = %@",resultsArray);
        
        // 3
        NSMutableString *resultString = [NSMutableString string];
        
        for (NSInteger i = resultsArray.count - 1 ; i >= 0; i--)
        {
            NSString *tmp = [resultsArray objectAtIndex:i];
            [resultString appendString:tmp];
        }
        //    NSLog(@"resultStr = %@",resultString);
        NSString *resultStr = [NSString stringWithFormat:@"%@.%@",resultString,digitsArr[1]];
        return resultStr;
    }
}

@end
