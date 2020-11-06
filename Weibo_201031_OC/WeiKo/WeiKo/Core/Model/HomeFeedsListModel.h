//
//  HomeFeedsListModel.h
//  WeiKo
//
//  Created by Vic on 2020/11/2.
//  Copyright © 2020 codeWalker. All rights reserved.
//

#import "BaseObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeFeedsListModel : BaseObject
//头像
@property(nonatomic,copy)NSString * avatar;
//name
@property(nonatomic,copy)NSString * name;
//内容
@property(nonatomic,copy)NSString * content;

//内容类型：纯文本类型、分享文章类型、图文混排类型、视频类型、转发类型
@property(nonatomic,copy)NSString * contentType;

@end

NS_ASSUME_NONNULL_END
