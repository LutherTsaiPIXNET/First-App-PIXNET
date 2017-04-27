//
//  ViewController.m
//  First App
//
//  Created by luthertsai on 2017/4/24.
//  Copyright © 2017年 luthertsai. All rights reserved.
//

#import "ViewController.h"
#import "ItemTableViewCell.h"
#import "Item.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "UIView+SDAutoLayout.h"

typedef NS_ENUM(NSInteger, CategoryType) {
    HotType,
    LatestType,
};

@interface ViewController ()

@property (nonatomic, assign) CategoryType categoryType;

@end

@implementation ViewController
{
    NSMutableArray *_itemArrayHot;
    NSMutableArray *_itemArrayLatest;
    NSInteger _rowCountHot;
    NSInteger _rowCountLatest;
    NSInteger _pageCountHot;
    NSInteger _pageCountLatest;
    NSInteger _currentPageHot;
    NSInteger _currentPageLatest;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Add Segment Controller
    [self addSegmentController];
    
    _tableView01.dataSource = self;
    _tableView01.delegate = self;
    _tableView01.allowsSelection = NO;
    _tableView01.tableHeaderView = nil;
    
    _tableView02.dataSource = self;
    _tableView02.delegate = self;
    _tableView02.allowsSelection = NO;
    _tableView02.tableHeaderView = nil;
    _tableView02.hidden = YES;
    
    //Init Data
    [self initializeDataWithType:HotType];
    [self initializeDataWithType:LatestType];
    
    //ASYNCHRONIZE - NETWORK DOWNLOAD JSON
    [self downloadDataWithType:HotType WithPage:_currentPageHot];
    [self downloadDataWithType:LatestType WithPage:_currentPageLatest];
    
    //Set Header Refresh Control
    [self setTableviewHeaderControl];
    
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    _tableView01.mj_header.automaticallyChangeAlpha = YES;
    _tableView02.mj_header.automaticallyChangeAlpha = YES;
    
    //Set Footer Refresh Control
    [self setTableviewFooterControlWithType:HotType];
    [self setTableviewFooterControlWithType:LatestType];
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
    //NSLog(@"Selected index %ld (via UIControlEventValueChanged)", (long)segmentedControl.selectedSegmentIndex);
    switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            _tableView01.hidden = NO;
            _tableView02.hidden = YES;
            break;
        case 1:
            _tableView01.hidden = YES;
            _tableView02.hidden = NO;
            break;
        default:
            _tableView01.hidden = NO;
            _tableView02.hidden = YES;
            break;
    }
}

- (void)uisegmentedControlChangedValue:(UISegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld", (long)segmentedControl.selectedSegmentIndex);
}

/**
 初始化所需變數與資料
 */
- (void)initializeDataWithType:(CategoryType)type {
    
    if (type == HotType) {
        _itemArrayHot = [[NSMutableArray alloc] init];
        _rowCountHot = 0;
        _currentPageHot = 1;
        _pageCountHot = 1;
    } else if (type == LatestType){
        _itemArrayLatest = [[NSMutableArray alloc] init];
        _rowCountLatest = 0;
        _currentPageLatest = 1;
        _pageCountLatest = 1;
    }
}

/**
 設定下拉刷新控制
 */
- (void)setTableviewHeaderControl {
    // 下拉刷新
    _tableView01.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self initializeDataWithType:HotType];
        [self downloadDataWithType:HotType WithPage:_currentPageHot];
    }];
    
    _tableView02.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self initializeDataWithType:LatestType];
        [self downloadDataWithType:LatestType WithPage:_currentPageLatest];
    }];

}

/**
 設定上拉刷新控制
 */
- (void)setTableviewFooterControlWithType:(CategoryType)type {
    // 上拉刷新
    if(type == HotType) {
        _tableView01.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            if (_currentPageHot < _pageCountHot) {
                _currentPageHot++;
                [self downloadDataWithType:type WithPage:_currentPageHot];
            } else {
                [_tableView01.mj_footer endRefreshing];
            }
        }];
    } else if (type == LatestType) {
        _tableView02.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            if (_currentPageLatest < _pageCountLatest) {
                _currentPageLatest++;
                [self downloadDataWithType:type WithPage:_currentPageLatest];
            } else {
                [_tableView02.mj_footer endRefreshing];
            }
        }];
    }
}

- (NSString *)getStringWithType:(CategoryType)type {
    switch (type) {
        case HotType:
            return @"hot";
            break;
        case LatestType:
            return @"latest";
            break;
        default:
            return @"";
            break;
    }
}

/**
 Call the Function to download data from the API
 */
- (void)downloadDataWithType :(CategoryType)type WithPage :(NSInteger)page {
    //Initilize API URL
    NSString *baseAPI = @"https://styleme-app-api.events.pixnet.net/goods/list?";
    NSString *typeStr = [NSString stringWithFormat:@"type=%@&", [self getStringWithType:type]];
    NSString *pageStr = [NSString stringWithFormat:@"page=%ld&", (long)page];
    NSString *amountStr = [NSString stringWithFormat:@"per_page=%d&", 20];
    NSString *urlStr = [[[baseAPI stringByAppendingString:typeStr] stringByAppendingString:pageStr] stringByAppendingString:amountStr];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    //Start Download JSON Here - ASYNCHRONIZE
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        NSInteger pageItemCount = [[responseObject objectForKey:[self getStringWithType:type]] count];
        
        if (type == HotType) {
            _rowCountHot += pageItemCount;
            _pageCountHot = [[responseObject objectForKey:@"total_page"] integerValue];
            //Abstract JSON to Model
            for (int i = 0; i < pageItemCount; i++) {
                Item *item = [Item yy_modelWithJSON:[[responseObject objectForKey:[self getStringWithType:type]] objectAtIndex:i]];
                [_itemArrayHot addObject:item];
            }
            
            //Reload Data on Table
            [_tableView01 reloadData];
            
            //END Refreshing
            [_tableView01.mj_header endRefreshing];
            [_tableView01.mj_footer endRefreshing];
            
            //Handle END Page Control
            if (_currentPageHot == _pageCountHot) {
                _tableView01.mj_footer = nil;
            } else {
                [self setTableviewFooterControlWithType:type];
            }
        } else if (type == LatestType) {
            _rowCountLatest += pageItemCount;
            _pageCountLatest = [[responseObject objectForKey:@"total_page"] integerValue];
            //Abstract JSON to Model
            for (int i = 0; i < pageItemCount; i++) {
                Item *item = [Item yy_modelWithJSON:[[responseObject objectForKey:[self getStringWithType:type]] objectAtIndex:i]];
                [_itemArrayLatest addObject:item];
            }
            
            //Reload Data on Table
            [_tableView02 reloadData];
            
            //END Refreshing
            [_tableView02.mj_header endRefreshing];
            [_tableView02.mj_footer endRefreshing];
            
            //Handle END Page Control
            if (_currentPageLatest == _pageCountLatest) {
                _tableView02.mj_footer = nil;
            } else {
                [self setTableviewFooterControlWithType:type];
            }
        }
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch (tableView.tag) {
        case 0:
            return _rowCountHot;
            break;
        case 1:
            return _rowCountLatest;
            break;
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Item *object = [Item new];
    switch (tableView.tag) {
        case 0:
            object = [_itemArrayHot objectAtIndex:indexPath.row];
            break;
        case 1:
            object = [_itemArrayLatest objectAtIndex:indexPath.row];
            break;
        default:
            break;
    }
    NSString *ID = object.itemID;
    ItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.model = object;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (tableView.tag == 0) {
        id model = _itemArrayHot[indexPath.row];
        // 获取cell高度
        CGFloat height = [_tableView01 cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[ItemTableViewCell class]  contentViewWidth:[self cellContentViewWith]];
        return height;
    } else if (tableView.tag == 1) {
        id model = _itemArrayLatest[indexPath.row];
        // 获取cell高度
        return [_tableView02 cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[ItemTableViewCell class]  contentViewWidth:[self cellContentViewWith]];
    } else {
        return 0;
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
@end
