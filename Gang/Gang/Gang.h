//
//  Gang.h
//  Gang
//
//  Created by Shabbir Vijapura on 7/13/13.
//
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Gang : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) CLLocationDegrees longitude;
@property (nonatomic, assign) CLLocationDegrees latitude;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) UIColor *gangColor;
@property (nonatomic, strong) NSString *gangDescription;
@property (nonatomic, strong) NSString *url;

@end
