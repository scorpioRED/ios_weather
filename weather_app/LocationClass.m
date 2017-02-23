//
//  LocationClass.m
//  weather_app
//
//  Created by Vitaliy Heras on 2/22/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import "LocationClass.h"


@implementation LocationClass

- (id)initWithCoordinats:(CLLocationManager *)locationData
{
    self = [super init];
    if (self) {
        self.lat = [NSString stringWithFormat:@"%f",locationData.location.coordinate.latitude];
        self.lon = [NSString stringWithFormat:@"%f",locationData.location.coordinate.longitude];
        
    }
    return self;
}

@end
