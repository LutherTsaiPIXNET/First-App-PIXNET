//
//  ItemDetailHeaderView.m
//  First App
//
//  Created by luthertsai on 2017/4/28.
//  Copyright © 2017年 luthertsai. All rights reserved.
//

#import "ItemDetailHeaderView.h"
#import "UIView+SDAutoLayout.h"
#import "UIImageView+WebCache.h"
#import "Global.h"

@implementation ItemDetailHeaderView


- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = COLOR_SUPERLIGHT_GREY;
        
        UIButton *headerBtn = [UIButton new];
        [headerBtn setTitle:@"詳細介紹" forState:UIControlStateNormal];
        [headerBtn setImage:[UIImage imageNamed:@"mask.png"] forState:UIControlStateNormal];
        [headerBtn setImage:[UIImage imageNamed:@"imgMoreArrowBlackSmall"] forState:UIControlStateSelected];
        [headerBtn setTitleColor:COLOR_BATTLESHIP_GREY forState:UIControlStateNormal];
        headerBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
        headerBtn.titleLabel.minimumScaleFactor = 0.2;
        [headerBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
        headerBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        //headerBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [headerBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
        _headerBtn = headerBtn;
        
        [self sd_addSubviews:@[_headerBtn]];
        
        _headerBtn.titleLabel.sd_layout
        .heightIs(22)
        .widthIs(60)
        .topEqualToView(_headerBtn)
        .centerXEqualToView(_headerBtn);

        _headerBtn.imageView.sd_layout
        .widthIs(22)
        .heightIs(22)
        .topEqualToView(_headerBtn)
        .leftSpaceToView(_headerBtn.titleLabel, 0);
        
        _headerBtn.sd_layout
        .topSpaceToView(self, 9)
        .rightSpaceToView(self, 0)
        .leftSpaceToView(self, 0)
        .bottomEqualToView(self);
        
        [self setupAutoHeightWithBottomView:headerBtn bottomMargin:10];

    }
    return self;
}

- (void)setHeaderTitleText:(NSString *)headerTitleText {
    _headerTitleText = headerTitleText;
    _headerBtn.titleLabel.text = _headerTitleText;
}

@end
