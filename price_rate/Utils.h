//
//  Utils.h
//  price_rate
//
//  Created by k-akaibashi on 13/07/09.
//  Copyright (c) 2013年 ken akaibashi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

// スクリーン縦サイズ
#define SCREEN_HEIGHT_IPHONE4       480
#define SCREEN_HEIGHT_IPHONE5       568

// スクリーン横サイズ
#define SCREEN_WIDTH_IPHONE4        320
#define SCREEN_WIDTH_IPHONE5        320

+(int)getDeviceHeight;
+(int)getDeviceWidth;

@end
