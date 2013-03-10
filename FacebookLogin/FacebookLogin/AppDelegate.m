//
//  AppDelegate.m
//  FacebookLogin
//
//  Created by Edward Ruggeri on 9/16/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "AppDelegate.h"

#import "FacebookSDK.h"
#import "FriendsViewController.h"

@implementation AppDelegate
-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
  self.window.rootViewController = [FriendsViewController new];
    
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  return YES;
}

-(void)sessionStateChanged:(FBSession *)session
                     state:(FBSessionState) state
                     error:(NSError *)error {
  switch (state) {
    case FBSessionStateOpen:
      if (!error) {
        // We have a valid session
        NSLog(@"User session found");
      }
      break;
    case FBSessionStateClosed:
    case FBSessionStateClosedLoginFailed:
      [FBSession.activeSession closeAndClearTokenInformation];
      break;
    default:
      break;
  }
    
  if (error) {
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Error"
                              message:error.localizedDescription
                              delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
    [alertView show];
  }
}

-(void)applicationDidBecomeActive:(UIApplication *)application {
  // this means the user switched back to this app without completing
  // a login in Safari/Facebook App
  if (FBSession.activeSession.state == FBSessionStateCreatedOpening) {
    [FBSession.activeSession close]; // so we close our session and start over
  }
}

-(BOOL)openSessionWithAllowLoginUI:(BOOL)allowLoginUI
                    withCompletion:(void(^)(void))completion {
  return [FBSession openActiveSessionWithPermissions:nil
                                        allowLoginUI:allowLoginUI
                                   completionHandler:^(FBSession *session,
                                                       FBSessionState state,
                                                       NSError *error) {
                                     [self sessionStateChanged:session
                                                         state:state
                                                         error:error];
                                     if (state == FBSessionStateOpen)
                                       completion();
                                   }];
}

-(BOOL)application:(UIApplication *)application
           openURL:(NSURL *)url
 sourceApplication:(NSString *)sourceApplication
        annotation:(id)annotation {
  // attempt to extract a token from the url
  return [FBSession.activeSession handleOpenURL:url];
}

-(void)applicationWillTerminate:(UIApplication *)application {
  [FBSession.activeSession close];
}

@end
