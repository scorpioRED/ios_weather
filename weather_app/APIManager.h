//
//  APIManager.h
//  weather_app
//
//  Created by Vitaliy Heras on 1/29/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIManager : NSObject

+ (instancetype)shartedManager;


//- (NSDictionary*) getWeather : (NSDictionary*) options;

-(void) getWeather : (NSDictionary*)options
          url: (NSString*)url
          onSuccess:(void(^)(NSDictionary* result))success
          onFailure:(void(^)(NSError *error, NSInteger stausCode))failure;



@end
