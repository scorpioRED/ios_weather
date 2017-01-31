//
//  ForcastCollectionViewController.m
//  weather_app
//
//  Created by Vitaliy Heras on 1/29/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import "ForcastCollectionViewController.h"
#import "ForcastCollectionViewCell.h"
#import "APIManager.h"
#import "DateFormater.h"
#import "LocationManager.h"

@interface ForcastCollectionViewController () {
    NSArray *photos;
    NSMutableArray *days;
    
}

@end

@implementation ForcastCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
static NSString * const URL = @"forecast/daily";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self fetcForcast];
    photos = @[@"cloudsSun",@"cloudsRain",@"clouds"];
//    days = [[NSMutableArray alloc]init];
    days = [NSMutableArray arrayWithObjects:@"0",@"0",@"0",@"0",@"0",@"0",@"0", nil];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark -- HTTP Request --

-(void)fetcForcast {

    NSDictionary* location = [[LocationManager shartedManager] getCurrentLocation];
    NSMutableDictionary *requestOptions = [[NSMutableDictionary alloc]initWithDictionary:location];
    requestOptions[@"cnt"] = @"7";
    
    [[APIManager shartedManager]getWeather:requestOptions url:URL onSuccess:^(NSDictionary *result) {
//        NSLog(@"----- 7 days result is %@",result);
//        NSLog(@"+++ 1 %@",result[@"list"][6][@"pressure"]);
        NSLog(@"+++ count %d",[result[@"list"] count]);
        for (int i = 0; i < [result[@"list"] count]; i++) {
            NSLog(@"^^^^^^ DAY  %d - %@",i,result[@"list"][i]);
            [days replaceObjectAtIndex:i withObject:result[@"list"][i]];
        };
//        for (NSDictionary* day in result[@"list"]) {
//            NSLog(@"^^^^^^ DAY humidity %@",day[@"humidity"]);
//            
////            [days addObject:day];
//            
//        };
        
        [self.collectionView reloadData];
        
    } onFailure:^(NSError *error, NSInteger stausCode) {
        NSLog(@" ------ 7 days ERRROOOO!! %@ %ld", error, (long)stausCode);
    }];
    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return [days count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@" --- RENDER collection view");
    
//    static NSString* Cellid = @"cellDay";
    
    ForcastCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellDay" forIndexPath:indexPath];
    cell.imgForcast.image = [UIImage imageNamed:@"cloudsSun"];
    
    if ([[days objectAtIndex:indexPath.row] isKindOfClass:[NSDictionary class]]) {
//        NSLog(@" ++++++++++++++++++++++++IS OBJECCCTTT");
        NSString *day =[DateFormater ConvertFromEpoch:[days objectAtIndex:indexPath.row][@"dt"] toFormat:@"EEEE"];
//        NSLog(@"TMMP --> number is  %@",day);
        cell.maxTemp.text = [NSString stringWithFormat:@"%@",[days objectAtIndex:indexPath.row][@"temp"][@"max"]];
        cell.minTemp.text = [NSString stringWithFormat:@"%@",[days objectAtIndex:indexPath.row][@"temp"][@"min"]];
        cell.dayForcast.text = [NSString stringWithFormat:@"%@",day];
        
        
        
    }else{
        cell.dayForcast.text = @"day";
    }
    
    
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
