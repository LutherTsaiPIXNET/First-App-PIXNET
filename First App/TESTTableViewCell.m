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


@implementation TESTTableViewCell
{
    UIImageView *_imgView;
    UILabel *_brandNameLbl;
    UILabel *_itemNameLbl;
    UILabel *_summaryLbl;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIImageView *imgView = [UIImageView new];
        imgView.backgroundColor = [UIColor grayColor];
        _imgView = imgView;
        
        UILabel *brandName = [UILabel new];
        _brandNameLbl = brandName;
        
        UILabel *itemName = [UILabel new];
        _itemNameLbl = itemName;
        
        UILabel *summary = [UILabel new];
        summary.numberOfLines = 3;
        [summary setFont:[UIFont systemFontOfSize:12]];
        _summaryLbl = summary;
        [self.contentView sd_addSubviews:@[_imgView, _brandNameLbl, _itemNameLbl, _summaryLbl]];
        
        _imgView.sd_layout
        .widthRatioToView(self.contentView, 0.4)
        .autoHeightRatio(1.0)
        .topSpaceToView(self.contentView, 10)
        .leftSpaceToView(self.contentView, 10);
        
        _brandNameLbl.sd_layout
        .topEqualToView(_imgView)
        .leftSpaceToView(_imgView, 10)
        .rightSpaceToView(self.contentView, 10)
        .heightRatioToView(_imgView, 0.2);
        
        _itemNameLbl.sd_layout
        .topSpaceToView(_brandNameLbl, 10)
        .rightSpaceToView(self.contentView, 10)
        .leftSpaceToView(_imgView, 10)
        .heightRatioToView(_imgView, 0.2);
        
        _summaryLbl.sd_layout
        .topSpaceToView(_itemNameLbl, 10)
        .rightSpaceToView(self.contentView, 10)
        .leftSpaceToView(_imgView, 10);
        
        //***********************高度自适应cell设置步骤************************
        
        [self setupAutoHeightWithBottomView:_summaryLbl bottomMargin:10];
        
    }
    return self;
}

- (void)setImgLink:(NSString *)ImgLink
{
    _ImgLink = ImgLink;
    
    [_imgView sd_setImageWithURL:[NSURL URLWithString:_ImgLink]];
}

- (void)setName:(NSString *)name
{
    _name = name;
    _itemNameLbl.text = name;
}

- (void)setBrand:(NSString *)brand
{
    _brand = brand;
    _brandNameLbl.text = brand;
}

- (void)setSummary:(NSString *)summary
{
    _summary = summary;
    _summaryLbl.text = summary;
}
@end
