//
//  GangEngine.m
//  Pods
//
//  Created by Shabbir Vijapura on 7/13/13.
//
//

#import "GangEngine.h"
#import <UIColor+MLPFlatColors/UIColor+MLPFlatColors.h>

@implementation GangEngine

+ (GangEngine*)sharedEngine {
    static dispatch_once_t pred;
    static id DefaultInstance = nil;
    dispatch_once(&pred, ^{ DefaultInstance = [[self alloc] init]; });
    return DefaultInstance;
}

+ (AFHTTPClient *) clientWithBaseUrl:(NSURL *) url {
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:url];
    [client setDefaultHeader:@"Accept" value:@"application/json"];
    [client registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
	return client;
}

- (void)getCrimesForLocation:(CLLocationCoordinate2D)coordinate {
    AFHTTPClient *client = [GangEngine clientWithBaseUrl:[NSURL URLWithString:@"http://api.shabz.co"]];
    NSDictionary *paramaters = @{
                                 @"longitude" : @(coordinate.longitude),
                                 @"latitude"  : @(coordinate.latitude),
                                 @"miles" : @(0.8)
      };
    
    [client getPath:@"/hackathon/crime_info.php" parameters:paramaters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dict in responseObject) {
            Crime *crime = [[Crime alloc] init];
            crime.locationDescription = [dict objectForKey:@"location_description"];
            crime.crimeDescription = [dict objectForKey:@"primary_type"];
            crime.longitude = [[dict objectForKey:@"longitude"] doubleValue];
            crime.latitude = [[dict objectForKey:@"latitude"] doubleValue];
            [array addObject:crime];
        }
        
        if ([_delegate respondsToSelector:@selector(didloadCrimes:)])
            [_delegate didloadCrimes:array];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", operation.responseString);
        NSLog(@"%@", error.localizedDescription);
    }];
}

- (void)getGangAreas:(CLLocationCoordinate2D)coordinate {
    AFHTTPClient *client = [GangEngine clientWithBaseUrl:[NSURL URLWithString:@"http://192.168.43.218:3000"]];

    NSDictionary *paramaters = @{
                                 @"longitude" : @(coordinate.longitude),
                                 @"latitude"  : @(coordinate.latitude),
                                 @"miles" : @(0.8)
                                 };
    
    [client getPath:@"/gang_areas.json" parameters:paramaters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *responseArray = [responseObject objectForKey:@"response"];
        if (responseArray.count > 0) {
            NSDictionary *gangDict = [responseArray objectAtIndex:0];
            NSLog(@"%@", gangDict);
            Gang *gang = [[Gang alloc] init];
            gang.latitude = [[gangDict objectForKey:@"latitude"] doubleValue];
            gang.longitude = [[gangDict objectForKey:@"longitude"] doubleValue];
            gang.name = [gangDict objectForKey:@"name"];
            NSDictionary *dict = [gangDict objectForKey:@"gang"];

            if (dict) {
                NSLog(@"%@", dict);
                gang.gangDescription = [dict objectForKey:@"description"];
                gang.url = [dict objectForKey:@"url"];
                NSArray *colors = [[gangDict objectForKey:@"gang"] objectForKey:@"colors"];
                if (colors.count > 0) {
                    UIColor *color = [self colorFromString:[[colors objectAtIndex:0] objectForKey:@"name"]];
                    gang.gangColor = color;
                }
            }
            if ([_delegate respondsToSelector:@selector(didReceiveGang:)])
                [_delegate didReceiveGang:gang];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", operation.responseString);
        NSLog(@"%@", error.localizedDescription);
    }];
}

//- (PrimaryType)typeFromString:(NSString *)primaryType {
//    primaryType = [primaryType lowercaseString];
//    if ([primaryType isEqualToString:@"burglary"])
//        return PrimaryTypeBurglary;
//    else if ([primaryType isEqualToString:@"deceptive practice"])
//        return PrimaryTypeDeceptive;
//    else if ([primaryType isEqualToString:@"public peace violation"])
//        return PrimaryTypePublicPeace;
//    else if ([primaryType])
//}

- (UIColor *)colorFromString:(NSString *)colorString {
    colorString = [colorString lowercaseString];
    if ([colorString isEqualToString:@"blue"])
        return [UIColor flatBlueColor];
    else if ([colorString isEqualToString:@"black"])
        return [UIColor flatBlackColor];
    else if ([colorString isEqualToString:@"red"])
        return [UIColor flatRedColor];
    else if ([colorString isEqualToString:@"green"])
        return [UIColor flatGreenColor];
    else if ([colorString isEqualToString:@"gold"])
        return [UIColor colorWithRed:241/255.0f green:196/255.0f blue:15/255.0f alpha:1.0];
    
    return [UIColor flatGrayColor];
}

@end
