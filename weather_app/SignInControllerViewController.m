//
//  SignInControllerViewController.m
//  weather_app
//
//  Created by Vitaliy Heras on 1/11/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import "SignInControllerViewController.h"
//#import <QuartzCore/QuartzCore.h>

@interface SignInControllerViewController ()

@end

@implementation SignInControllerViewController

- (void)viewDidLoad {
    
    
    
    _logoImg.layer.cornerRadius = self.logoImg.frame.size.width / 2;
    _logoImg.clipsToBounds = YES;
    _logoImg.layer.borderWidth = 1.0f;
    _logoImg.layer.borderColor = [UIColor blackColor].CGColor;
    

//    _signInBtn.layer.cornerRadius = 20;
//    _signInBtn.clipsToBounds = YES;
//    _signInBtn.layer.borderWidth = 1.0f;
//    _signInBtn.layer.borderColor = [UIColor blueColor].CGColor;
    
    
    // Do any additional setup after loading the view.
    [super viewDidLoad];
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

- (IBAction)signInBtnAction:(id)sender {
    [self performSegueWithIdentifier:@"FromSignInToWeatherMainScreen" sender:self];
}

- (IBAction)signUpBtnAction:(id)sender {
}
@end
