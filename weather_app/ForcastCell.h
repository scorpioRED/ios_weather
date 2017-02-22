//
//  ForcastCell.h
//  weather_app
//
//  Created by Vitaliy Heras on 2/17/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForcastCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *forcastCellImg;

@property (weak, nonatomic) IBOutlet UILabel *forcastCellMaxTemp;
@property (weak, nonatomic) IBOutlet UILabel *forcastCellMinTemp;

@property (weak, nonatomic) IBOutlet UILabel *forcastCellDayName;

@end
