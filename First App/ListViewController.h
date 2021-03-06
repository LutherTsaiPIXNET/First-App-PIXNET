//
//  ListViewController.h
//  First App
//
//  Created by luthertsai on 2017/4/24.
//  Copyright © 2017年 luthertsai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>
#import <SDAutoLayout/SDAutoLayout.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <YYModel/YYModel.h>
#import <MJRefresh/MJRefresh.h>
#import <HMSegmentedControl/HMSegmentedControl.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <SDAutoLayout/SDAutoLayout.h>


@interface ListViewController : UIViewController  <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *tabBarView;
@property (weak, nonatomic) IBOutlet UITableView *tableView01;
@property (weak, nonatomic) IBOutlet UITableView *tableView02;
@end

