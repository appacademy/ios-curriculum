//
//  ColorView.m
//  GesturesDemo
//
//  Created by Edward Ruggeri on 8/31/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "ColorView.h"

@implementation ColorView
@dynamic brightness;

-(CGFloat)brightness {
  CGFloat brightness;
  
  [self.backgroundColor getRed:nil green:nil blue:nil alpha:&brightness];
  return brightness;
}

-(void)setBrightness:(CGFloat)brightness {
  if (brightness > 1)
    brightness = 1;
  else if (brightness < 0)
    brightness = 0;
    
  self.backgroundColor = [self.backgroundColor colorWithAlphaComponent:brightness];
}

@end
