//
//  SingUpController.h
//  weather_app
//
//  Created by Vitaliy Heras on 1/11/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingUpController : UIViewController <UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *userLogo;
@property (weak, nonatomic) IBOutlet UITextField *userName;

@property (weak, nonatomic) IBOutlet UITextField *userLastName;
@property (weak, nonatomic) IBOutlet UITextField *userLocation;
@property (weak, nonatomic) IBOutlet UITextField *userEmail;
@property (weak, nonatomic) IBOutlet UITextField *userPassword;
- (IBAction)signUpBtn:(id)sender;
- (IBAction)signInBtn:(id)sender;
- (IBAction)userLogoAction:(id)sender;

- (IBAction)dismissKeybord:(id)sender;

@end
