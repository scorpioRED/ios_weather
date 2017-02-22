//
//  PageContentViewController.m
//  weather_app
//
//  Created by Vitaliy Heras on 2/15/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import "PageContentViewController.h"
#import "ForcastCell.h"
#import "DateFormater.h"
#import "MainViewController.h"

@interface PageContentViewController () {
   
}



@end

@implementation PageContentViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
//    self.forcastCollections.delegate = self;
    self.forcastCollections.dataSource = self;
    
    NSLog(@"quontity of forcast cell %lu",(unsigned long)[self.currenyCity.forcast count] -1);
    
    self.currentDate.text = [NSString stringWithFormat:@"%@",[DateFormater ConvertFromEpoch:self.currenyCity.currentWeather.date toFormat:@"dd.MM.yyyy"]];
    self.weatherIcon.image = [UIImage imageNamed:self.currenyCity.currentWeather.imgDescription];
    self.cityName.text = [NSString stringWithFormat:@"%@",self.currenyCity.name];
    self.temperatureLabel.text = [NSString stringWithFormat:@"%@",self.currenyCity.currentWeather.currentTemp];
    self.currentDay.text = [NSString stringWithFormat:@"%@",[DateFormater ConvertFromEpoch:self.currenyCity.currentWeather.date toFormat:@"EEEE"]];
    
    self.currentMaxTemp.text = [NSString stringWithFormat:@"%@",self.currenyCity.currentWeather.maxTemp];
    self.currentMinTemp.text = [NSString stringWithFormat:@"%@",self.currenyCity.currentWeather.minTemp];
    

    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.currenyCity.forcast count] - 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ForcastCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"dayCell" forIndexPath:indexPath];
    
    
    WeatherClass *weatherFromForcast = [[WeatherClass alloc] initWithForcastData:[self.currenyCity.forcast objectAtIndex:indexPath.row]];
    
    NSString *nameOfDay = [NSString stringWithFormat:@"%@",[DateFormater ConvertFromEpoch:weatherFromForcast.date toFormat:@"EEEE"]];
    
//    if ([nameOfDay isEqualToString:[NSString stringWithFormat:@"%@",[DateFormater ConvertFromEpoch:self.currenyCity.currentWeather.date toFormat:@"EEEE"]]]) {
//        
//        return nil;
//    }
//    else {
//        cell.forcastCellMaxTemp.text = [NSString stringWithFormat:@"%@",weatherFromForcast.maxTemp];
//        cell.forcastCellMinTemp.text = [NSString stringWithFormat:@"%@",weatherFromForcast.minTemp];
//        cell.forcastCellDayName.text = nameOfDay;
//        cell.forcastCellImg.image = [UIImage imageNamed:@"clouds"];
//        return cell;
//    }
    
    
    cell.forcastCellMaxTemp.text = [NSString stringWithFormat:@"%@",weatherFromForcast.maxTemp];
    cell.forcastCellMinTemp.text = [NSString stringWithFormat:@"%@",weatherFromForcast.minTemp];
    cell.forcastCellDayName.text = nameOfDay;
    cell.forcastCellImg.image = [UIImage imageNamed:weatherFromForcast.imgDescription];
    
    return cell;
    


}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)logOutBtn:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}
@end
