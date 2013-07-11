//
//  DataAccessObject.h
//  price_rate
//
//  Created by 赤井橋 健2 on 2013/07/09.
//  Copyright (c) 2013年 ken akaibashi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataAccessObject : NSObject

-(NSArray *)getPriceRateData;
-(void)addPriceRateData :(NSString *)title andPrice:(int)price andVolume:(int)volume andUnit:(int)unit;
-(void)deletePriceRateData : (int)index;
-(void)allDeletePriceRateData;
-(NSDictionary *)getPriceRateDataByIndex : (int)index;

@end
