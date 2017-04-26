//
//  ViewController.h
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

@interface ViewController : UITableViewController  <UITableViewDelegate, UITableViewDataSource>


/**Row of Table Data*/
@property (nonatomic, assign) NSInteger rowCount;

@end

