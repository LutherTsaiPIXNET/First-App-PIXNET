//
//  Item.m
//  First App
//
//  Created by luthertsai on 2017/4/25.
//  Copyright © 2017年 luthertsai. All rights reserved.
//

#import "Item.h"

@implementation Item

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"itemID" : @"id",
             @"thumb_url" : @"thumb",
             @"name" : @"name",
             @"brand" : @"brand",
             @"price" : @"price",
             @"summary" : @"summary",
             @"isCollected" : @"is_collected",
             @"collectors" : @"collectors",
             @"moreArticleCount" : @"more_article_count",
             @"ratingOverview" : @"rating.overview",
             @"ratingPersonalize" : @"rating.personalize",
             @"ratingMy" : @"rating.my",};
}

@end
