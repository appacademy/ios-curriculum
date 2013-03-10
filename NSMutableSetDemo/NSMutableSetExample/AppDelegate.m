//
//  AppDelegate.m
//  NSMutableSetExample
//
//  Created by Edward Ruggeri on 9/6/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "AppDelegate.h"
#import "GridPosition.h"

@implementation AppDelegate

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
  NSMutableSet* positions = [NSMutableSet new];
  
  GridPosition* gp1 = [GridPosition new];
  gp1.row = 3;
  gp1.col = 4;
  [positions addObject:gp1];
  [positions addObject:gp1];
  
//  GridPosition* gp2 = [GridPosition new];
//  gp2.row = 3;
//  gp2.col = 4;
//  [positions addObject:gp2];
  
  NSLog(@"%@", positions);
  
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  return YES;
}

@end
