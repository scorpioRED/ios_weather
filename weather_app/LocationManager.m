//
//  LocationManager.m
//  weather_app
//
//  Created by Vitaliy Heras on 1/29/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import "LocationManager.h"

@implementation LocationManager {
    CLLocationManager *locationManager;
}


+ (instancetype)shartedManager {
    static LocationManager *manager = nil;
    static dispatch_once_t token;
    dispatch_once(&token,^{
        manager = [[LocationManager alloc] init];
    });
    
    return manager;
}

- (NSDictionary*) getCurrentLocation {
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = 200;
    [locationManager requestAlwaysAuthorization];
    
    
    
    [locationManager startUpdatingLocation];
    
    
    NSDictionary *location = @{@"lat":[NSString stringWithFormat:@"%f",locationManager.location.coordinate.latitude],@"lon":[NSString stringWithFormat:@"%f",locationManager.location.coordinate.longitude]};
    
    
    return location;
}


@end
