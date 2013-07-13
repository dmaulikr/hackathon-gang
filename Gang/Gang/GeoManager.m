//
//  GeoManager.m
//  Hackathon
//
//  Created by Shabbir Vijapura on 5/18/13.
//  Copyright (c) 2013 SMSVG. All rights reserved.
//

#import "GeoManager.h"

@interface GeoManager ()

@property (nonatomic, strong) CLLocation *previousLocation;

@end


@implementation GeoManager

+ (GeoManager *) sharedManager {
    static GeoManager *sharedManager = nil;
    @synchronized(self) {
        if (!sharedManager) {
            sharedManager = [[GeoManager alloc] init];
            sharedManager.locationManager = [[CLLocationManager alloc] init];
            sharedManager.locationManager.delegate = sharedManager;
        }
    }
    
    return sharedManager;
}

-(void) startMonitoring {
    if(![CLLocationManager locationServicesEnabled]) {
        return;
    }

    _locationManager.distanceFilter = 10.0f;
    _locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    [_locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    
}

-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    NSLog(@"%@", locations);
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        if ([_delegate respondsToSelector:@selector(locationDidChangeTo:)])
            [_delegate locationDidChangeTo:manager.location.coordinate];

    });
    
}

@end
