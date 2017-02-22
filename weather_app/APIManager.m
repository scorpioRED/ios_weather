//
//  APIManager.m
//  weather_app
//
//  Created by Vitaliy Heras on 1/29/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import "APIManager.h"
#import <AFNetworking.h>


@implementation APIManager

static NSString *APPID = @"709b026b19ba8645e4a2ebe367e730c3";


+ (instancetype)shartedManager {
    static APIManager *manager = nil;
    static dispatch_once_t token;
    dispatch_once(&token,^{
        manager = [[APIManager alloc] init];
    });
    
    return manager;
}



-(void) getWeather : (NSDictionary*)options
                url:(NSString*)url
          onSuccess:(void(^)(City* city))success
          onFailure:(void(^)(NSError *error, NSInteger stausCode))failure
{
    
    
    
    
    
    NSLog(@" options is -- %@",options[@"q"]);
    
    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"metric",@"units",APPID,@"APPID", nil];
    
    // add params
    for (NSString *key in options) {
        NSString *value = options[key];
        NSLog(@"Value: %@ for key: %@", value, key);
        param[key] = value;
        
        
    }
    
    NSString* requestURL =[NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/%@", url]; // weather or forcast
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:requestURL
      parameters:param
         success:^(NSURLSessionTask *operation, id responseObject) {
             
             NSLog(@"img desc %@", responseObject[@"weather"]);
             
             NSLog(@"img desc %@", responseObject[@"weather"][0][@"main"]);
             
             
             City * city = [[City alloc] initWithWeatherData:responseObject];
             
            
             success(city);
             
         }failure:^(NSURLSessionTask *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }
     ];
    
    
    
}



-(void) getForcast : (NSDictionary*)options
                url:(NSString*)url
          onSuccess:(void(^)(NSDictionary* forcast))success
          onFailure:(void(^)(NSError *error, NSInteger stausCode))failure
{
    
    
    
    
    
    NSLog(@" options is -- %@",options[@"q"]);
    
    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"metric",@"units",APPID,@"APPID", nil];
    
    // add params
    for (NSString *key in options) {
        NSString *value = options[key];
        NSLog(@"Value: %@ for key: %@", value, key);
        param[key] = value;
        
        
    }
    
    NSString* requestURL =[NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/%@", url]; // weather or forcast
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:requestURL
      parameters:param
         success:^(NSURLSessionTask *operation, id responseObject) {
            
             
             success(responseObject);
             
         }failure:^(NSURLSessionTask *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }
     ];
    
    
    
}


@end
