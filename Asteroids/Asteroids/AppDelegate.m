//
//  AppDelegate.m
//  Asteroids
//
//  Created by Edward Ruggeri on 8/23/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "AppDelegate.h"

#import "AsteroidsView.h"

@implementation AppDelegate
-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
  [UIApplication sharedApplication].statusBarHidden = YES;
 
  self.window.rootViewController = [UIViewController new];
  self.window.rootViewController.view = [[AsteroidsView alloc] initWithFrame:self.window.bounds];
  
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  return YES;
}
@end
