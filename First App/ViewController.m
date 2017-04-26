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
#import "UIView+SDAutoLayout.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSMutableArray *_itemArray;
    NSInteger _pageCount;
    NSInteger _currentPage;
    NSString *_currentType;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Add Segment Controller
    [self addSegmentController];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.allowsSelection = NO;
    _tableView.tableHeaderView = nil;
    
    //Init Data
    [self initializeData];
    _currentType = @"hot";
    
    //ASYNCHRONIZE - NETWORK DOWNLOAD JSON
    [self downloadDataWithType:_currentType WithPage:_currentPage];
    
    //Set Header Refresh Control
    [self setTableviewHeaderControl];
    
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    _tableView.mj_header.automaticallyChangeAlpha = YES;
    
    //Set Footer Refresh Control
    [self setTableviewFooterControl];
}

- (void)viewWillAppear:(BOOL)animated {
    [_tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 Add Segment Controller with HMSegmentedControll
 */
- (void)addSegmentController {
    CGFloat viewWidth = CGRectGetWidth(self.view.frame);

    HMSegmentedControl *segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"熱門商品", @"最新商品"]];
    segmentedControl.frame = CGRectMake(0, 0, viewWidth, 60);
    [segmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    [_tabBarView addSubview:segmentedControl];
}

- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld (via UIControlEventValueChanged)", (long)segmentedControl.selectedSegmentIndex);
    switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            _currentType = @"hot";
            break;
        case 1:
            _currentType = @"latest";
            break;
        default:
            _currentType = @"hot";
            break;
    }
    [self initializeData];
    [self downloadDataWithType:_currentType WithPage:_currentPage];
}

- (void)uisegmentedControlChangedValue:(UISegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld", (long)segmentedControl.selectedSegmentIndex);
}

/**
 初始化ViewController所需變數與資料
 */
- (void)initializeData {
    _itemArray = [[NSMutableArray alloc] init];
    _rowCount = 0;
    _currentPage = 1;
    _pageCount = 1;
}

/**
 設定下拉刷新控制
 */
- (void)setTableviewHeaderControl {
    // 下拉刷新
    _tableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self initializeData];
        [self downloadDataWithType:_currentType WithPage:_currentPage];
    }];

}

/**
 設定上拉刷新控制
 */
- (void)setTableviewFooterControl {
    // 上拉刷新
    _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        if (_currentPage < _pageCount) {
            _currentPage++;
            [self downloadDataWithType:_currentType WithPage:_currentPage];
        } else {
            [_tableView.mj_footer endRefreshing];
        }
    }];
}

/**
 Call the Function to download data from the API
 */
- (void)downloadDataWithType :(NSString *)type WithPage :(NSInteger)page {
    NSString *baseAPI = @"https://styleme-app-api.events.pixnet.net/goods/list?";
    NSString *typeStr = [NSString stringWithFormat:@"type=%@&", type];
    NSString *pageStr = [NSString stringWithFormat:@"page=%ld&", (long)page];
    NSString *amountStr = [NSString stringWithFormat:@"per_page=%d&", 20];
    NSString *urlStr = [[[baseAPI stringByAppendingString:typeStr] stringByAppendingString:pageStr] stringByAppendingString:amountStr];
    NSURL *url = [NSURL URLWithString:urlStr];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        //NSLog(@"JSON: %@", responseObject);
        NSInteger pageItemCount = [[responseObject objectForKey:type] count];
        _rowCount += pageItemCount;
        _pageCount = [[responseObject objectForKey:@"total_page"] integerValue];
        //Abstract JSON to Model
        for (int i = 0; i < pageItemCount; i++) {
            Item *item = [Item yy_modelWithJSON:[[responseObject objectForKey:type] objectAtIndex:i]];
            [_itemArray addObject:item];
        }
        
        //Reload Data on Table
        [_tableView reloadData];
        //END Refreshing
        [_tableView.mj_header endRefreshing];
        [_tableView.mj_footer endRefreshing];
        
        //Handle Page Control
        if (_currentPage == _pageCount) {
            _tableView.mj_footer = nil;
        } else {
            [self setTableviewFooterControl];
        }
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
    UITableViewCell *cell = [self tableView:_tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.width;
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
