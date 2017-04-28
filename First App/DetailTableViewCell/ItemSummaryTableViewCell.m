//
//  ItemSummaryTableViewCell.m
//  First App
//
//  Created by luthertsai on 2017/4/28.
//  Copyright © 2017年 luthertsai. All rights reserved.
//

#import "ItemSummaryTableViewCell.h"
#import "UIView+SDAutoLayout.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "UIImageView+WebCache.h"
#import "Global.h"

@implementation ItemSummaryTableViewCell
{
    UILabel *_itemSummary;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //商品[品牌]UI設定
        UILabel *itemSummary = [UILabel new];
        itemSummary.numberOfLines = 1;
        itemSummary.minimumScaleFactor = 0.2;
        itemSummary.adjustsFontSizeToFitWidth = YES;
        [itemSummary setFont:[UIFont systemFontOfSize:13]];
        [itemSummary setTextColor:COLOR_WARM_GREY];
        _itemSummary = itemSummary;
        
        //Add to Content View
        [self.contentView sd_addSubviews:@[_itemSummary]];
        
        //SDAutoLayout Setting
        _itemSummary.sd_layout
        .topSpaceToView(self.contentView, 10)
        .rightSpaceToView(self.contentView, 20)
        .leftSpaceToView(self.contentView, 20)
        .autoHeightRatio(0);
    }
    return self;
}

- (void)setModel:(Item *)model {
    _model = model;
    _itemSummary.text = model.summary;
    [_itemSummary updateLayout];
    
    [self setupAutoHeightWithBottomView:_itemSummary bottomMargin:10];
}

@end
