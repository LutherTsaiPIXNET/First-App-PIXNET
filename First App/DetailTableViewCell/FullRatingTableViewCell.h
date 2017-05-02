//
//  FullRatingTableViewCell.h
//  First App
//
//  Created by luthertsai on 2017/5/2.
//  Copyright © 2017年 luthertsai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDAutoLayout/SDAutoLayout.h>
#import <HCSStarRatingView/HCSStarRatingView.h>
#import "Item.h"

@interface FullRatingTableViewCell : UITableViewCell

/**
 Item Model
 */
@property (nonatomic, strong) Item *model;

@end
