//
//  BaseTableViewController.m
//  WeiKo
//
//  Created by Vic on 2020/11/2.
//  Copyright © 2020 codeWalker. All rights reserved.
//

#import "BaseTableViewController.h"
//sdsfs
static const CGFloat kBarButtonItemWidth = 20;
static const CGFloat kBarButtonItemHeight = 20;

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureCustomSetting];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.navigationController) {
        [self.navigationController setNavigationBarHidden:[self isHideNavigationBar] animated:YES];
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

#pragma mark - ************ function

- (void)configureCustomSetting {
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.backgroundColor = [UIColor colorWithHexString:@"f5f5f5"];
    
    self.tableView.separatorColor = [UIColor colorWithHexString:@"e5e5e5"];
    // 设置返回 BarItem
    if (self.navigationController.viewControllers.count > 1) {
        [self setupLeftBarItem];
    }
    

    // 设置tableviewHeaderview的高度
    if (![self isShowTableheaderHeight]) {
        UIView *tHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.1)];
        self.tableView.tableHeaderView = tHeaderView;
    }
}

- (void)setupLeftBarItem {
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, kBarButtonItemWidth, kBarButtonItemHeight);
    [leftBtn addTarget:self action:@selector(leftBarItemPress:) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setImage:[UIImage imageNamed:[self leftBarItemIcon]] forState:UIControlStateNormal];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = barItem;
}

- (void)setupRightBarItem {
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 25, 25);
    [rightBtn addTarget:self action:@selector(rightBarItemPress:) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setImage:[UIImage imageNamed:[self rightBarItemIcon]] forState:UIControlStateNormal];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = barItem;
}

- (NSString *)leftBarItemIcon {
    return @"icon_nav_return";
}



- (NSString *)rightBarItemIcon {
    return @"icon_nav_return";
}

- (NSString *)leftBarTitle {
    return @"";
}

- (NSString *)rightBarTitle {
    return @"";
}

- (BOOL)isShowTableheaderHeight {
    return YES;
}

- (BOOL)isHideNavigationBar {
    return NO;
}

#pragma mark - ************ Action
- (void)leftBarItemPress:(id)sender {
    if (self.navigationController.viewControllers.count > 1) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
- (void)rightBarItemPress:(id)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source
#if 0
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#endif
@end
