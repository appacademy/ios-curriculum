//
//  ColorGestureViewController.m
//  GesturesDemo
//
//  Created by Edward Ruggeri on 8/31/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "ColorGestureViewController.h"
#import "ColorView.h"

@interface ColorGestureViewController ()
@property (strong) ColorView* view;
@property (strong) UIPanGestureRecognizer* panGestureRecognizer;
@end

@implementation ColorGestureViewController
-(void)loadView {
  self.view = [ColorView new];
}

-(void)viewDidLoad {
  self.view.backgroundColor = [UIColor blueColor];

  self.panGestureRecognizer = [UIPanGestureRecognizer new];
  [self.panGestureRecognizer addTarget:self action:@selector(pan)];
  [self.view addGestureRecognizer:self.panGestureRecognizer];
}

-(void)pan {
  CGPoint translation = [self.panGestureRecognizer translationInView:self.view];
  [self.panGestureRecognizer setTranslation:CGPointZero inView:self.view];
  
  double verticalTranslationScale = translation.y / self.view.bounds.size.height;
  self.view.brightness = self.view.brightness + verticalTranslationScale;
}

@end
