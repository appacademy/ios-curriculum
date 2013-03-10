//
//  AppDelegate.m
//  VideoDemo
//
//  Created by Edward Ruggeri on 9/1/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "AppDelegate.h"

#import <Parse/Parse.h>
#import "VideosViewController.h"

@implementation AppDelegate
-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
  [Parse setApplicationId:@"yIlxQsWgB9xuuQHZuVUtvR8WiqwVeejN1XvYo9Ks"
                clientKey:@"6KN6qsDe2RY5YSkJTiGez8R0qMgosATr9rIXToS4"];

  self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[VideosViewController new]];
  
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  return YES;
}
@end
