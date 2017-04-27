//
//  TESTTableViewCell.m
//  First App
//
//  Created by luthertsai on 2017/4/25.
//  Copyright © 2017年 luthertsai. All rights reserved.
//

#import "TESTTableViewCell.h"

#import "UIView+SDAutoLayout.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "UIImageView+WebCache.h"

#define MARGIN 10.0

@implementation TESTTableViewCell
{
    UIImageView *_imgView;
    UILabel *_brandNameLbl;
    UILabel *_itemNameLbl;
    UILabel *_summaryLbl;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIImageView *imgView = [UIImageView new];
        imgView.backgroundColor = [UIColor grayColor];
        _imgView = imgView;
        
        UILabel *brandName = [UILabel new];
        brandName.numberOfLines = 1;
        brandName.minimumScaleFactor = 0.2;
        brandName.adjustsFontSizeToFitWidth = YES;
        _brandNameLbl = brandName;
        
        UILabel *itemName = [UILabel new];
        itemName.numberOfLines = 1;
        itemName.minimumScaleFactor = 0.2;
        itemName.adjustsFontSizeToFitWidth = YES;
        _itemNameLbl = itemName;
        
        UILabel *summary = [UILabel new];
        //summary.numberOfLines = 3;
        [summary setFont:[UIFont systemFontOfSize:12]];
        _summaryLbl = summary;
        [self.contentView sd_addSubviews:@[_imgView, _brandNameLbl, _itemNameLbl, _summaryLbl]];
        
        //SDAutoLayout Setting
        _imgView.sd_layout
        .widthIs(100)
        .autoHeightRatio(1.0)
        .topSpaceToView(self.contentView, MARGIN)
        .leftSpaceToView(self.contentView, MARGIN);
        
        _brandNameLbl.sd_layout
        .topEqualToView(_imgView)
        .leftSpaceToView(_imgView, MARGIN)
        .rightSpaceToView(self.contentView, MARGIN)
        .heightRatioToView(_imgView, 0.2);
        
        _itemNameLbl.sd_layout
        .topSpaceToView(_brandNameLbl, MARGIN)
        .rightSpaceToView(self.contentView, MARGIN)
        .leftSpaceToView(_imgView, MARGIN)
        .heightRatioToView(_imgView, 0.2);
        
        _summaryLbl.sd_layout
        .topSpaceToView(_itemNameLbl, MARGIN)
        .rightSpaceToView(self.contentView, MARGIN)
        .leftSpaceToView(_imgView, MARGIN)
        .autoHeightRatio(0);
    }
    return self;
}

- (void)setModel:(Item *)model {
    _model = model;
    _itemNameLbl.text = model.name;
    _brandNameLbl.text = model.brand;
    _summaryLbl.text = model.summary;
    
    [_imgView sd_setImageWithURL:[NSURL URLWithString:model.thumb_url]];
    
    _summaryLbl.sd_layout.autoHeightRatio(0);
    
    [_summaryLbl updateLayout];
    [_imgView updateLayout];
    CGFloat totalHeight = _brandNameLbl.frame.size.height + _itemNameLbl.frame.size.height + _summaryLbl.frame.size.height;
    if (totalHeight + MARGIN > _imgView.frame.size.height) {
        //***********************高度自适应cell设置步骤************************
        [self setupAutoHeightWithBottomView:_summaryLbl bottomMargin:MARGIN];
    } else {
        //***********************高度自适应cell设置步骤************************
        [self setupAutoHeightWithBottomView:_imgView bottomMargin:MARGIN];
    }
}

@end
