//
//  DataAccessObject.m
//  price_rate
//
//  Created by 赤井橋 健2 on 2013/07/09.
//  Copyright (c) 2013年 ken akaibashi. All rights reserved.
//

#import "DataAccessObject.h"

@implementation DataAccessObject

/*
 PriceRateの一覧を取得する
*/
-(NSArray *)getPriceRateData {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *array = [defaults arrayForKey:@"price_rate_data"];
    return array;
}


-(NSDictionary *)getPriceRateDataByIndex : (int)index{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *array = [defaults arrayForKey:@"price_rate_data"];
    NSDictionary *result =[array objectAtIndex : index];
    return result;
}


/*
 PriceRateにデータを1件追加する
*/
-(void)addPriceRateData :(NSString *)title andPrice:(int)price andVolume:(int)volume andUnit:(int)unit{
    // get price rate data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *array = [defaults arrayForKey:@"price_rate_data"];
    
    // add price rate data
    NSDictionary *price_rate_data = @{@"title":title, @"price":@(price), @"volume":@(volume), @"unit":@(unit)};
    // 既に配列が存在する場合は追加
    if(0 < [array count]){
        array = [array arrayByAddingObject : price_rate_data];
    }
    // まだ配列が存在しない場合は新規
    else{
        array = [NSArray arrayWithObjects : price_rate_data, nil];
    }
    
    [defaults setObject:array forKey:@"price_rate_data"];
    BOOL successful = [defaults synchronize];
    if (successful) {
        NSLog(@"%@", @"add data successful!");
    }
}


/*
 PriceRateで指定されたインデックスのデータを削除する
*/
-(void)deletePriceRateData :(int)index{
    // get price rate data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *array = [defaults arrayForKey:@"price_rate_data"];
    
    // NSArray → NSMutableArray
    NSMutableArray *m_array = [array mutableCopy];
    
    // remove
    [m_array removeObjectAtIndex:index];
    
    // NSMutableArray → NSArray
    NSArray *input_array = [m_array copy];
    
    [defaults setObject:input_array forKey:@"price_rate_data"];
    BOOL successful = [defaults synchronize];
    if (successful) {
        NSLog(@"%@", @"delete data successful!");
    }
}

/*
 PriceRateのデータを全件削除する
*/
-(void)allDeletePriceRateData{
    // 全件削除
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"price_rate_data"];
}

@end
