//
//  AppDelegate.m
//  MapAnnotationDemo
//
//  Created by Edward Ruggeri on 8/15/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
  
  // create a view controller holding our map
  ViewController* mapViewController = [ViewController new];

  // create a navigation controller that "wraps" the map view controller.  The map view is at the base of the navigation hierarchy
  UINavigationController* navController = [[UINavigationController alloc] initWithRootViewController:mapViewController];
  
  // make the navigation the root controller of the application; the first controller that appears on screen
  self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
  
  return YES;
}

@end
