//
//  AppDelegate.h
//  Gang
//
//  Created by Shabbir Vijapura on 7/13/13.
//
//

#import <UIKit/UIKit.h>
#import <AKTabBarController/AKTabBarController.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@property (strong, nonatomic) AKTabBarController *tabBarController;

@end
