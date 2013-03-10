//
//  AppDelegate.m
//  MessengerApp
//
//  Created by Edward Ruggeri on 8/20/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "AppDelegate.h"
#import "ListMessagesViewController.h"
#import "MessageStore.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  [MessageStore initializeMessageStore];
  
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
//  UITabBarController* rootTabBarController = [UITabBarController new];
  ListMessagesViewController* messagesVC = [ListMessagesViewController new];
  UINavigationController* messagesNavController = [[UINavigationController alloc] initWithRootViewController:messagesVC];
  self.window.rootViewController = messagesNavController;

  [self.window makeKeyAndVisible];
  return YES;
}

@end
