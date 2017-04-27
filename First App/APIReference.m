//
//  APIReference.m
//  First App
//
//  Created by luthertsai on 2017/4/27.
//  Copyright © 2017年 luthertsai. All rights reserved.
//

#import "APIReference.h"
#import "Global.h"

@implementation APIReference

+ (NSString *)getJSONDataWithType:(CategoryType)type withPage:(NSInteger)page {
    NSString *baseAPI = [NSString stringWithFormat:@"%@goods/list?", APIDomain];
    NSString *typeStr = [NSString stringWithFormat:@"type=%@&", [self getStringWithType:type]];
    NSString *pageStr = [NSString stringWithFormat:@"page=%ld&", (long)page];
    NSString *amountStr = [NSString stringWithFormat:@"per_page=%d&", 20];
    NSString *urlStr = [[[baseAPI stringByAppendingString:typeStr] stringByAppendingString:pageStr] stringByAppendingString:amountStr];

    return urlStr;
}

+ (NSString *)getStringWithType:(CategoryType)type {
    switch (type) {
        case HotType:
            return @"hot";
            break;
        case LatestType:
            return @"latest";
            break;
        default:
            return @"";
            break;
    }
}

@end
