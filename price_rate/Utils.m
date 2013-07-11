//
//  Utils.m
//  price_rate
//
//  Created by k-akaibashi on 13/07/09.
//  Copyright (c) 2013年 ken akaibashi. All rights reserved.
//

#import "Utils.h"

@implementation Utils

/*
 端末の縦画面サイズ取得
*/
+(int)getDeviceHeight{
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    if(screenSize.width == 320.0 && screenSize.height == 568.0)
    {
        return SCREEN_HEIGHT_IPHONE5;
    } else{
        return SCREEN_HEIGHT_IPHONE4;
    }
}

/*
 端末の横画面サイズ取得
 */
+(int)getDeviceWidth{
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    if(screenSize.width == 320.0 && screenSize.height == 568.0)
    {
        return SCREEN_WIDTH_IPHONE5;
    } else{
        return SCREEN_WIDTH_IPHONE4;
    }
}


@end
