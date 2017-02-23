//
//  DataPassDelegate.h
//  weather_app
//
//  Created by Vitaliy Heras on 2/22/17.
//  Copyright © 2017 Vitaliy Heras. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataPassDelegate;

@interface DataPassDelegate : NSObject

@property (weak, nonatomic) id <DataPassDelegate> delegate;

@end

@protocol DataPassDelegate <NSObject>

@optional
-(id) PassData;
-(NSUInteger) PassIndex ;
-(void) GetIndex :(NSUInteger) cellIndex;

@end
