//
//  SlidingBoxView.m
//  CoreAnimationDemo2
//
//  Created by Edward Ruggeri on 8/22/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "SlidingBoxView.h"
#import <QuartzCore/QuartzCore.h>

@interface SlidingBoxView ()
@property (strong) CALayer* boxLayer;
@end

@implementation SlidingBoxView
-(id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    self.backgroundColor = [UIColor whiteColor];
    
    self.boxLayer = [[CALayer alloc] init];
    self.boxLayer.backgroundColor = [[UIColor redColor] CGColor];
    self.boxLayer.bounds = CGRectMake(0, 0, 80, 80);
    [self.layer addSublayer:self.boxLayer];
//    self.boxLayer.position = CGPointZero;
  }
  
  return self;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
  CGPoint touchPoint = [[touches anyObject] locationInView:self];

  [CATransaction begin];
//  [CATransaction setDisableActions:YES];
  self.boxLayer.position = touchPoint;
  [CATransaction commit];
}

@end
