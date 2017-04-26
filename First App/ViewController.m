//
//  ViewController.m
//  First App
//
//  Created by luthertsai on 2017/4/24.
//  Copyright © 2017年 luthertsai. All rights reserved.
//

#import "ViewController.h"
#import "TESTTableViewCell.h"
#import "Item.h"
#import "UITableView+SDAutoTableViewCellHeight.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSMutableArray *_itemArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _rowCount = (long)0;
    self.tableView.allowsSelection = NO;
    
    //Init Data
    _itemArray = [[NSMutableArray alloc] init];
    
    //ASYNCHRONIZE - NETWORK DOWNLOAD JSON
    [self downloadData];

}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)downloadData {
    
    NSURL *URL = [NSURL URLWithString:@"https://styleme-app-api.events.pixnet.net/goods/list?type=hot&page=1&per_page=20"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        //NSLog(@"JSON: %@", responseObject);
        _rowCount = [[responseObject objectForKey:@"hot"] count];
        
        for (int i = 0; i < _rowCount; i++) {
            Item *item = [Item yy_modelWithJSON:[[responseObject objectForKey:@"hot"] objectAtIndex:i]];
            [_itemArray addObject:item];
        }
        [self.tableView reloadData];
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _rowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Item *object = [_itemArray objectAtIndex:indexPath.row];
    NSString *ID = object.itemID;
    TESTTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[TESTTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        if(_rowCount != 0) {
            cell.imgLink = object.thumb_url;
            cell.brand = object.brand;
            cell.name = object.name;
            cell.summary = object.summary;
        }
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // >>>>>>>>>>>>>>>>>>>>> * cell自适应步骤2 * >>>>>>>>>>>>>>>>>>>>>>>>
    /* model 为模型实例， keyPath 为 model 的属性名，通过 kvc 统一赋值接口 */
    return [self cellHeightForIndexPath:indexPath cellContentViewWidth:[UIScreen mainScreen].bounds.size.width];
}

- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7横屏
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}
@end
