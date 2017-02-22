//
//  PageContentViewController.h
//  weather_app
//
//  Created by Vitaliy Heras on 2/15/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"
#import "WeatherClass.h"


@interface PageContentViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property NSUInteger pageIndex;
@property NSString *imgFile;
@property NSString *txtTitle;

@property City *currenyCity;

- (IBAction)logOutBtn:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *currentDate;

@property (weak, nonatomic) IBOutlet UILabel *cityName;

@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;

@property (weak, nonatomic) IBOutlet UILabel *currentDay;
@property (weak, nonatomic) IBOutlet UILabel *currentMaxTemp;
@property (weak, nonatomic) IBOutlet UILabel *currentMinTemp;


@property (weak, nonatomic) IBOutlet UICollectionView *forcastCollections;

@property (weak, nonatomic) IBOutlet UILabel *maxCellLabel;
@property (weak, nonatomic) IBOutlet UILabel *minCellLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayCellLabel;

@end
