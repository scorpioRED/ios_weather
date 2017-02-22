//
//  WeatherClass.h
//  weather_app
//
//  Created by Vitaliy Heras on 1/29/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherClass : NSObject
@property (nonatomic,strong) NSString* date;
@property (nonatomic, strong) NSString* imgDescription;
@property (nonatomic,strong) NSString* currentTemp;
@property (nonatomic, strong) NSString* maxTemp;
@property (nonatomic, strong) NSString* minTemp;
@property (nonatomic, strong) NSString* pressure;
@property (nonatomic, strong) NSString* humidity;
@property (nonatomic, strong) NSString* wind;
@property (nonatomic, strong) NSString* sunset;
@property (nonatomic, strong) NSString* sunrise;

- (id)initWithWeatherData :(NSDictionary*)responseData;
- (id)initWithForcastData: (NSDictionary*)responseData;


@end
