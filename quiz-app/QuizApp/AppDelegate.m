//
//  AppDelegate.m
//  QuizApp
//
//  Created by Edward Ruggeri on 7/11/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import "AppDelegate.h"
#import "QuizViewController.h"

@implementation AppDelegate

@synthesize window = _window;

-(BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
  self.window.rootViewController = [QuizViewController new];

  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  return YES;
}

@end
