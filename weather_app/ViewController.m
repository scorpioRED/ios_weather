//
//  ViewController.m
//  weather_app
//
//  Created by Vitaliy Heras on 1/11/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import "ViewController.h"
#import "LocationManager.h"
#import "APIManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _currentWeatherIcon.image = [UIImage imageNamed:@"cloudsRain"];
    
    NSDictionary *requestOptions;
    __block NSDictionary *weatherData;
    
    
    NSDictionary* location = [[LocationManager shartedManager] getCurrentLocation];
    NSString *position =[NSString stringWithFormat:@"lat %@ and lon %@",location[@"lat"],location[@"lon"]];
    
    NSLog(@"position is -- %@",position);
    
    requestOptions = [[LocationManager shartedManager]getCurrentLocation];
    
    APIManager* weatherManager = [[APIManager alloc]init];
    
    [weatherManager getForcast:requestOptions onSuccess:^(NSDictionary *result) {
        NSLog(@"temp is %@", result[@"main"][@"temp"]);
        weatherData = result;
        NSLog(@"weather in block %@",weatherData);
        _cityName.text = [NSString stringWithFormat:@"%@",weatherData[@"name"]];
        _currentCityTemp.text =[NSString stringWithFormat:@"%@",weatherData[@"main"][@"temp"]];
        _humidity.text = [NSString stringWithFormat:@"%@",weatherData[@"main"][@"humidity"]];
        _presure.text = [NSString stringWithFormat:@"%@",weatherData[@"main"][@"pressure"]];
        _wind.text = [NSString stringWithFormat:@"%@",weatherData[@"wind"][@"speed"]];
        _maxTemp.text = [NSString stringWithFormat:@"%@",weatherData[@"main"][@"temp_max"]];
        _minTemp.text = [NSString stringWithFormat:@"%@",weatherData[@"main"][@"temp_min"]];
        
        
    } onFailure:^(NSError *error, NSInteger stausCode) {
        NSLog(@"errors is - %@ %ld", error, (long)stausCode);
    }];
    
    NSLog(@"weather data is %@",weatherData);
    
    
    
    
    
//    _pageTitles = @[@"Lviv",@"Kyiv",@"London",@"Paris"];
//    
//    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
//    self.pageViewController.dataSource = self;
//    
//    MainContentViewController *startingViewController = [self objectInPageViewControllerAtIndex:0];
//    
//    NSArray *viewControllers = @[startingViewController];
//    
//    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
//    
//    self.pageViewController.view.frame = CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height - 30);
//    [self addChildViewController:_pageViewController];
//    [self.view addSubview:_pageViewController.view];
//    [self.pageViewController didMoveToParentViewController:self];
//    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)logOutBtn:(id)sender {
    [self performSegueWithIdentifier:@"SignIn" sender:self];
}


#pragma mark - Page Controller Data Source --
//
//-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
//    
//    NSInteger *index = ((MainContentViewController*) viewController).pageIndex;
//    if ((index == 0) || (index == NSNotFound)) {
//        return nil;
//    }
//    index --;
//    return [self objectInPageViewControllerAtIndex:index];
//}
//
//
//-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
//    
//    NSInteger *index = ((MainContentViewController*) viewController).pageIndex;
//    if (index == NSNotFound) {
//        return nil;
//    }
//    index ++;
//    
//    if (index == [self.pageTitles count]) {
//        return nil;
//    }
//    
//    return [self objectInPageViewControllerAtIndex:index];
//}
//
//- (MainContentViewController*) objectInPageViewControllerAtIndex:(NSUInteger)index {
//    if ((self.pageTitles) == 0 || (index >= [self.pageTitles count])) {
//        return nil;
//    }
//    MainContentViewController * mainContentController = [self.storyboard instantiateViewControllerWithIdentifier:@"MainContentViewController"];
//    
//    mainContentController.titleText = self.pageTitles[index];
//    mainContentController.pageIndex = index;
//    
//    return mainContentController;
//}
//
//-(NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
//    return [self.pageTitles count];
//}
//
//-(NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController{
//    return 0;
//}

@end
