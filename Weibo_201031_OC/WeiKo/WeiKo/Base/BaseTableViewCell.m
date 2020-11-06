//
//  BaseTableViewCell.m
//  WeiKo
//
//  Created by Vic on 2020/11/2.
//  Copyright © 2020 codeWalker. All rights reserved.
//

#import "BaseTableViewCell.h"
static const CGFloat AVATAR_RADIUS = 40.0f ;


@implementation BaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    [self configureCellMainProperty];
}
#pragma mark - configureCell
//-(void)configureCellMainProperty
//{
//
//
//}
//- (UIImageView *)avatar{
//    if (!_avatar) {
//        _avatar = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, AVATAR_RADIUS, AVATAR_RADIUS)];
//
//
//    }
//    return _avatar;
//}
//- (NSString *)name{
//
//    return nil;
//}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
