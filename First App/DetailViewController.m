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
#import "RatingOptionTableViewCell.h"
#import "RatingStarTableViewCell.h"
#import "FullRatingTableViewCell.h"
#import "Global.h"
#import "APIReference.h"



typedef NS_ENUM(NSInteger, DetailType) {
    BasicInfo,
    Summary,
    EmptyView01,
    Rating,
    FullRating,
    EmptyView02,
    ExperienceQuestionArticle,
    MoreArticle
};

typedef NS_ENUM(NSInteger, TriggerState) {
    Close,
    Expand
};

@interface DetailViewController ()

@end

@implementation DetailViewController
{
    TriggerState summaryTriggerState;
    TriggerState fullRatingTriggerState;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    summaryTriggerState = Close;
    fullRatingTriggerState = Close;
    
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
        //NSLog(@"%@", responseObject);
        _item = [Item yy_modelWithJSON:[responseObject objectForKey:@"content"]];
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)touchSummaryControl: (UIButton *)sender {
    switch (sender.tag) {
        case Summary:
        {
            summaryTriggerState = !summaryTriggerState;
            [self.tableView reloadData];
        }
        break;
        case FullRating:
        {
            fullRatingTriggerState = !fullRatingTriggerState;
            [self.tableView reloadData];
        }
            break;
        default:
        {
        }
            break;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 7;
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
            return summaryTriggerState;
        }
            break;
        case EmptyView01:
        case EmptyView02:
        {
            return 1;
        }
            break;
        case Rating:
        {
            return 3;
        }
            break;
        case FullRating:
        {
            return fullRatingTriggerState;
        }
            break;
        case ExperienceQuestionArticle:
        {
            return 1;
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
            header.headerTitleText = @"詳細介紹";
            header.sd_layout
            .heightIs(30)
            .widthIs([self cellContentViewWith]);
            header.headerBtn.tag = Summary;
            [header.headerBtn addTarget:self
                               action:@selector(touchSummaryControl:)
                     forControlEvents:UIControlEventTouchUpInside];
            if (summaryTriggerState == Close) {
                [header.headerBtn setSelected:NO];
                
            } else {
                [header.headerBtn setSelected:YES];
            }

            return header;
        }
            break;
        case FullRating:
        {
            ItemDetailHeaderView *header = [ItemDetailHeaderView new];
            header.headerTitleText = @"看完整";
            header.sd_layout
            .heightIs(30)
            .widthIs([self cellContentViewWith]);
            header.headerBtn.tag = FullRating;
            [header.headerBtn addTarget:self
                                 action:@selector(touchSummaryControl:)
                       forControlEvents:UIControlEventTouchUpInside];
            if (fullRatingTriggerState == Close) {
                [header.headerBtn setSelected:NO];
                
            } else {
                [header.headerBtn setSelected:YES];
            }
            
            return header;
        }
            break;
        case ExperienceQuestionArticle:
        {
            CGFloat viewWidth = CGRectGetWidth(self.view.frame);
            NSString *segmentTitleExperience = [NSString stringWithFormat:@"%@\n心得", @"0"];
            NSString *segmentTitleQuestion = [NSString stringWithFormat:@"%@\n發問", @"0"];
            HMSegmentedControl *segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[segmentTitleExperience, segmentTitleQuestion]];
            segmentedControl.frame = CGRectMake(0, 0, viewWidth, 60);
            [segmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
            return segmentedControl;
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
        case FullRating:
        {
            return 30;
        }
            break;
        case ExperienceQuestionArticle:
        {
            return 60;
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
            NSString *ID = [NSString stringWithFormat:@"B%@", object.itemID];
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
            NSString *ID = [NSString stringWithFormat:@"S%@", object.itemID];
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
        case EmptyView01:
        case EmptyView02:
        {
            UITableViewCell *cell = [UITableViewCell new];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.contentView.backgroundColor = COLOR_WHITE_THREE;
            return cell;
        }
            break;
        case Rating:
        {
            Item *object = _item;
            NSString *ID = [NSString stringWithFormat:@"R%@", object.itemID];
            switch (indexPath.row) {
                case 0:
                {
                    /* *** NORMAL LOGIC VERSION ***
                    if ([_item.ratingOverview floatValue] > 0) {
                        RatingStarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
                        if (!cell) {
                            cell = [[RatingStarTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
                        }
                        cell.model = object;
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                        cell.optionTitle = @"綜合評分";
                        return cell;
                    } else {
                        RatingOptionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
                        if (!cell) {
                            cell = [[RatingOptionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
                        }
                        cell.model = object;
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                        cell.optionTitle = @"綜合評分";
                        cell.optionBtnTitle = @"我要評分";
                        return cell;
                    }
                     */
                    
                    //For DEMO
                    RatingStarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
                    if (!cell) {
                        cell = [[RatingStarTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
                    }
                    cell.model = object;
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    cell.optionTitle = @"綜合評分";
                    return cell;
                }
                    break;
                case 1:
                {
                    RatingOptionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
                    if (!cell) {
                        cell = [[RatingOptionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
                    }
                    cell.model = object;
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    cell.optionTitle = @"與我相同條件評分";
                    cell.optionBtnTitle = @"我想看";
                    return cell;
                }
                    break;
                case 2:
                {
                    RatingOptionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
                    if (!cell) {
                        cell = [[RatingOptionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
                    }
                    cell.model = object;
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;

                    cell.optionTitle = @"我的評分";
                    cell.optionBtnTitle = @"我要評分";
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
            break;
        case FullRating:
        {
            Item *object = _item;
            NSString *ID = [NSString stringWithFormat:@"FR%@", object.itemID];
            FullRatingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
            if (!cell) {
                cell = [[FullRatingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
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
        case EmptyView01:
        case EmptyView02:
        {
            return 6;
        }
            break;
        case Rating:
        {
            id model = _item;
            // 获取cell高度
            CGFloat height = [self.tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[RatingOptionTableViewCell class]  contentViewWidth:[self cellContentViewWith]];
            return height;
        }
            break;
        case FullRating:
        {
            id model = _item;
            // 获取cell高度
            CGFloat height = [self.tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[FullRatingTableViewCell class]  contentViewWidth:[self cellContentViewWith]];
            return height;
            
        }
            break;
        case ExperienceQuestionArticle:
        {
            return 100;
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

- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld (via UIControlEventValueChanged)", (long)segmentedControl.selectedSegmentIndex);
    
}

- (void)uisegmentedControlChangedValue:(UISegmentedControl *)segmentedControl {
    //NSLog(@"Selected index %ld", (long)segmentedControl.selectedSegmentIndex);
}

- (void)setItem:(Item *)item {
    _item = item;
}

@end
