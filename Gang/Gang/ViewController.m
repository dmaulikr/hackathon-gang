//
//  ViewController.m
//  Gang
//
//  Created by Shabbir Vijapura on 7/13/13.
//
//

#import "ViewController.h"
#import "GangDropDown.h"
#import <UIColor+MLPFlatColors/UIColor+MLPFlatColors.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [GeoManager sharedManager].delegate = self;
    crimes = [NSMutableArray new];
    
    mkMapView.delegate = self;
    
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    
    
    [mkMapView showsUserLocation];
    [super viewDidAppear:YES];
}

- (void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views
{
	MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(mkMapView.userLocation.coordinate, 1500, 1500);
	[mv setRegion:region animated:YES];
}

- (void)locationDidChangeTo:(CLLocationCoordinate2D)coordinate {
    [GangEngine sharedEngine].delegate = self;
    [[GangEngine sharedEngine] getGangAreas:coordinate];
    [[GangEngine sharedEngine] getCrimesForLocation:coordinate];
    mkMapView.showsUserLocation = YES;

//    MKMapRect zoomRect = MKMapRectNull;
//    MKMapPoint annotationPoint = MKMapPointForCoordinate(coordinate);
//    MKMapRect pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 1.0, 1.0);
//    if (MKMapRectIsNull(zoomRect)) {
//        zoomRect = pointRect;
//    } else {
//        zoomRect = MKMapRectUnion(zoomRect, pointRect);
//    }
//    [mkMapView setVisibleMapRect:zoomRect animated:YES];
}

- (void)didReceiveGang:(Gang *)gang {
    [GangDropDown showInView:self.view withGang:gang];
}

- (void)didloadCrimes:(NSArray *)crimes_ {
    [crimes removeAllObjects];
    [crimes addObjectsFromArray:crimes_];
    
    [mkMapView removeAnnotations:[mkMapView annotations]];

    for (Crime *crime in crimes) {
        MapViewAnnotation *newAnnotation = [[MapViewAnnotation alloc] init];
        newAnnotation.title = crime.crimeDescription;
        CLLocationCoordinate2D coordinate;
        coordinate.latitude = crime.latitude;
        coordinate.longitude = crime.longitude;
        newAnnotation.coordinate = coordinate;
        [mkMapView addAnnotation:newAnnotation];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Setting the image of the tab.
- (NSString *)tabImageName
{
    return @"06-map-pin";
}

// Setting the title of the tab.
- (NSString *)tabTitle
{
    return @"Map";
}

@end
