//
//  PriceRateViewController.h
//  price_rate
//
//  Created by 赤井橋 健2 on 2013/07/06.
//  Copyright (c) 2013年 ken akaibashi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PriceRateViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    UITableView *_tableView;
    UIView *_footerView;
}

@property (nonatomic, retain) UITableView *_tableView;
@property (nonatomic, retain) UIView *_footerView;

@end
