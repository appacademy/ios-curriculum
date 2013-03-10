//
//  Asteroid.m
//  Asteroids
//
//  Created by Edward Ruggeri on 8/23/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "Asteroid.h"
#import <QuartzCore/QuartzCore.h>

@interface Asteroid ()
@property CALayer* layer;
@end

CGFloat randomIntensity() {
  return (double) arc4random() / UINT_MAX;
}

UIColor* randomColor() {
  return [UIColor colorWithRed:randomIntensity() green:randomIntensity() blue:randomIntensity() alpha:.5];
}

@implementation Asteroid
+(Asteroid*)asteroidAtPos:(CGPoint)pos withView:(UIView*)view {
  Asteroid* asteroid = [Asteroid new];
  asteroid.layer = [CALayer new];
  asteroid.layer.frame = CGRectMake(pos.x, pos.y, 20, 20);
  asteroid.layer.delegate = asteroid;
  
  // need to tell layer to draw the first time!
  [asteroid.layer setNeedsDisplay];
  [view.layer addSublayer:asteroid.layer];
  
  return asteroid;
}

-(void)destroy {
  [self.layer removeFromSuperlayer];
}

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
  
  CGContextSetFillColorWithColor(ctx, [randomColor() CGColor]);
  CGContextFillEllipseInRect(ctx, layer.bounds);
}

-(void)beginMove {
//  [CATransaction begin];
  CGRect superFrame = self.layer.superlayer.frame;
  
  double xPos = superFrame.size.width * ((double) arc4random() / UINT_MAX);
  double yPos = superFrame.size.height * ((double) arc4random() / UINT_MAX);
  
  self.layer.position = CGPointMake(xPos, yPos);
  
//  [CATransaction setAnimationDuration:2.0];
//  [CATransaction commit];
}

-(CGRect)frame {
  return self.layer.frame;
}
@end
