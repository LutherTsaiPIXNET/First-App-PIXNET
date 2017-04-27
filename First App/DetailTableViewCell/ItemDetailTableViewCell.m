//
//  ItemDetailTableViewCell.m
//  First App
//
//  Created by luthertsai on 2017/4/27.
//  Copyright © 2017年 luthertsai. All rights reserved.
//

#import "ItemDetailTableViewCell.h"
#import "UIView+SDAutoLayout.h"

#import "UITableView+SDAutoTableViewCellHeight.h"
#import "UIImageView+WebCache.h"
#import "Global.h"

#define MARGIN 10.0

@implementation ItemDetailTableViewCell
{
    UIImageView *_imgView;
    UIButton *_isCollectedBtn;
    UILabel *_brandNameLbl;
    UILabel *_itemNameLbl;
    UILabel *_capPriceLbl;
    UILabel *_isCollectedPersonLbl;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIImageView *imgView = [UIImageView new];
        imgView.backgroundColor = [UIColor whiteColor];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        _imgView = imgView;
        
        UILabel *brandName = [UILabel new];
        brandName.numberOfLines = 1;
        brandName.minimumScaleFactor = 0.2;
        brandName.adjustsFontSizeToFitWidth = YES;
        [brandName setFont:[UIFont systemFontOfSize:16]];
        _brandNameLbl = brandName;
        
        UILabel *itemName = [UILabel new];
        itemName.numberOfLines = 1;
        itemName.minimumScaleFactor = 0.2;
        itemName.adjustsFontSizeToFitWidth = YES;
        [itemName setFont:[UIFont systemFontOfSize:16]];
        _itemNameLbl = itemName;
        
        UILabel *capPriceLbl = [UILabel new];
        capPriceLbl.numberOfLines = 1;
        capPriceLbl.adjustsFontSizeToFitWidth = NO;
        [capPriceLbl setFont:[UIFont systemFontOfSize:12]];
        [capPriceLbl setTextColor: COLOR_WARM_GREY];
        _capPriceLbl = capPriceLbl;
        
        UIButton *isCollectedBtn = [UIButton new];
        [isCollectedBtn setTitle:@"已收藏" forState:UIControlStateNormal];
        [isCollectedBtn setImage:[UIImage imageNamed:@"btnLikeProduct.png"] forState:UIControlStateNormal];
        [isCollectedBtn setTitleColor:COLOR_MEDIUM_PINK forState:UIControlStateNormal];
        isCollectedBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
        isCollectedBtn.titleLabel.minimumScaleFactor = 0.2;
        [isCollectedBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
        isCollectedBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        isCollectedBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        _isCollectedBtn = isCollectedBtn;
        
        UILabel *isCollectedPersonLbl = [UILabel new];
        isCollectedPersonLbl.textAlignment = NSTextAlignmentCenter;
        isCollectedPersonLbl.numberOfLines = 1;
        isCollectedPersonLbl.adjustsFontSizeToFitWidth = YES;
        isCollectedPersonLbl.minimumScaleFactor = 0.2;
        [isCollectedPersonLbl setFont:[UIFont systemFontOfSize:12]];
        [isCollectedPersonLbl setTextColor:COLOR_WARM_GREY];
        _isCollectedPersonLbl = isCollectedPersonLbl;
        
        // 设置button的图片的约束
        isCollectedBtn.imageView.sd_layout
        .widthIs(26)
        .heightEqualToWidth()
        .topEqualToView(isCollectedBtn)
        .centerXEqualToView(isCollectedBtn);
        
        // 设置button的label的约束
        isCollectedBtn.titleLabel.sd_layout
        .widthIs(48)
        .heightIs(22)
        .topSpaceToView(isCollectedBtn.imageView, 0)
        .centerXEqualToView(isCollectedBtn);

        
        [self.contentView sd_addSubviews:@[_imgView, _brandNameLbl, _itemNameLbl, _capPriceLbl, _isCollectedBtn, _isCollectedPersonLbl]];
        
        //SDAutoLayout Setting
        _imgView.sd_layout
        .autoHeightRatio(1.0)
        .topSpaceToView(self.contentView, 15)
        .centerXEqualToView(self.contentView)
        .leftSpaceToView(self.contentView, 88)
        .rightSpaceToView(self.contentView, 88);
        
        _brandNameLbl.sd_layout
        .topSpaceToView(_imgView, 17)
        .leftSpaceToView(self.contentView, 20)
        .widthIs(257)
        .heightIs(23);
        
        _itemNameLbl.sd_layout
        .topSpaceToView(_brandNameLbl, 0)
        .leftSpaceToView(self.contentView, 20)
        .widthIs(257)
        .heightIs(23);
        
        _capPriceLbl.sd_layout
        .topSpaceToView(_itemNameLbl, 4)
        .leftSpaceToView(self.contentView, 20)
        .widthIs(200)
        .heightIs(15);
        
        _isCollectedBtn.sd_layout
        .topEqualToView(_brandNameLbl)
        .rightSpaceToView(self.contentView, 20)
        .widthIs(48)
        .heightIs(48);
        
        _isCollectedPersonLbl.sd_layout
        .topEqualToView(_capPriceLbl)
        .centerXEqualToView(_isCollectedBtn)
        .widthIs(34)
        .heightIs(17);

    }
    return self;
}

- (void)setModel:(Item *)model {
    _model = model;
    _itemNameLbl.text = model.name;
    _brandNameLbl.text = model.brand;
    _capPriceLbl.text = [NSString stringWithFormat:@"%@/%@", model.capacity, model.price];
    _isCollectedPersonLbl.text = [NSString stringWithFormat:@"%@人", @"999"];
    
    [_imgView sd_setImageWithURL:[NSURL URLWithString:model.thumb_url]];
    [_capPriceLbl updateLayout];
    
    [self setupAutoHeightWithBottomView:_capPriceLbl bottomMargin:MARGIN];
}

@end
