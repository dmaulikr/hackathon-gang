//
//  GangEngine.h
//  Pods
//
//  Created by Shabbir Vijapura on 7/13/13.
//
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import <CoreLocation/CoreLocation.h>
#import "Gang.h"
#import "Crime.h"

@protocol GangEngineDelegate <NSObject>
@optional
- (void)didReceiveGang:(Gang *)gang;
- (void)didloadCrimes:(NSArray *)crimes;
@end

@interface GangEngine : NSObject

@property (nonatomic, weak) id<GangEngineDelegate> delegate;

+ (GangEngine*)sharedEngine;

- (void)getCrimesForLocation:(CLLocationCoordinate2D)coordinate;
- (void)getGangAreas:(CLLocationCoordinate2D)coordinate;

@end
