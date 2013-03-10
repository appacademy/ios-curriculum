//
//  SlowFoodViewController.m
//  BlocksDemo
//
//  Created by Edward Ruggeri on 8/25/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "SlowFoodViewController.h"
#import "MBProgressHUD.h"

@interface SlowFoodViewController ()
@property (weak, nonatomic) IBOutlet UILabel *mealLabel;
@end

@implementation SlowFoodViewController

-(IBAction)orderFood {
  self.mealLabel.text = @"Food is coming!";

  MBProgressHUD* progressHud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
  // set removeFromSuperViewOnHide to make sure the hud gets cleaned up when done
  progressHud.removeFromSuperViewOnHide = YES;
  
  // default is to fade in
  progressHud.animationType = MBProgressHUDAnimationZoom;
  
  // can handle progress level
  progressHud.mode = MBProgressHUDModeAnnularDeterminate;
  
  progressHud.labelText = @"Cooking...";
  progressHud.detailsLabelText = @"Food is being prepared\nslowly but surely.";
  
//  self.progressHud.graceTime = .1f;
  // graceTime waits a little before showing the spinner (so people don't see a spinner
  // for only a brief moment).  Doesn't work with blocks yet; I made a pull request.
  
  [progressHud showAnimated:YES whileExecutingBlock:^{
    // wait for food to come...
    for (int i = 0; i < 4; ++i) {
      sleep(1);
      progressHud.progress += .25;
    }
  } completionBlock:^{
    // UI changes must happen in main thread; we'll talk Monday :-)
    self.mealLabel.text = @"Delicious food!";
  }];
}

@end
