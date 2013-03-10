//
//  LinesView.m
//  ViewsDemoProject
//
//  Created by Edward Ruggeri on 8/21/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "LinesView.h"

@implementation LinesView

-(CGFloat)randomIntensity {
  return (double) arc4random() / INT_MAX;
}

-(UIColor*)randomColor {
  return [UIColor colorWithRed:[self randomIntensity] green:[self randomIntensity] blue:[self randomIntensity] alpha:1];
}

-(void)drawRect:(CGRect)rect {
  [super drawRect:rect];
  
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  CGContextMoveToPoint(context, self.bounds.origin.x + (self.bounds.size.width / 2), self.bounds.origin.y + (self.bounds.size.height / 2));
  CGContextAddLineToPoint(context, self.bounds.origin.x, self.bounds.origin.y + (self.bounds.size.height));
  CGContextAddLineToPoint(context, self.bounds.origin.x + self.bounds.size.width, self.bounds.origin.y + (self.bounds.size.height));

  [[self randomColor] set];
  CGContextFillPath(context);
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
  [self setNeedsDisplay];
}

@end
