//
//  WeatherClass.m
//  weather_app
//
//  Created by Vitaliy Heras on 1/29/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import "WeatherClass.h"

@implementation WeatherClass


- (id)initWithWeatherData:(NSDictionary*)responseData

{
    self = [super init];
    if (self) {
        self.date = responseData[@"dt"];
        self.imgDescription = responseData[@"weather"][0][@"main"];
        self.currentTemp = responseData[@"main"][@"temp"];
        self.maxTemp = responseData[@"main"][@"temp_max"];
        self.minTemp = responseData[@"main"][@"temp_min"];
        self.pressure = responseData[@"main"][@"pressure"];
        self.humidity = responseData[@"main"][@"humidity"];
        self.wind = responseData[@"speed"];
        self.sunset= responseData[@"sys"][@"sunset"];
        self.sunrise = responseData[@"sys"][@"sunrise"];
        
    }
    return self;
}


- (id)initWithForcastData: (NSDictionary*)responseData

{
    self = [super init];
    if (self) {
        self.date = responseData[@"dt"];
        self.imgDescription = responseData[@"weather"][0][@"main"];
        self.currentTemp = responseData[@"temp"][@"day"];
        self.maxTemp = responseData[@"temp"][@"max"];
        self.minTemp = responseData[@"temp"][@"min"];
        self.pressure = responseData[@"pressure"];
        self.humidity = responseData[@"humidity"];
        self.wind = responseData[@"speed"];

    }
    return self;
}

@end


//_dateLabel.text = [DateFormater ConvertFromEpoch:weatherresponseData[@"dt"] toFormat:@"DD.MM.YYYY"];
//_cityName.text = [NSString stringWithFormat:@"%@",weatherresponseData[@"name"]];
//_currentCityTemp.text = [NSString stringWithFormat:@"%@",weatherresponseData[@"main"][@"temp"]];
//_humidity.text = [NSString stringWithFormat:@"%@",weatherresponseData[@"main"][@"humidity"]];
//_presure.text = [NSString stringWithFormat:@"%@",weatherresponseData[@"main"][@"pressure"]];
//_wind.text = [NSString stringWithFormat:@"%@",weatherresponseData[@"wind"][@"speed"]];
//_maxTemp.text = [NSString stringWithFormat:@"%@",weatherresponseData[@"main"][@"temp_max"]];
//_minTemp.text = [NSString stringWithFormat:@"%@",weatherresponseData[@"main"][@"temp_min"]];
//_todayLabel.text = [DateFormater ConvertFromEpoch:weatherresponseData[@"dt"] toFormat:@"EEEE"];
