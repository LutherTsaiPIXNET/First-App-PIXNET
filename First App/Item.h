//
//  Item.h
//  First App
//
//  Created by luthertsai on 2017/4/25.
//  Copyright © 2017年 luthertsai. All rights reserved.
//
//  Model of the Item

#import <Foundation/Foundation.h>

@interface Item : NSObject

/**Item ID*/
@property (nonatomic, copy) NSString *itemID;
/**Item Thumb Image Link*/
@property (nonatomic, copy) NSString *thumb_url;
/**Item Brand*/
@property (nonatomic, copy) NSString *brand;
/**Item Name*/
@property (nonatomic, copy) NSString *name;
/**Item Capacity*/
@property (nonatomic, copy) NSString *capacity;
/**Item Summary*/
@property (nonatomic, copy) NSString *summary;
/**Item Price*/
@property (nonatomic, copy) NSString *price;
/**Item isCollected*/
@property (nonatomic, copy) NSString *isCollected;
/**Item Collectors*/
@property (nonatomic, copy) NSString *collectors;
/**Item More Articled Count*/
@property (nonatomic, copy) NSString *moreArticleCount;
/**Item Rating Overview*/
@property (nonatomic, copy) NSString *ratingOverview;
/**Item Rating Personalize*/
@property (nonatomic, copy) NSString *ratingPersonalize;
/**Item Rating My*/
@property (nonatomic, copy) NSString *ratingMy;

@end
