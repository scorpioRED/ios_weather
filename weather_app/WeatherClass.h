//
//  WeatherClass.h
//  weather_app
//
//  Created by Vitaliy Heras on 1/29/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherClass : NSObject
@property (nonatomic,strong) NSDate* date;
@property (nonatomic,strong) NSString* city;
@property (nonatomic,strong) NSObject* main;

@end
