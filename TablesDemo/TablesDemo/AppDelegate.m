//
//  AppDelegate.m
//  TablesDemo
//
//  Created by Edward Ruggeri on 8/17/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import "AppDelegate.h"
#import "PresidentsTableViewController.h"

@implementation AppDelegate

@synthesize window = _window;

-(BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

  // Override point for customization after application launch.
  self.window.rootViewController = [PresidentsTableViewController new];

  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  return YES;
}

@end
