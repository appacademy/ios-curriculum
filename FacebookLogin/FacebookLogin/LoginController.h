//
//  LogLogController.h
//  FacebookLogin
//
//  Created by Edward Ruggeri on 9/17/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginController : UIViewController
+(void)loginWithViewController:(UIViewController*)viewController
                 andCompletion:(void(^)(void))loginSuccessCompletion;
@end
