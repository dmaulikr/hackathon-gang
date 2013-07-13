//
//  ViewController.h
//  Gang
//
//  Created by Shabbir Vijapura on 7/13/13.
//
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "GangDropDown.h"
#import "GangEngine.h"
#import "GeoManager.h"
#import <MapKit/MapKit.h>
#import "MapViewAnnotation.h"

@interface ViewController : UIViewController <GeoManagerDelegate, GangEngineDelegate, MKMapViewDelegate> {
    IBOutlet MKMapView *mkMapView;
    NSMutableArray *crimes;
    
}

@end
