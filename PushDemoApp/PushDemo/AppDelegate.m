//
//  AppDelegate.m
//  PushDemo
//
//  Created by Edward Ruggeri on 9/16/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "AppDelegate.h"

#import "RestKit.h"

@interface AppDelegate ()
@property (strong) RKClient* pingClient;
@end

@implementation AppDelegate

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
  self.pingClient = [RKClient clientWithBaseURLString:@"http://aa-ping-app.herokuapp.com/"];
  
  // "badge" is a number to appear with the screen icon
  // "sound" will play a system sound
  // "alert" will show a message
  [[UIApplication sharedApplication] registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge|UIRemoteNotificationTypeSound|UIRemoteNotificationTypeAlert];
  
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  return YES;
}

-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
  NSLog(@"Initiating token registration!");
  
  [self.pingClient post:@"/apns_tokens.json" usingBlock:^(RKRequest *request) {
    request.params = @{
      @"apns_token" : @{
        @"token" : [deviceToken description]
      }
    };
    
    request.onDidLoadResponse = ^(RKResponse* response) {
      NSLog(@"Token registration succeeded!");
      NSLog(@"%@", [response parsedBody:nil]);
    };
    
    request.onDidFailLoadWithError = ^(NSError* error) {
      NSLog(@"Token registration failed: %@", error);
    };
  }];
}

-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
  NSLog(@"Received notification: %@", userInfo);
}

@end
