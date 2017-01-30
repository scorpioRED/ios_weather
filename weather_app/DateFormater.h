//
//  DateFormater.h
//  weather_app
//
//  Created by Vitaliy Heras on 1/30/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateFormater : NSObject

+(NSString*)DateToFormat:(NSDate*)date FormatTo:(NSString*)format;
+(NSString*)ConvertFromEpoch:(id)epochTime toFormat:(NSString*)format;

@end
