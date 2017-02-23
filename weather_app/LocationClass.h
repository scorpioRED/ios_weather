//
//  LocationClass.h
//  weather_app
//
//  Created by Vitaliy Heras on 2/22/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocationManager.h"

@interface LocationClass : NSObject

@property (strong, nonatomic) NSString *lat;
@property (strong, nonatomic) NSString *lon;

- (id)initWithCoordinats:(CLLocationManager *)locationData;

@end
