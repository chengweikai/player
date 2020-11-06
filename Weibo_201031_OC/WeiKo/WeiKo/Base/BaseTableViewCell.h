//
//  BaseTableViewCell.h
//  WeiKo
//
//  Created by Vic on 2020/11/2.
//  Copyright © 2020 codeWalker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommunicateViewButtonView.h"
NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, ContentType) {
    TableViewCellContentTypeDefault = 0, // 纯文本
    TableViewCellContentTypePic,       // 图文
    TableViewCellContentTypeVideo,      //视频
    TableViewCellContentTypeRepost,      //转发
    TableViewCellContentTypeOther       //未知格式
    
};
@interface BaseTableViewCell : UITableViewCell
//headImage
@property(nonatomic,strong) UIImageView  * avatar;
//name
@property(nonatomic,strong) UILabel * name;
//类型
@property(nonatomic,assign)ContentType type;

//手机源:来自华为mate40
@property(nonatomic,strong)UILabel * via;
//是否编辑过
@property(nonatomic,strong)UILabel * isEdited;

//评论转发点赞按钮
@property (nonatomic, strong) CommunicateViewButtonView * buttons;

@end

NS_ASSUME_NONNULL_END
