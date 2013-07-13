//
//  MapViewAnnotation.h
//  Gang
//
//  Created by Shabbir Vijapura on 7/13/13.
//
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapViewAnnotation : NSObject <MKAnnotation>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@end
