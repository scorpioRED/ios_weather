//
//  MainViewController.m
//  weather_app
//
//  Created by Vitaliy Heras on 2/15/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import "MainViewController.h"
#import "APIManager.h"

@interface MainViewController () {
    NSMutableArray* _citiesRequest;
}


@end




@implementation MainViewController

NSString *tst = @"ForTest";

@synthesize PageViewController;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _cities = [[NSMutableArray alloc]init];
    
    _citiesRequest = [NSMutableArray arrayWithObjects:@{@"q":@"Prague"},@{@"q":@"London"},@{@"q":@"Barcelona"}, nil];
    
    NSDictionary *requestOption = @{@"q":@"Lviv"};
    
    [_citiesRequest addObject:requestOption];
    
    NSLog(@"HEre is city to req %@", _citiesRequest);
    
    APIManager * api =  [APIManager shartedManager];
    
    dispatch_apply([_citiesRequest count], dispatch_get_global_queue(0, 0), ^(size_t i) {
        
        NSLog(@"i in loop is %zu",i);
        
        [api getWeather:_citiesRequest[i] url:@"weather" onSuccess:^(City *city) {
            
            NSLog(@"i in loop and API is %zu",i);
            NSLog(@"\n here is name %@ and %@ temp in BossController",city.name, city.currentWeather.currentTemp);
            
            [api getForcast:_citiesRequest[i] url:@"forecast/daily" onSuccess:^(NSDictionary *forcast) {

                city.forcast = forcast[@"list"];
                NSLog(@"City name & forcast -> %@ --------- %@",city.name, city.forcast);
                
                [_cities addObject:city];
                
                if ([_cities count] == [_citiesRequest count]){
                    //SORT ME AND LIKE I GET
                    [self CreatePageViewWithData];
                }
                
            } onFailure:^(NSError *error, NSInteger stausCode) {
                NSLog(@"erroorr");
            }];
            
        } onFailure:^(NSError *error, NSInteger stausCode) {
            NSLog(@" ------ in BigBoss  ERRROOOO!! %@ %ld", error, (long)stausCode);
        }];
    });
    
    NSLog(@"CITIES -> %@",_cities);
}



-(void) CreatePageViewWithData {
    
    // Create page view controller
    self.PageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.PageViewController.dataSource = self;
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.PageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.PageViewController.view.frame = CGRectMake(0, 0 , self.view.frame.size.width, self.view.frame.size.height - 20);
    NSLog(@"Size is -> %f",self.view.frame.size.height);
    [self addChildViewController:PageViewController];
    [self.view addSubview:PageViewController.view];
    [self.PageViewController didMoveToParentViewController:self];
    NSLog(@"controllers has ben created");


}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSArray *)PassData {
    
    NSLog(@"Ruuned in MAinView Delegate Method cities Request is %@ and %@", _citiesRequest,tst);
    
    NSLog(@"Ruuned in MAinView Delegate Method cities is %@", self.cities);
    
    
    return self.cities;
}


#pragma mark - Page View Datasource Methods
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound))
    {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound)
    {
        return nil;
    }
    
    index++;
//    if (index == [self.arrPageTitles count])
    if (index == [self.cities count])
    {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

#pragma mark - Other Methods
- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.cities count] == 0) || (index >= [self.cities count])) {
        return nil;
    }

    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];

    pageContentViewController.currenyCity = self.cities[index];
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}

#pragma mark - No of Pages Methods
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.cities count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

- (IBAction)btnStartAgain:(id)sender
{
    [self setFirst];
}



- (void) setFirst {
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.PageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
