//
//  TabelUiViewController.m
//  weather_app
//
//  Created by Vitaliy Heras on 2/22/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import "TabelUiViewController.h"
#import "TableViewCell.h"
#import "MainViewController.h"

#import "City.h"
#import "DateFormater.h"

@interface TabelUiViewController () {
    NSUInteger cityIndex;
}

@end

@implementation TabelUiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
    self.citesTabel.delegate = self;
    self.citesTabel.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSUInteger) PassIndex {
    
     NSLog(@"CityIndex is - > %ld",(long)cityIndex);
    return cityIndex;
}

- (void)GetIndex:(NSUInteger)cellIndex {

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.cities count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableCitiesCell" forIndexPath:indexPath];
    
    City *city = [[City alloc]init];
    
    city = [self.cities objectAtIndex:indexPath.row];
    
    NSLog(@"%@ %@",city.name, [DateFormater ConvertFromEpoch:city.currentWeather.date toFormat:@"HH:mm"]);
    cell.timeLabe.text = [NSString stringWithFormat:@"%@",[DateFormater ConvertFromEpoch:city.currentWeather.date toFormat:@"HH:mm"]];
    cell.cityNameLabel.text = [NSString stringWithFormat:@"%@",city.name];
    cell.cityTempLabel.text = [NSString stringWithFormat:@"%@",city.currentWeather.currentTemp];

    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"Row is - > %ld",(long)indexPath.row);
    cityIndex = indexPath.row;
    NSLog(@"CityIndex is - > %ld",(long)cityIndex);
    
    
    
//    [self CloseModal];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)closeBtn:(UIButton *)sender {
    cityIndex = 0;
    NSLog(@"CityIndex is - > %ld",(long)cityIndex);
    [self CloseModal];
    
}

-(void)CloseModal {

    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
