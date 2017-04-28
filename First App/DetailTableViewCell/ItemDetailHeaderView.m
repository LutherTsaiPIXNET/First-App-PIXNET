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
{
    UIButton *_headerBtn;
}

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = COLOR_SUPERLIGHT_GREY;
        
        UIButton *headerBtn = [UIButton new];
        [headerBtn setTitle:@"詳細介紹" forState:UIControlStateNormal];
        [headerBtn setImage:[UIImage imageNamed:@"mask.png"] forState:UIControlStateNormal];
        [headerBtn setTitleColor:COLOR_BATTLESHIP_GREY forState:UIControlStateNormal];
        headerBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
        headerBtn.titleLabel.minimumScaleFactor = 0.2;
        [headerBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
        headerBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        headerBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        _headerBtn = headerBtn;
        
        [self sd_addSubviews:@[_headerBtn]];
        
        // 设置isCollectedPersonLbl的Image的约束
        _headerBtn.imageView.sd_layout
        .widthIs(22)
        .heightEqualToWidth()
        .topEqualToView(headerBtn)
        .centerXEqualToView(headerBtn);
        
        // 设置isCollectedPersonLbl的Label的约束
        _headerBtn.titleLabel.sd_layout
        .widthIs(60)
        .heightIs(22)
        .topEqualToView(headerBtn)
        .centerXEqualToView(headerBtn);
        
        _headerBtn.sd_layout
        .topSpaceToView(self, 9)
        .rightSpaceToView(self, 0)
        .leftSpaceToView(self, 0)
        .bottomEqualToView(self);
        
        [self setupAutoHeightWithBottomView:headerBtn bottomMargin:0];

    }
    return self;
}

- (void)setHeaderTitleText:(NSString *)headerTitleText {
    _headerTitleText = headerTitleText;
}

- (void)setTriggerState:(NSInteger)triggerState {
    _triggerState = triggerState;
}

@end
