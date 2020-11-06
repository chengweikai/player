//
//  BaseTableViewController.h
//  WeiKo
//
//  Created by Vic on 2020/11/2.
//  Copyright © 2020 codeWalker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+WebCache.h"
#import "UITextView+Placeholder.h"
#import "UIColor+Util.h"
NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewController : UITableViewController

/**
*  @brief 是否显示导航栏  默认显示 yes:隐藏  ； no:显示
*
*  @return bool
*/
- (BOOL)isHideNavigationBar;

/**
 *  @brief 是否显示tableViewHeaderView的高度 默认显示
 *
 *  @return bool
 */
- (BOOL)isShowTableheaderHeight;

/**
 *  设置导航栏左边按钮
 */
- (void)setupLeftBarItem;
/**
 *  设置导航栏右边按钮
 */
- (void)setupRightBarItem;
/**
 *  @brief 导航栏左边按钮点击事件
 *
 *  @param sender 按钮
 */
- (void)leftBarItemPress:(id)sender;
/**
 *  @brief 导航栏右边按钮点击事件
 *
 *  @param sender 按钮
 */
- (void)rightBarItemPress:(id)sender;

/**
 *  @brief 返回左边按钮图片
 *
 *  @return 图片名字
 */
- (NSString *)leftBarItemIcon;

/**
 *  @brief 返回右边按钮图片
 *
 *  @return 图片名字
 */
- (NSString *)rightBarItemIcon;

/**
 *  @brief 返回左边按钮标题
 *
 *  @return title
 */
- (NSString *)leftBarTitle;

/**
 *  @brief 返回右边按钮标题
 *
 *  @return title
 */
- (NSString *)rightBarTitle;
@end

NS_ASSUME_NONNULL_END
