//
//  MainViewController.h
//  weather_app
//
//  Created by Vitaliy Heras on 2/15/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"
#import "City.h"
#import "WeatherClass.h"
#import "DataPassDelegate.h"

@interface MainViewController : UIViewController <UIPageViewControllerDataSource, DataPassDelegate>


@property (nonatomic,strong) UIPageViewController *PageViewController;

@property (nonatomic,strong) NSArray *arrPageTitles;

//@property (nonatomic,strong) NSString *cellIndex;


@property (nonatomic,strong) __block NSMutableArray *cities;

- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index;





- (IBAction)btnStartAgain:(id)sender;

@end
