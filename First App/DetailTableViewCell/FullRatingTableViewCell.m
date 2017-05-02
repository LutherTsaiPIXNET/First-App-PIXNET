//
//  FullRatingTableViewCell.m
//  First App
//
//  Created by luthertsai on 2017/5/2.
//  Copyright © 2017年 luthertsai. All rights reserved.
//

#import "FullRatingTableViewCell.h"
#import "Global.h"

@implementation FullRatingTableViewCell
{
    UILabel *_ratingTitleAge;
    UILabel *_ratingTitleSkin;
    
    UILabel *_ratingAge01;
    UILabel *_ratingAge02;
    UILabel *_ratingAge03;
    UILabel *_ratingAge04;
    UILabel *_ratingAge05;
    
    UILabel *_ratingSkin01;
    UILabel *_ratingSkin02;
    UILabel *_ratingSkin03;
    UILabel *_ratingSkin04;
    UILabel *_ratingSkin05;
    
    HCSStarRatingView *_ratingAgeStar01;
    HCSStarRatingView *_ratingAgeStar02;
    HCSStarRatingView *_ratingAgeStar03;
    HCSStarRatingView *_ratingAgeStar04;
    HCSStarRatingView *_ratingAgeStar05;
    
    HCSStarRatingView *_ratingSkinStar01;
    HCSStarRatingView *_ratingSkinStar02;
    HCSStarRatingView *_ratingSkinStar03;
    HCSStarRatingView *_ratingSkinStar04;
    HCSStarRatingView *_ratingSkinStar05;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UILabel *ratingTitleAge = [UILabel new];
        ratingTitleAge.text = @"年齡分佈";
        ratingTitleAge.numberOfLines = 1;
        ratingTitleAge.minimumScaleFactor = 0.2;
        ratingTitleAge.adjustsFontSizeToFitWidth = YES;
        [ratingTitleAge setFont:[UIFont systemFontOfSize:13]];
        [ratingTitleAge setTextColor:[UIColor blackColor]];
        _ratingTitleAge = ratingTitleAge;
        
        UILabel *ratingAge01 = [UILabel new];
        ratingAge01.text = @"<17";
        ratingAge01.numberOfLines = 1;
        ratingAge01.minimumScaleFactor = 0.2;
        ratingAge01.adjustsFontSizeToFitWidth = YES;
        [ratingAge01 setFont:[UIFont systemFontOfSize:13]];
        [ratingAge01 setTextColor:COLOR_WARM_GREY];
        _ratingAge01 = ratingAge01;
        
        UILabel *ratingAge02 = [UILabel new];
        ratingAge02.text = @"18-25";
        ratingAge02.numberOfLines = 1;
        ratingAge02.minimumScaleFactor = 0.2;
        ratingAge02.adjustsFontSizeToFitWidth = YES;
        [ratingAge02 setFont:[UIFont systemFontOfSize:13]];
        [ratingAge02 setTextColor:COLOR_WARM_GREY];
        _ratingAge02 = ratingAge02;
        
        UILabel *ratingAge03 = [UILabel new];
        ratingAge03.text = @"26-35";
        ratingAge03.numberOfLines = 1;
        ratingAge03.minimumScaleFactor = 0.2;
        ratingAge03.adjustsFontSizeToFitWidth = YES;
        [ratingAge03 setFont:[UIFont systemFontOfSize:13]];
        [ratingAge03 setTextColor:COLOR_WARM_GREY];
        _ratingAge03 = ratingAge03;
        
        UILabel *ratingAge04 = [UILabel new];
        ratingAge04.text = @"36-45";
        ratingAge04.numberOfLines = 1;
        ratingAge04.minimumScaleFactor = 0.2;
        ratingAge04.adjustsFontSizeToFitWidth = YES;
        [ratingAge04 setFont:[UIFont systemFontOfSize:13]];
        [ratingAge04 setTextColor:COLOR_WARM_GREY];
        _ratingAge04 = ratingAge04;
        
        UILabel *ratingAge05 = [UILabel new];
        ratingAge05.text = @">46";
        ratingAge05.numberOfLines = 1;
        ratingAge05.minimumScaleFactor = 0.2;
        ratingAge05.adjustsFontSizeToFitWidth = YES;
        [ratingAge05 setFont:[UIFont systemFontOfSize:13]];
        [ratingAge05 setTextColor:COLOR_WARM_GREY];
        _ratingAge05 = ratingAge05;
        
        HCSStarRatingView *ratingAgeStar01 = [HCSStarRatingView new];
        ratingAgeStar01.userInteractionEnabled = NO;
        ratingAgeStar01.allowsHalfStars = YES;
        ratingAgeStar01.accurateHalfStars = YES;
        ratingAgeStar01.maximumValue = 5;
        ratingAgeStar01.minimumValue = 0;
        ratingAgeStar01.value = 0;
        ratingAgeStar01.tintColor = COLOR_ORANGEISH;
        ratingAgeStar01.backgroundColor = COLOR_SUPERLIGHT_GREY;
        _ratingAgeStar01 = ratingAgeStar01;
        
        HCSStarRatingView *ratingAgeStar02 = [HCSStarRatingView new];
        ratingAgeStar02.userInteractionEnabled = NO;
        ratingAgeStar02.allowsHalfStars = YES;
        ratingAgeStar02.accurateHalfStars = YES;
        ratingAgeStar02.maximumValue = 5;
        ratingAgeStar02.minimumValue = 0;
        ratingAgeStar02.value = 0;
        ratingAgeStar02.tintColor = COLOR_ORANGEISH;
        ratingAgeStar02.backgroundColor = COLOR_SUPERLIGHT_GREY;
        _ratingAgeStar02 = ratingAgeStar02;
        
        HCSStarRatingView *ratingAgeStar03 = [HCSStarRatingView new];
        ratingAgeStar03.userInteractionEnabled = NO;
        ratingAgeStar03.allowsHalfStars = YES;
        ratingAgeStar03.accurateHalfStars = YES;
        ratingAgeStar03.maximumValue = 5;
        ratingAgeStar03.minimumValue = 0;
        ratingAgeStar03.value = 0;
        ratingAgeStar03.tintColor = COLOR_ORANGEISH;
        ratingAgeStar03.backgroundColor = COLOR_SUPERLIGHT_GREY;
        _ratingAgeStar03 = ratingAgeStar03;
        
        HCSStarRatingView *ratingAgeStar04 = [HCSStarRatingView new];
        ratingAgeStar04.userInteractionEnabled = NO;
        ratingAgeStar04.allowsHalfStars = YES;
        ratingAgeStar04.accurateHalfStars = YES;
        ratingAgeStar04.maximumValue = 5;
        ratingAgeStar04.minimumValue = 0;
        ratingAgeStar04.value = 0;
        ratingAgeStar04.tintColor = COLOR_ORANGEISH;
        ratingAgeStar04.backgroundColor = COLOR_SUPERLIGHT_GREY;
        _ratingAgeStar04 = ratingAgeStar04;
        
        HCSStarRatingView *ratingAgeStar05 = [HCSStarRatingView new];
        ratingAgeStar05.userInteractionEnabled = NO;
        ratingAgeStar05.allowsHalfStars = YES;
        ratingAgeStar05.accurateHalfStars = YES;
        ratingAgeStar05.maximumValue = 5;
        ratingAgeStar05.minimumValue = 0;
        ratingAgeStar05.value = 0;
        ratingAgeStar05.tintColor = COLOR_ORANGEISH;
        ratingAgeStar05.backgroundColor = COLOR_SUPERLIGHT_GREY;
        _ratingAgeStar05 = ratingAgeStar05;
        
        UILabel *ratingTitleSkin = [UILabel new];
        ratingTitleSkin.text = @"膚質分佈";
        ratingTitleSkin.numberOfLines = 1;
        ratingTitleSkin.minimumScaleFactor = 0.2;
        ratingTitleSkin.adjustsFontSizeToFitWidth = YES;
        [ratingTitleSkin setFont:[UIFont systemFontOfSize:13]];
        [ratingTitleSkin setTextColor:[UIColor blackColor]];
        _ratingTitleSkin = ratingTitleSkin;
        
        UILabel *ratingSkin01 = [UILabel new];
        ratingSkin01.text = @"混合性";
        ratingSkin01.numberOfLines = 1;
        ratingSkin01.minimumScaleFactor = 0.2;
        ratingSkin01.adjustsFontSizeToFitWidth = YES;
        [ratingSkin01 setFont:[UIFont systemFontOfSize:13]];
        [ratingSkin01 setTextColor:COLOR_WARM_GREY];
        _ratingSkin01 = ratingSkin01;
        
        UILabel *ratingSkin02 = [UILabel new];
        ratingSkin02.text = @"敏感性";
        ratingSkin02.numberOfLines = 1;
        ratingSkin02.minimumScaleFactor = 0.2;
        ratingSkin02.adjustsFontSizeToFitWidth = YES;
        [ratingSkin02 setFont:[UIFont systemFontOfSize:13]];
        [ratingSkin02 setTextColor:COLOR_WARM_GREY];
        _ratingSkin02 = ratingSkin02;
        
        UILabel *ratingSkin03 = [UILabel new];
        ratingSkin03.text = @"乾性";
        ratingSkin03.numberOfLines = 1;
        ratingSkin03.minimumScaleFactor = 0.2;
        ratingSkin03.adjustsFontSizeToFitWidth = YES;
        [ratingSkin03 setFont:[UIFont systemFontOfSize:13]];
        [ratingSkin03 setTextColor:COLOR_WARM_GREY];
        _ratingSkin03 = ratingSkin03;
        
        UILabel *ratingSkin04 = [UILabel new];
        ratingSkin04.text = @"中性";
        ratingSkin04.numberOfLines = 1;
        ratingSkin04.minimumScaleFactor = 0.2;
        ratingSkin04.adjustsFontSizeToFitWidth = YES;
        [ratingSkin04 setFont:[UIFont systemFontOfSize:13]];
        [ratingSkin04 setTextColor:COLOR_WARM_GREY];
        _ratingSkin04 = ratingSkin04;
        
        UILabel *ratingSkin05 = [UILabel new];
        ratingSkin05.text = @"油性";
        ratingSkin05.numberOfLines = 1;
        ratingSkin05.minimumScaleFactor = 0.2;
        ratingSkin05.adjustsFontSizeToFitWidth = YES;
        [ratingSkin05 setFont:[UIFont systemFontOfSize:13]];
        [ratingSkin05 setTextColor:COLOR_WARM_GREY];
        _ratingSkin05 = ratingSkin05;
        
        HCSStarRatingView *ratingSkinStar01 = [HCSStarRatingView new];
        ratingSkinStar01.userInteractionEnabled = NO;
        ratingSkinStar01.allowsHalfStars = YES;
        ratingSkinStar01.accurateHalfStars = YES;
        ratingSkinStar01.maximumValue = 5;
        ratingSkinStar01.minimumValue = 0;
        ratingSkinStar01.value = 0;
        ratingSkinStar01.tintColor = COLOR_ORANGEISH;
        ratingSkinStar01.backgroundColor = COLOR_SUPERLIGHT_GREY;
        _ratingSkinStar01 = ratingSkinStar01;
        
        HCSStarRatingView *ratingSkinStar02 = [HCSStarRatingView new];
        ratingSkinStar02.userInteractionEnabled = NO;
        ratingSkinStar02.allowsHalfStars = YES;
        ratingSkinStar02.accurateHalfStars = YES;
        ratingSkinStar02.maximumValue = 5;
        ratingSkinStar02.minimumValue = 0;
        ratingSkinStar02.value = 0;
        ratingSkinStar02.tintColor = COLOR_ORANGEISH;
        ratingSkinStar02.backgroundColor = COLOR_SUPERLIGHT_GREY;
        _ratingSkinStar02 = ratingSkinStar02;
        
        HCSStarRatingView *ratingSkinStar03 = [HCSStarRatingView new];
        ratingSkinStar03.userInteractionEnabled = NO;
        ratingSkinStar03.allowsHalfStars = YES;
        ratingSkinStar03.accurateHalfStars = YES;
        ratingSkinStar03.maximumValue = 5;
        ratingSkinStar03.minimumValue = 0;
        ratingSkinStar03.value = 0;
        ratingSkinStar03.tintColor = COLOR_ORANGEISH;
        ratingSkinStar03.backgroundColor = COLOR_SUPERLIGHT_GREY;
        _ratingSkinStar03 = ratingSkinStar03;
        
        HCSStarRatingView *ratingSkinStar04 = [HCSStarRatingView new];
        ratingSkinStar04.userInteractionEnabled = NO;
        ratingSkinStar04.allowsHalfStars = YES;
        ratingSkinStar04.accurateHalfStars = YES;
        ratingSkinStar04.maximumValue = 5;
        ratingSkinStar04.minimumValue = 0;
        ratingSkinStar04.value = 0;
        ratingSkinStar04.tintColor = COLOR_ORANGEISH;
        ratingSkinStar04.backgroundColor = COLOR_SUPERLIGHT_GREY;
        _ratingSkinStar04 = ratingSkinStar04;
        
        HCSStarRatingView *ratingSkinStar05 = [HCSStarRatingView new];
        ratingSkinStar05.userInteractionEnabled = NO;
        ratingSkinStar05.allowsHalfStars = YES;
        ratingSkinStar05.accurateHalfStars = YES;
        ratingSkinStar05.maximumValue = 5;
        ratingSkinStar05.minimumValue = 0;
        ratingSkinStar05.value = 0;
        ratingSkinStar05.tintColor = COLOR_ORANGEISH;
        ratingSkinStar05.backgroundColor = COLOR_SUPERLIGHT_GREY;
        _ratingSkinStar05 = ratingSkinStar05;
        
        //Add to Content View
        [self.contentView sd_addSubviews:@[_ratingTitleAge, _ratingTitleSkin, _ratingAge01, _ratingAge02, _ratingAge03, _ratingAge04, _ratingAge05, _ratingAgeStar01, _ratingAgeStar02, _ratingAgeStar03, _ratingAgeStar04, _ratingAgeStar05, _ratingSkin01, _ratingSkin02, _ratingSkin03, _ratingSkin04, _ratingSkin05, _ratingSkinStar01, _ratingSkinStar02, _ratingSkinStar03, _ratingSkinStar04, _ratingSkinStar05]];
        
        //SDAutoLayout Setting
        _ratingTitleAge.sd_layout
        .widthIs(55)
        .heightIs(12)
        .leftSpaceToView(self.contentView, 38)
        .topSpaceToView(self.contentView, 16);
        
        _ratingAge01.sd_layout
        .widthIs(55)
        .heightIs(12)
        .leftEqualToView(_ratingTitleAge)
        .topSpaceToView(_ratingTitleAge, 8);
        
        _ratingAge02.sd_layout
        .widthIs(55)
        .heightIs(12)
        .leftEqualToView(_ratingTitleAge)
        .topSpaceToView(_ratingAge01, 8);
        
        _ratingAge03.sd_layout
        .widthIs(55)
        .heightIs(12)
        .leftEqualToView(_ratingTitleAge)
        .topSpaceToView(_ratingAge02, 8);
        
        _ratingAge04.sd_layout
        .widthIs(55)
        .heightIs(12)
        .leftEqualToView(_ratingTitleAge)
        .topSpaceToView(_ratingAge03, 8);
        
        _ratingAge05.sd_layout
        .widthIs(55)
        .heightIs(12)
        .leftEqualToView(_ratingTitleAge)
        .topSpaceToView(_ratingAge04, 8);
        
        _ratingAgeStar01.sd_layout
        .widthIs(60)
        .heightIs(12)
        .leftSpaceToView(_ratingAge01, 5)
        .topEqualToView(_ratingAge01);
        
        _ratingAgeStar02.sd_layout
        .widthIs(60)
        .heightIs(12)
        .leftSpaceToView(_ratingAge02, 5)
        .topEqualToView(_ratingAge02);
        
        _ratingAgeStar03.sd_layout
        .widthIs(60)
        .heightIs(12)
        .leftSpaceToView(_ratingAge03, 5)
        .topEqualToView(_ratingAge03);
        
        _ratingAgeStar04.sd_layout
        .widthIs(60)
        .heightIs(12)
        .leftSpaceToView(_ratingAge04, 5)
        .topEqualToView(_ratingAge04);
        
        _ratingAgeStar05.sd_layout
        .widthIs(60)
        .heightIs(12)
        .leftSpaceToView(_ratingAge05, 5)
        .topEqualToView(_ratingAge05);
        
        _ratingTitleSkin.sd_layout
        .widthIs(55)
        .heightIs(12)
        .topEqualToView(_ratingTitleAge)
        .leftSpaceToView(_ratingTitleAge, 108);
        
        _ratingSkin01.sd_layout
        .widthIs(55)
        .heightIs(12)
        .leftEqualToView(_ratingTitleSkin)
        .topSpaceToView(_ratingTitleSkin, 8);
        
        _ratingSkin02.sd_layout
        .widthIs(55)
        .heightIs(12)
        .leftEqualToView(_ratingTitleSkin)
        .topSpaceToView(_ratingSkin01, 8);
        
        _ratingSkin03.sd_layout
        .widthIs(55)
        .heightIs(12)
        .leftEqualToView(_ratingTitleSkin)
        .topSpaceToView(_ratingSkin02, 8);
        
        _ratingSkin04.sd_layout
        .widthIs(55)
        .heightIs(12)
        .leftEqualToView(_ratingTitleSkin)
        .topSpaceToView(_ratingSkin03, 8);
        
        _ratingSkin05.sd_layout
        .widthIs(55)
        .heightIs(12)
        .leftEqualToView(_ratingTitleSkin)
        .topSpaceToView(_ratingSkin04, 8);
        
        _ratingSkinStar01.sd_layout
        .widthIs(60)
        .heightIs(12)
        .leftSpaceToView(_ratingSkin01, 5)
        .topEqualToView(_ratingSkin01);
        
        _ratingSkinStar02.sd_layout
        .widthIs(60)
        .heightIs(12)
        .leftSpaceToView(_ratingSkin02, 5)
        .topEqualToView(_ratingSkin02);
        
        _ratingSkinStar03.sd_layout
        .widthIs(60)
        .heightIs(12)
        .leftSpaceToView(_ratingSkin03, 5)
        .topEqualToView(_ratingSkin03);
        
        _ratingSkinStar04.sd_layout
        .widthIs(60)
        .heightIs(12)
        .leftSpaceToView(_ratingSkin04, 5)
        .topEqualToView(_ratingSkin04);
        
        _ratingSkinStar05.sd_layout
        .widthIs(60)
        .heightIs(12)
        .leftSpaceToView(_ratingSkin05, 5)
        .topEqualToView(_ratingSkin05);


        [self setupAutoHeightWithBottomView:_ratingAge05 bottomMargin:10];
    }
    return self;
}

- (void)setModel:(Item *)model {
    _model = model;
}


@end
