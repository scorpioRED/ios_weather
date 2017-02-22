//
//  TabelUiViewController.h
//  weather_app
//
//  Created by Vitaliy Heras on 2/22/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabelUiViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *citesTabel;


@end
