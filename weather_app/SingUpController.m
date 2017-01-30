//
//  SingUpController.m
//  weather_app
//
//  Created by Vitaliy Heras on 1/11/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import "SingUpController.h"

@interface SingUpController ()

@end

@implementation SingUpController

- (void)viewDidLoad {
    
    _userLogo.layer.cornerRadius = self.userLogo.frame.size.width / 2;
    _userLogo.clipsToBounds = YES;
    _userLogo.layer.borderWidth = 1.0f;
    _userLogo.layer.borderColor = [UIColor grayColor].CGColor;
    
    [super viewDidLoad];
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

- (IBAction)signUpBtn:(id)sender {
    [self performSegueWithIdentifier:@"WeatherMainScreen" sender:self];
}

- (IBAction)signInBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)userLogoAction:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"Choise image source" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Library",@"Camera", nil];
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    void (^imgBlock)(BOOL) = ^(BOOL isLibrary) {
        UIImagePickerController* imgController = [[UIImagePickerController alloc]init];
        imgController.delegate = self;
        imgController.sourceType = isLibrary ? UIImagePickerControllerSourceTypePhotoLibrary : UIImagePickerControllerSourceTypeCamera;
        imgController.allowsEditing = YES;
        [self presentViewController:imgController animated:YES completion:nil];
    };

    if (buttonIndex == 0) {
        imgBlock(YES);
    } else if (buttonIndex == 1) {
        imgBlock(NO);
    }
    
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage* image = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    _userLogo.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)dismissKeybord:(id)sender {
    [self resignFirstResponder];
}


@end
