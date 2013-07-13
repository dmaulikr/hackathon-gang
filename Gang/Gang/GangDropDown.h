//
//  GangDropDown.h
//  Gang
//
//  Created by Shabbir Vijapura on 7/13/13.
//
//

#import <UIKit/UIKit.h>
#import "Gang.h"

@interface GangDropDown : UIView


@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) UITextView *descriptionTextView;
@property (nonatomic, assign) BOOL shown;
@property (nonatomic, strong) Gang *gang;

+ (void)showInView:(UIView *)view withGang:(Gang *)gang;
+ (void)showNOGangsLoadedInView:(UIView *)view;
+ (GangDropDown*)sharedDropdown;

@end
