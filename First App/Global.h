//
//  Global.h
//  First App
//
//  Created by luthertsai on 2017/4/27.
//  Copyright © 2017年 luthertsai. All rights reserved.
//

#ifndef Global_h
#define Global_h

#define APIDomain @"https://styleme-app-api.events.pixnet.net/"

typedef NS_ENUM(NSInteger, CategoryType) {
    HotType,
    LatestType,
};

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width;
#define IPHONE_4INCH_WIDTH 320.0
#define IPHONE_47INCH_WIDTH 375.0
#define IPHONE_55INCH_WIDTH 414.0

#define COLOR_WARM_GREY [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1]
#define COLOR_SUPERLIGHT_GREY [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1]
#define COLOR_WHITE_THREE [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1]
#define COLOR_BATTLESHIP_GREY [UIColor colorWithRed:110/255.0 green:112/255.0 blue:113/255.0 alpha:1]
#define COLOR_MEDIUM_PINK [UIColor colorWithRed:241/255.0 green:115/255.0 blue:172/255.0 alpha:1]
#define COLOR_MEDIUM_PINK_TWO [UIColor colorWithRed:236/255.0 green:82/255.0 blue:151/255.0 alpha:1]
#define COLOR_ORANGEISH [UIColor colorWithRed:255/255.0 green:143/255.0 blue:59/255.0 alpha:1]

#endif /* Global_h */
