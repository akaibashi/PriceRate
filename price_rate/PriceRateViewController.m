//
//  PriceRateViewController.m
//  price_rate
//
//  Created by 赤井橋 健2 on 2013/07/06.
//  Copyright (c) 2013年 ken akaibashi. All rights reserved.
//

#import "PriceRateViewController.h"
#import "PriceRateCell.h"
#import "Utils.h"
#import "DataAccessObject.h"

@interface PriceRateViewController ()

@end

@implementation PriceRateViewController

@synthesize _tableView,_footerView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
/*
        NSArray *array = @[@"http://www.apple.com", @"http://www.9revolution9.com", @"https://twitter.com/"];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:array forKey:@"bookmarks"];
        BOOL successful = [defaults synchronize];
        if (successful) {
            NSLog(@"%@", @"データの保存に成功しました。");
        }
*/
        
        DataAccessObject *dao = [[DataAccessObject alloc] init];
        
        // add data
//        [dao addPriceRateData:@"hoge" andPrice:104 andVolume:204 andUnit:304];
        
/*
        // delete data
        [dao deletePriceRateData:0];
        [dao deletePriceRateData:0];
        [dao deletePriceRateData:0];
        [dao deletePriceRateData:0];
        [dao deletePriceRateData:0];
        [dao deletePriceRateData:0];
        [dao deletePriceRateData:0];
        [dao deletePriceRateData:0];
        [dao deletePriceRateData:0];
*/ 
        
        // get data
        NSArray *get_array = [dao getPriceRateData];
        if (get_array) {
            for (NSDictionary *data in get_array) {
                NSLog(@"akaibashi data");
                NSLog(@"%@", data);
            }
        } else {
            NSLog(@"%@", @"データが存在しません。");
        }
        
        // get data by index
        NSDictionary *test = [dao getPriceRateDataByIndex:1];
NSLog(@"インデックスを指定してデータ取得 : %@", test);
        
        
/*
        NSUserDefaults *get_defaults = [NSUserDefaults standardUserDefaults];
        NSArray *get_array = [get_defaults arrayForKey:@"bookmarks"];
        if (get_array) {
            for (NSString *data in get_array) {
                NSLog(@"%@", data);
            }
        } else {
            NSLog(@"%@", @"データが存在しません。");
        }
 
        NSUserDefaults *del_defaults = [NSUserDefaults standardUserDefaults];
        [del_defaults removeObjectForKey:@"bookmarks"];
        BOOL del_successful = [del_defaults synchronize];
        if (del_successful) {
            NSLog(@"%@", @"データの削除に成功しました。");
        } else {
            NSLog(@"%@", @"削除するデータがありません。");
        }
        // データが削除されていることを確認する
        NSArray *del_array = [defaults arrayForKey:@"bookmarks"];
        NSLog(@"%d:%@", del_successful, del_array);
        if (!del_array) {
            NSLog(@"%@", @"データは削除されました。");
        }
*/      
 
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    /* make table view */
    _tableView = [[UITableView alloc] init] ;
    _tableView.frame = CGRectMake(0, 0, [Utils getDeviceWidth], [Utils getDeviceHeight] - 80);
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    /* make footer menu */
    _footerView = [[UIView alloc] init];
    _footerView.frame = CGRectMake(0,[Utils getDeviceHeight] - 80,[Utils getDeviceWidth], 80);
    _footerView.backgroundColor = [UIColor blueColor];
    
    /* make add price rate data view */
    UIView *addButton = [[UIView alloc] init];
    addButton.frame = CGRectMake(0, 0, [Utils getDeviceWidth] -80 , 80);
    addButton.backgroundColor = [UIColor redColor];
    
    /* add tap event */
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAddPriceRate:)];
    [addButton addGestureRecognizer:tapGesture];
    
    [_footerView addSubview:addButton];
    
    [self.view addSubview:_footerView];
    
}

/*
  Price Rateを追加する
*/
-(void)tapAddPriceRate:(UITapGestureRecognizer*)sender
{
    NSLog(@"add price rate tap!");
    
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
    セクション数
*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}


/*
    行数
*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 10;
}


/*
    セルの内容
*/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PriceRateCell *cell = (PriceRateCell *)[tableView dequeueReusableCellWithIdentifier:@"table_cell"];
    if (cell == nil) {// create cell
        cell = [[PriceRateCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"table_cell"];
    }
    
    cell.textLabel.text = @"hoge";
    return cell;
}

/*
    セルタップ時
*/
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"tap!");
}


/*
    ロード時に呼ばれてセルの内容を設定する　デザインとかはここで作っておく
*/
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    // For even
    if (indexPath.row % 2 == 0) {
        cell.backgroundColor = [UIColor whiteColor];
    }
    // For odd
    else {
        cell.backgroundColor = [UIColor colorWithHue:0.61
                                          saturation:0.09
                                          brightness:0.99
                                               alpha:1.0];
    }
}

@end
