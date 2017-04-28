//
//  RatingOptionTableViewCell.m
//  First App
//
//  Created by luthertsai on 2017/4/28.
//  Copyright © 2017年 luthertsai. All rights reserved.
//

#import "RatingOptionTableViewCell.h"
#import "Global.h"

@implementation RatingOptionTableViewCell
{
    UILabel *_optionTitleLbl;
    UIButton *_optionBtn;
    UIButton *_optionInfo;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UILabel *optionTitleLbl = [UILabel new];
        optionTitleLbl.text = @"綜合評分";
        optionTitleLbl.numberOfLines = 1;
        optionTitleLbl.minimumScaleFactor = 0.2;
        optionTitleLbl.adjustsFontSizeToFitWidth = YES;
        [optionTitleLbl setFont:[UIFont systemFontOfSize:13]];
        [optionTitleLbl setTextColor:COLOR_BATTLESHIP_GREY];
        _optionTitleLbl = optionTitleLbl;
        
        UIButton *optionBtn = [UIButton new];
        [optionBtn setTitle:@"我想看" forState:UIControlStateNormal];
        [optionBtn setTitleColor:COLOR_ORANGEISH forState:UIControlStateNormal];
        [optionBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
        optionBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        optionBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
        optionBtn.titleLabel.minimumScaleFactor = 0.2;
        optionBtn.layer.borderWidth = 1.0;
        optionBtn.layer.cornerRadius  = 3.0;
        optionBtn.layer.borderColor = [COLOR_ORANGEISH CGColor];
        optionBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        _optionBtn = optionBtn;
        
        UIButton *optionInfo = [UIButton new];
        [optionInfo setImage:[UIImage imageNamed:@"info.png"] forState:UIControlStateNormal];
        optionInfo.imageView.contentMode = UIViewContentModeScaleAspectFit;
        _optionInfo = optionInfo;

        
        //Add to Content View
        [self.contentView sd_addSubviews:@[_optionTitleLbl, _optionBtn, _optionInfo]];
        
        //SDAutoLayout Setting
        _optionTitleLbl.sd_layout
        .widthIs(106)
        .heightIs(18)
        .leftSpaceToView(self.contentView, 20)
        .centerYEqualToView(self.contentView);
        
        _optionInfo.sd_layout
        .widthIs(20)
        .heightIs(20)
        .centerYEqualToView(self.contentView)
        .rightSpaceToView(self.contentView, 20);
        
        _optionInfo.imageView.sd_layout
        .widthIs(20)
        .heightEqualToWidth()
        .topEqualToView(_optionInfo)
        .centerXEqualToView(_optionInfo);
        
        CGFloat space = 50 * SCREEN_WIDTH;
        space = space / IPHONE_47INCH_WIDTH;
        _optionBtn.sd_layout
        .widthIs(97)
        .heightIs(34)
        .centerYEqualToView(self.contentView)
        .rightSpaceToView(_optionInfo, space);
        
        _optionBtn.titleLabel.sd_layout
        .widthIs(64)
        .heightIs(22)
        .centerXEqualToView(_optionBtn)
        .centerYEqualToView(_optionBtn);
        
        [self setupAutoHeightWithBottomView:_optionBtn bottomMargin:13];
    }
    return self;
}

- (void)setModel:(Item *)model {
    _model = model;
}

- (void)setOptionTitle:(NSString *)optionTitle {
    _optionTitle = optionTitle;
    _optionTitleLbl.text = _optionTitle;
}

- (void)setOptionBtnTitle:(NSString *)optionBtnTitle {
    _optionBtnTitle = optionBtnTitle;
    [_optionBtn setTitle:_optionBtnTitle forState:UIControlStateNormal];
    
}

@end
