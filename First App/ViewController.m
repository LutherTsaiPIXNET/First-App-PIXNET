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
    NSInteger _pageCount;
    NSInteger _currentPage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _rowCount = (long)0;
    self.tableView.allowsSelection = NO;
    
    //Init Data
    _itemArray = [[NSMutableArray alloc] init];
    _currentPage = 1;
    _pageCount = 1;
    _rowCount = 0;
    
    //ASYNCHRONIZE - NETWORK DOWNLOAD JSON
    [self downloadDataWithPage:_currentPage];
    
    // 下拉刷新
    self.tableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        _itemArray = [[NSMutableArray alloc] init];
        _rowCount = 0;
        _currentPage = 1;
        _pageCount = 1;
        [self downloadDataWithPage:_currentPage];
    }];
    
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    
    // 上拉刷新
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        if (_currentPage < _pageCount) {
            _currentPage++;
            [self downloadDataWithPage:_currentPage];
        } else {
            [self.tableView.mj_footer endRefreshing];
        }
    }];


}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 Call the Function to download data from the API
 */
- (void)downloadDataWithPage :(NSInteger)page{
    
    NSString *pageStr = [NSString stringWithFormat:@"%ld", (long)page];
    NSString *urlStr = [[@"https://styleme-app-api.events.pixnet.net/goods/list?type=hot&page=" stringByAppendingString:pageStr] stringByAppendingString:@"&per_page=20"];
    NSURL *url = [NSURL URLWithString:urlStr];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        //NSLog(@"JSON: %@", responseObject);
        NSInteger pageItemCount = [[responseObject objectForKey:@"hot"] count];
        _rowCount += pageItemCount;
        _pageCount = [[responseObject objectForKey:@"total_page"] integerValue];
        //Abstract JSON to Model
        for (int i = 0; i < pageItemCount; i++) {
            Item *item = [Item yy_modelWithJSON:[[responseObject objectForKey:@"hot"] objectAtIndex:i]];
            [_itemArray addObject:item];
        }
        NSLog(@"Current: %ld", _currentPage);
        //Reload Data on Table
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
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

- (CGFloat)cellContentViewWith {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7横屏
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}
@end
