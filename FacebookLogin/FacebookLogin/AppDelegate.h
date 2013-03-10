//
//  AppDelegate.h
//  FacebookLogin
//
//  Created by Edward Ruggeri on 9/16/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import <UIKit/UIKit.h>

// http://developers.facebook.com/docs/reference/iossdk/authentication/
// http://developers.facebook.com/docs/sdk-reference/iossdk/3.0/
// https://developers.facebook.com/docs/reference/api/

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;

-(BOOL)openSessionWithAllowLoginUI:(BOOL)allowLoginUI
                    withCompletion:(void(^)(void))completion;
@end
