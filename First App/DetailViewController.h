//
//  DetailViewController.h
//  First App
//
//  Created by luthertsai on 2017/4/27.
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

#import "Item.h"

@interface DetailViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) Item *item;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *shareBtn;

@end
