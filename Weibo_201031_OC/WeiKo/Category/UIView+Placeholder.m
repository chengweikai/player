//
//  UIView+Placeholder.m
//  Material
//
//  Created by Yigol on 16/10/9.
//  Copyright © 2016年 Injoinow. All rights reserved.
//

#import "UIView+Placeholder.h"

static CGFloat const kDefaultTag = 7654;
typedef NS_ENUM(NSUInteger, ContentShowType) {
    ContentShowTypeNoData = 0,  //无数据
    ContentShowTypeNoNetwork    //无网络
};

@implementation UIView (Placeholder)


- (UIView *)placeholderContentViewWithType:(ContentShowType)type {
    UIView *contentView = [self viewWithTag:kDefaultTag];
    
    if (!contentView) {
        UIImage *image;
        NSString *descString;
        if (type == ContentShowTypeNoData) {
            image = [UIImage imageNamed:@"picture_no_content"];
            descString = @"亲，还没有任何内容哦~";
        } else {
            image = [UIImage imageNamed:@"picture_no_network"];
            descString = @"当前网络不给力，请检查你的网络设置~";
        }
        // ContentView
        contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 180)];
        contentView.tag = kDefaultTag;
        // ImageView
        
        UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        [contentView addSubview:imgView];
        imgView.frame = CGRectMake(0, 0, self.bounds.size.width, 125);
        
        // Label
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imgView.frame), self.bounds.size.width, 45)];
        label.text = descString;
        label.font = [UIFont systemFontOfSize:15];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor lightGrayColor];
        label.numberOfLines = 0;
        [contentView addSubview:label];
        [self addSubview:contentView];
        [self sendSubviewToBack:contentView];
        
        contentView.hidden = YES;
        
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(self.bounds.size.width, 180));
        }];
        
        //        contentView.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds)-0);
        // debug
        //contentView.backgroundColor = [UIColor yellowColor];
    } else {
        
        for (UIView *vv in contentView.subviews) {
            if ([vv isKindOfClass:[UIImageView class]]) {
                if (type == ContentShowTypeNoData) {
                    ((UIImageView *)vv).image = [UIImage imageNamed:@"picture_no_content"];
                } else {
                    ((UIImageView *)vv).image = [UIImage imageNamed:@"picture_no_network"];
                }
            } else if ([vv isKindOfClass:[UILabel class]]) {
                if (type == ContentShowTypeNoData) {
                    ((UILabel *)vv).text = @"亲，还没有任何内容哦~";
                } else {
                    ((UILabel *)vv).text = @"当前网络不给力，请检查你的网络设置~";
                }
            }
        }
        
    }
    return contentView;
}

- (void)showEmptyData {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIView *placeholderView = [self placeholderContentViewWithType:ContentShowTypeNoData];
        placeholderView.hidden = NO;
    });
}

- (void)showNoNetwork {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIView *placeholderView = [self placeholderContentViewWithType:ContentShowTypeNoNetwork];
        placeholderView.hidden = NO;
    });
}

- (void)hidePlaceholderView {
    UIView *placeholderView = [self viewWithTag:kDefaultTag];
    placeholderView.hidden = YES;
}


@end
