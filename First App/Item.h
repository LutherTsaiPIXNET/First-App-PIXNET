//
//  Item.h
//  First App
//
//  Created by luthertsai on 2017/4/25.
//  Copyright © 2017年 luthertsai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (nonatomic, copy) NSString *item_ID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *brand;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *thumb_url;
@property (nonatomic, copy) NSString *price;

@end
