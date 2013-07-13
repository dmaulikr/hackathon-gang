//
//  Crime.h
//  Gang
//
//  Created by Shabbir Vijapura on 7/13/13.
//
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef enum {
    PrimaryTypeBattery,
    PrimaryTypeTheft,
    PrimaryTypeCriminalDamage,
    PrimaryTypeOtherOffense,
    PrimaryTypeRobbery,
    PrimaryTypeMotorVehicleTheft,
    PrimaryTypeWeapons,
    PrimaryTypeDeceptive,
    PrimaryTypeCriminal,
    PrimaryTypeNarcotics,
    PrimaryTypeBurglary,
    PrimaryTypeAssault,
    PrimaryTypeArson,
    PrimaryTypeProstitution,
    PrimaryTypeLiquor,
    PrimaryTypePublicPeace,
    PrimaryTypeIntimidation,
    PrimaryTypeGambling,
    PrimaryTypeCrimSexual,
    PrimaryTypeOffenseInvolvingChildren,
    PrimaryTypeSexOffense,
    PrimaryTypeHomicide,
    PrimaryTypeInterferencePublicOfficer
} PrimaryType;


@interface Crime : NSObject

@property (nonatomic, assign) PrimaryType type;
@property (nonatomic, strong) NSString *locationDescription;
@property (nonatomic, strong) NSString *crimeDescription;
@property (nonatomic, assign) CLLocationDegrees latitude;
@property (nonatomic, assign) CLLocationDegrees longitude;

@end
