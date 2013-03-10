//
//  AppDelegate.m
//  ParseDemo
//
//  Created by Edward Ruggeri on 8/10/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import "AppDelegate.h"

#import <Parse/Parse.h>
#import "ViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  // Override point for customization after application launch.
  self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
  self.window.rootViewController = self.viewController;
  [self.window makeKeyAndVisible];
  
  [self initializeParse];
  return YES;
}

-(void)initializeParse {
  [Parse setApplicationId:@"KjTOYai4s8RaQq4CTUj0RR7fcIjAJrHn8oGPhGqL" clientKey:@"8gmXwZFrizjMhg2vHEgVJKYosLcTnMoSxagZXLeV"];
}

@end
