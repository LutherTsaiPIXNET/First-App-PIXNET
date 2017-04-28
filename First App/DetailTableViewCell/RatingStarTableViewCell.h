//
//  RatingStarTableViewCell.h
//  First App
//
//  Created by luthertsai on 2017/4/28.
//  Copyright © 2017年 luthertsai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDAutoLayout/SDAutoLayout.h>
#import <HCSStarRatingView/HCSStarRatingView.h>
#import "Item.h"

@interface RatingStarTableViewCell : UITableViewCell

/**
 Item Model
 */
@property (nonatomic, strong) Item *model;

/**
 Option Title
 */
@property (nonatomic, strong) NSString *optionTitle;

@end
