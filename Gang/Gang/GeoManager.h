//
//  GeoManager.h
//  Hackathon
//
//  Created by Shabbir Vijapura on 5/18/13.
//  Copyright (c) 2013 SMSVG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol GeoManagerDelegate <NSObject>

- (void)locationDidChangeTo:(CLLocationCoordinate2D)coordinate;

@end

@interface GeoManager : NSObject <CLLocationManagerDelegate>


@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, weak) id <GeoManagerDelegate> delegate;

+ (GeoManager *) sharedManager;
- (void) startMonitoring;

@end
