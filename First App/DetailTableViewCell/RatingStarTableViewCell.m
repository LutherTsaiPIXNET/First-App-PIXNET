//
//  RatingStarTableViewCell.m
//  First App
//
//  Created by luthertsai on 2017/4/28.
//  Copyright © 2017年 luthertsai. All rights reserved.
//

#import "RatingStarTableViewCell.h"
#import "Global.h"

@implementation RatingStarTableViewCell
{
    UILabel *_optionTitleLbl;
    HCSStarRatingView *_starRatingView;
    UILabel *_ratingValueLbl;
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
        
        HCSStarRatingView *starRatingView = [HCSStarRatingView new];
        starRatingView.userInteractionEnabled = NO;
        starRatingView.allowsHalfStars = YES;
        starRatingView.accurateHalfStars = YES;
        starRatingView.maximumValue = 5;
        starRatingView.minimumValue = 0;
        starRatingView.value = 3.8f;
        starRatingView.tintColor = COLOR_ORANGEISH;
        _starRatingView = starRatingView;
        
        UILabel *ratingValueLbl = [UILabel new];
        ratingValueLbl.text = _model.ratingOverview;
        ratingValueLbl.numberOfLines = 1;
        ratingValueLbl.minimumScaleFactor = 0.2;
        ratingValueLbl.adjustsFontSizeToFitWidth = YES;
        [ratingValueLbl setFont:[UIFont systemFontOfSize:24]];
        [ratingValueLbl setTextColor:COLOR_ORANGEISH];
        _ratingValueLbl = ratingValueLbl;

        
        UIButton *optionInfo = [UIButton new];
        [optionInfo setImage:[UIImage imageNamed:@"info.png"] forState:UIControlStateNormal];
        optionInfo.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [optionInfo addTarget:self
                       action:@selector(touchOptionInfo:)
             forControlEvents:UIControlEventTouchUpInside];
        _optionInfo = optionInfo;
        _optionInfo = optionInfo;

        //Add to Content View
        [self.contentView sd_addSubviews:@[_optionTitleLbl, _starRatingView, _ratingValueLbl, _optionInfo]];
        
        //SDAutoLayout Setting
        _optionTitleLbl.sd_layout
        .widthIs(106)
        .heightIs(18)
        .leftSpaceToView(self.contentView, 20)
        .topSpaceToView(self.contentView, 8.3);
        
        _starRatingView.sd_layout
        .widthIs(130)
        .heightIs(18)
        .leftSpaceToView(self.contentView, 20)
        .topSpaceToView(_optionTitleLbl, 5.7);
        
        _ratingValueLbl.sd_layout
        .widthIs(41)
        .heightIs(33)
        .leftSpaceToView(_starRatingView, 18)
        .centerYEqualToView(_starRatingView);
        
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

        
        [self setupAutoHeightWithBottomView:_starRatingView bottomMargin:10];
    }
    return self;
}

- (void)touchOptionInfo:(UIButton *)sender {
    SIAlertView *alertView = [[SIAlertView alloc] initWithTitle:_optionTitle andMessage:@"所有有為此產品評分的人，所給的星等平均值"];
    [alertView addButtonWithTitle:@"我瞭解了"
                             type:SIAlertViewButtonTypeDefault
                          handler:^(SIAlertView *alert) {
                          }];
    alertView.transitionStyle = SIAlertViewTransitionStyleBounce;
    
    [alertView show];
}


- (void)setModel:(Item *)model {
    _model = model;
    _ratingValueLbl.text = _model.ratingOverview;
    _starRatingView.value = [_model.ratingOverview floatValue];
    [_starRatingView updateLayout];
    [_ratingValueLbl updateLayout];
}

- (void)setOptionTitle:(NSString *)optionTitle {
    _optionTitle = optionTitle;
    _optionTitleLbl.text = _optionTitle;
}

@end
