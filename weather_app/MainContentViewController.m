//
//  MainContentViewController.m
//  weather_app
//
//  Created by Vitaliy Heras on 1/12/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import "MainContentViewController.h"

@interface MainContentViewController ()

@end

@implementation MainContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _cityName.text = self.titleText;
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

@end
