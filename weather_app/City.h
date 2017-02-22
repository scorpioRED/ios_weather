//
//  City.h
//  weather_app
//
//  Created by Vitaliy Heras on 2/18/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherClass.h"

@interface City : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) WeatherClass *currentWeather;
@property (nonatomic, strong) NSArray *forcast;

- (id)initWithWeatherData :(NSDictionary*) responseData;

@end
