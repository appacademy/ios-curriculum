//
//  SpinningViewController.m
//  CoreAnimationDemo2
//
//  Created by Edward Ruggeri on 8/22/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "SpinningViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface SpinningViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelToSpin;
@property (weak, nonatomic) IBOutlet UIButton *buttonToSpin;
- (IBAction)spinTheLabel;
@end

@implementation SpinningViewController
@synthesize buttonToSpin = _buttonToSpin;
-(CAAnimation*)spinAnimation {
//  CABasicAnimation* spinAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
//  spinAnimation.fromValue = [NSValue valueWithCGPoint:CGPointZero];
//  spinAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(400, 400)];
//  spinAnimation.duration = 5.0;
  
//  return spinAnimation;
}

-(IBAction)spinTheLabel {
  self.labelToSpin.layer.position = CGPointMake(400, 400);
//  [self.labelToSpin.layer addAnimation:[self spinAnimation] forKey:@"SpinAnimation"];
//  
//  [self.buttonToSpin.layer addAnimation:[self spinAnimation] forKey:@"SpinAnimation"];
}
- (void)viewDidUnload {
  [self setButtonToSpin:nil];
  [super viewDidUnload];
}
@end
