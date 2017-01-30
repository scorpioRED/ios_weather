//
//  MainContentViewController.h
//  weather_app
//
//  Created by Vitaliy Heras on 1/12/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *cityName;
@property NSUInteger *pageIndex;
@property NSString *titleText;

@end
