//
//  APIReference.h
//  First App
//
//  Created by luthertsai on 2017/4/27.
//  Copyright © 2017年 luthertsai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Global.h"

@interface APIReference : NSObject

@property (nonatomic, assign) CategoryType categoryType;

/**
 抓取商品列表API

 @param type CategoryType
 @param page ListPage
 @return NSString *APIURLString
 */
+ (NSString *)getJSONDataWithType:(CategoryType)type withPage:(NSInteger)page;


/**
 取得類別字串

 @param type CategoryType
 @return NSString *typeStr
 */
+ (NSString *)getStringWithType:(CategoryType)type;
@end
