//
//  SignInControllerViewController.h
//  weather_app
//
//  Created by Vitaliy Heras on 1/11/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignInControllerViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *logoImg;
@property (weak, nonatomic) IBOutlet UITextField *emailDta;
@property (weak, nonatomic) IBOutlet UITextField *passwordData;

@property (weak, nonatomic) IBOutlet UIButton *signInBtn;

- (IBAction)signInBtnAction:(id)sender;
- (IBAction)signUpBtnAction:(id)sender;

@end
