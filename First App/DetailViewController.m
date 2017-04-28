//
//  DetailViewController.m
//  First App
//
//  Created by luthertsai on 2017/4/27.
//  Copyright © 2017年 luthertsai. All rights reserved.
//

#import "DetailViewController.h"
#import "ItemDetailTableViewCell.h"
#import "ItemSummaryTableViewCell.h"
#import "ItemDetailHeaderView.h"
#import "Global.h"
#import "APIReference.h"



typedef NS_ENUM(NSInteger, DetailType) {
    BasicInfo,
    Summary,
    TestUser,
    Rating
};

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self downloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)downloadData {
    //Initilize API URL
    NSURL *url = [NSURL URLWithString:[APIReference getJSONDataWithItemID:_item.itemID withToken:@""]];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case BasicInfo:
        {
            return 1;
        }
            break;
        case Summary:
        {
            return 1;
        }
            break;
        case TestUser:
        {
            return 0;
        }
            break;
        case Rating:
        {
            return 0;
        }
            break;
        default:
            return 0;
            break;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case Summary:
        {
            ItemDetailHeaderView *header = [ItemDetailHeaderView new];
            header.sd_layout
            .heightIs(30)
            .widthIs([self cellContentViewWith]);
            return header;
        }
            break;
        default:
        {
            return nil;
        }
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    switch (section) {
        case Summary:
        {
            return 30;
        }
            break;
        default:
        {
            return 0;
        }
            break;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case BasicInfo:
        {
            Item *object = _item;
            NSString *ID = object.itemID;
            ItemDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
            if (!cell) {
                cell = [[ItemDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
            }
            cell.model = object;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
            break;
        case Summary:
        {
            Item *object = _item;
            NSString *ID = object.itemID;
            ItemSummaryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
            if (!cell) {
                cell = [[ItemSummaryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
            }
            cell.model = object;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.contentView.backgroundColor = COLOR_SUPERLIGHT_GREY;
            return cell;
        }
            break;
        default:
        {
            UITableViewCell *cell = [UITableViewCell new];
            return cell;
        }
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case BasicInfo:
        {
            id model = _item;
            // 获取cell高度
            CGFloat height = [self.tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[ItemDetailTableViewCell class]  contentViewWidth:[self cellContentViewWith]];
            return height;
        }
            break;
        case Summary:
        {
            id model = _item;
            // 获取cell高度
            CGFloat height = [self.tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[ItemSummaryTableViewCell class]  contentViewWidth:[self cellContentViewWith]];
            return height;
        }
            break;
        default:
        {
            return 0;
        }
            break;
    }
}

- (CGFloat)cellContentViewWith {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7横屏
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}

- (void)setItem:(Item *)item {
    _item = item;
}

@end
