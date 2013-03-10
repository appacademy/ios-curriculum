//
//  AppDelegate.m
//  ViewsDemoProject
//
//  Created by Edward Ruggeri on 8/21/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "AppDelegate.h"
#import "LinesViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.window.backgroundColor = [UIColor whiteColor];
  
  self.window.rootViewController = [LinesViewController new];
  
  [self.window makeKeyAndVisible];
  return YES;
}

@end
