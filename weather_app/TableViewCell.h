//
//  TableViewCell.h
//  weather_app
//
//  Created by Vitaliy Heras on 2/22/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *timeLabe;
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityTempLabel;

@end
