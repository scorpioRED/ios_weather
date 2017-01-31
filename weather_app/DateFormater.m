//
//  DateFormater.m
//  weather_app
//
//  Created by Vitaliy Heras on 1/30/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import "DateFormater.h"

@implementation DateFormater

+(NSString*)DateToFormat:(NSDate*)date FormatTo:(NSString*)format {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSString *formatString = format;
    [formatter setDateFormat:formatString];
    NSString *formatedDate = [formatter stringFromDate:date];
    return formatedDate;



}

+(NSString*)ConvertFromEpoch:(id)epochTime toFormat:(NSString*)format{

    NSString* epoch = [NSString stringWithFormat:@"%@",epochTime];

    NSTimeInterval seconds = [epoch doubleValue];
    
    NSDate *epochNSDate = [[NSDate alloc] initWithTimeIntervalSince1970:seconds];

    NSString* dateToReturn = [self DateToFormat:epochNSDate FormatTo:format];
    
    return dateToReturn;
    
}

@end
