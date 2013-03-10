//
//  AppDelegate.m
//  CoreAnimationDemo2
//
//  Created by Edward Ruggeri on 8/22/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "AppDelegate.h"
#import "SlidingBoxView.h"
#import "SpinningViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
//  self.window.rootViewController = [UIViewController new];
//  self.window.rootViewController.view = [SlidingBoxView new];
  self.window.rootViewController = [SpinningViewController new];
  
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  return YES;
}
@end
