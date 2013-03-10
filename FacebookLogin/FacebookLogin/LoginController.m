//
//  LogLogController.m
//  FacebookLogin
//
//  Created by Edward Ruggeri on 9/17/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "LoginController.h"

#import "AppDelegate.h"
#import "FacebookSDK.h"

@interface LoginController ()
@property (strong) void(^loginSuccessCompletion)(void);
@property (weak) UIButton* logLogButton;
@end

@implementation LoginController
+(void)loginWithViewController:(UIViewController*)viewController
                 andCompletion:(void(^)(void))loginSuccessCompletion {
  if (FBSession.activeSession.isOpen) {
    loginSuccessCompletion();
  } else {
    LoginController *lc = [self new];
    lc.loginSuccessCompletion = loginSuccessCompletion;
    [viewController presentModalViewController:lc animated:YES];
  }
}

-(void)loadView {
  [super loadView];
  self.view.backgroundColor = [UIColor blueColor];
  self.logLogButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  self.logLogButton.frame = CGRectMake(0, 0, 100, 30);
  self.logLogButton.center = self.view.center;
  [self.logLogButton setTitle:@"LogLog!" forState:UIControlStateNormal];
  [self.view addSubview:self.logLogButton];
}

-(void)viewDidLoad {
  [self.logLogButton addTarget:self action:@selector(logLog) forControlEvents:UIControlEventTouchDown];
}

-(void)logLog {
  AppDelegate* ad = [UIApplication sharedApplication].delegate;
  [ad openSessionWithAllowLoginUI:YES withCompletion:^{
    if (self.loginSuccessCompletion)
      self.loginSuccessCompletion();
    [self dismissModalViewControllerAnimated:YES];
  }];
}
@end
