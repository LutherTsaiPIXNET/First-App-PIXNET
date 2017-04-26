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
             @"name" : @"name",
             @"brand" : @"brand",
             @"summary" : @"summary",
             @"thumb_url" : @"thumb",
             @"price" : @"price"};
}

@end
