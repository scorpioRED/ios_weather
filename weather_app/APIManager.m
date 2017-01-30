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



-(void) getForcast : (NSDictionary*)options
          onSuccess:(void(^)(NSDictionary* result))success
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
    
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://api.openweathermap.org/data/2.5/weather"
      parameters:param
         success:^(NSURLSessionTask *operation, id responseObject) {
             //             NSLog(@"JSON: %@", responseObject);
             
             //             NSLog(@"temp is  - %@",responseObject[@"main"]);
             success(responseObject);
             //             weather = responseObject;
             
             //             weather = [NSDictionary dictionaryWithDictionary:responseObject];
         }failure:^(NSURLSessionTask *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }
     ];
    
    
    
    
    //    NSDictionary *answer = [[NSDictionary alloc]init];
    //    return weather;
    
    
}



@end
