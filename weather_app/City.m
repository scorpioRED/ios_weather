//
//  City.m
//  weather_app
//
//  Created by Vitaliy Heras on 2/18/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import "City.h"

@implementation City


- (id)initWithWeatherData :(NSDictionary*) responseData
{
    self = [super init];
    if (self) {
        self.name = responseData[@"name"];
        WeatherClass *weather = [[WeatherClass alloc]initWithWeatherData:responseData];
        self.currentWeather = weather;
//        NSLog(@"from int data TMP %@ and TMP result %@", responseData[@"main"][@"temp"], self.currentWeather.currentTemp);
//        self.currentWeather.date = responseData[@"dt"];
////        self.currentWeather.imgDescription = responseData[@"weather"][@"main"];
//        self.currentWeather.currentTemp = responseData[@"main"][@"temp"];
//        NSLog(@"from int data TMP %@ and TMP result", responseData[@"main"][@"temp"], self.currentWeather.currentTemp);
//        self.currentWeather.maxTemp = responseData[@"main"][@"temp_max"];
//        self.currentWeather.minTemp = responseData[@"main"][@"temp_min"];
//        self.currentWeather.pressure = responseData[@"main"][@"pressure"];
//        self.currentWeather.humidity = responseData[@"main"][@"humidity"];
//        self.currentWeather.wind = responseData[@"speed"];
//        self.currentWeather.sunset= responseData[@"sys"][@"sunset"];
//        self.currentWeather.sunrise = responseData[@"sys"][@"sunrise"];
    }
    return self;
}


@end
