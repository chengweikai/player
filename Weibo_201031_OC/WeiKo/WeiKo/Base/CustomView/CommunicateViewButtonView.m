//
//  CommunicateViewButtonView.m
//  WeiKo
//
//  Created by Vic on 2020/11/3.
//  Copyright © 2020 codeWalker. All rights reserved.
//

#import "CommunicateViewButtonView.h"
#import "Masonry.h"
@implementation CommunicateViewButtonView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initView];
    }
    return self;
}
-(void)initView
{
    self.backgroundColor  = [UIColor blueColor];
    _repoBtn = [[UIButton alloc]init];
    _commentBtn = [[UIButton alloc]init];
    _likeBtn = [[UIButton alloc]init];
    [_repoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(0);
        make.top.equalTo(self).offset(0);
        make.height.equalTo(self);
    
        make.width.equalTo(self.commentBtn);
        
    }];
    
   
    [_commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.repoBtn.mas_right).offset(0);
        make.width.height.equalTo(self.likeBtn);
        make.top.equalTo(self).offset(0);
        
        
    }];
    [_likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.commentBtn.mas_right).offset(0);
        make.height.equalTo(self);
        make.right.equalTo(self).offset(0);
        make.top.equalTo(self).offset(0);
    }];
}
@end
