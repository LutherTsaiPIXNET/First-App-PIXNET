//
//  DetailViewController.m
//  First App
//
//  Created by luthertsai on 2017/4/27.
//  Copyright © 2017年 luthertsai. All rights reserved.
//

#import "DetailViewController.h"
#import "ItemDetailTableViewCell.h"


@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id model = _item;
    // 获取cell高度
    CGFloat height = [self.tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[ItemDetailTableViewCell class]  contentViewWidth:[self cellContentViewWith]];
    return height;
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
