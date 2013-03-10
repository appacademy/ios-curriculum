//
//  HelloViewController.m
//  MapAnnotationDemo
//
//  Created by Edward Ruggeri on 8/15/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import "HelloViewController.h"

@interface HelloViewController ()
@end

@implementation HelloViewController
@synthesize messageLabel;
@synthesize message;

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.messageLabel.text = message;
}

@end
