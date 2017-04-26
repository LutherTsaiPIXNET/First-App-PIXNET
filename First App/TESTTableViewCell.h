//
//  TESTTableViewCell.h
//  First App
//
//  Created by luthertsai on 2017/4/25.
//  Copyright © 2017年 luthertsai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TESTTableViewCell : UITableViewCell

/**Link of Thumb*/
@property (nonatomic, copy) NSString *imgLink;
/**Item Brand*/
@property (nonatomic, copy) NSString *brand;
/**Item Name*/
@property (nonatomic, copy) NSString *name;
/**Item Summary*/
@property (nonatomic, copy) NSString *summary;

@end
