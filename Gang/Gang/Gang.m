//
//  Gang.m
//  Gang
//
//  Created by Shabbir Vijapura on 7/13/13.
//
//

#import "Gang.h"
#import <UIColor+MLPFlatColors/UIColor+MLPFlatColors.h>

@implementation Gang

- (id) init {
    self  = [super init];
    if (self) {
        self.gangColor = [UIColor flatGrayColor];
    }
    return self;
}

@end
