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
/**Item Brand*/
@property (nonatomic, copy) NSString *brand;
/**Item Name*/
@property (nonatomic, copy) NSString *name;
/**Item Summary*/
@property (nonatomic, copy) NSString *summary;
/**Item Thumb Image Link*/
@property (nonatomic, copy) NSString *thumb_url;
/**Item Price*/
@property (nonatomic, copy) NSString *price;

@end
