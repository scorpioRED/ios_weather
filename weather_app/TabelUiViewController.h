//
//  TabelUiViewController.h
//  weather_app
//
//  Created by Vitaliy Heras on 2/22/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataPassDelegate.h"

@interface TabelUiViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

- (IBAction)closeBtn:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UITableView *citesTabel;
@property (strong, nonatomic) NSArray *cities;

@property (assign, nonatomic) NSUInteger cellIndex;


@end
