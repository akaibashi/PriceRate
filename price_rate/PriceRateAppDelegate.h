//
//  PriceRateAppDelegate.h
//  price_rate
//
//  Created by 赤井橋 健2 on 2013/07/06.
//  Copyright (c) 2013年 ken akaibashi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PriceRateViewController;

@interface PriceRateAppDelegate : UIResponder <UIApplicationDelegate>{
    UIWindow *window;
    PriceRateViewController *priceRateViewController;
    
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) PriceRateViewController *priceRateViewController;

@end
