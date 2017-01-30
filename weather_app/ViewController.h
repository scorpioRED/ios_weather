//
//  ViewController.h
//  weather_app
//
//  Created by Vitaliy Heras on 1/11/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainContentViewController.h"

@interface ViewController : UIViewController <UIPageViewControllerDataSource>
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (weak, nonatomic) IBOutlet UILabel *cityName;
@property (weak, nonatomic) IBOutlet UILabel *currentCityTemp;
@property (weak, nonatomic) IBOutlet UIImageView *currentWeatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *humidity;
@property (weak, nonatomic) IBOutlet UILabel *wind;
@property (weak, nonatomic) IBOutlet UILabel *presure;
@property (weak, nonatomic) IBOutlet UILabel *chance;
@property (weak, nonatomic) IBOutlet UILabel *sunrice;
@property (weak, nonatomic) IBOutlet UILabel *sunset;
@property (weak, nonatomic) IBOutlet UILabel *maxTemp;
@property (weak, nonatomic) IBOutlet UILabel *minTemp;

- (IBAction)logOutBtn:(id)sender;

@end

