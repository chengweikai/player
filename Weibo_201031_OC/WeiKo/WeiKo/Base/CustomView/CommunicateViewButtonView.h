//
//  CommunicateViewButtonView.h
//  WeiKo
//
//  Created by Vic on 2020/11/3.
//  Copyright © 2020 codeWalker. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
    转发、评论、点赞 的View
 */
NS_ASSUME_NONNULL_BEGIN

@interface CommunicateViewButtonView : UIView
//转发
@property(nonatomic,strong) UIButton * repoBtn;
//评论
@property(nonatomic,strong) UIButton * commentBtn;
//点赞
@property(nonatomic,strong) UIButton * likeBtn;

//foldingcommentView


@end

NS_ASSUME_NONNULL_END
