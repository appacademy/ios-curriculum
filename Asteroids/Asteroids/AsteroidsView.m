//
//  AsteroidsView.m
//  Asteroids
//
//  Created by Edward Ruggeri on 8/23/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "AsteroidsView.h"

#import "Asteroid.h"

@interface AsteroidsView ()
@property (strong) NSMutableArray* asteroids;
@end

@implementation AsteroidsView
-(id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (!self)
    return nil;
  
  self.backgroundColor = [UIColor whiteColor];
  
  self.asteroids = [NSMutableArray new];
  for (int i = 0; i < 50; i ++) {
    CGFloat xPos = self.bounds.size.width * ((double) arc4random() / UINT_MAX);
    CGFloat yPos = self.bounds.size.height * ((double) arc4random() / UINT_MAX);
    
    Asteroid* nextAsteroid = [Asteroid asteroidAtPos:CGPointMake(xPos, yPos) withView:self];
    [self.asteroids addObject:nextAsteroid];
  }
  
  return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  for (Asteroid* asteroid in self.asteroids)
    [asteroid beginMove];

//  NSMutableArray* asteroidsToDestroy = [NSMutableArray new];
//  for (UITouch* touch in touches) {
//    CGPoint touchPoint = [touch locationInView:self];
//    for (Asteroid* asteroid in self.asteroids) {
//      if (CGRectContainsPoint(asteroid.frame, touchPoint)) {
//        NSLog(@"Asteroid hit!");
//        [asteroidsToDestroy addObject:asteroid];
//      }
//    }
//  }
//  
//  for (Asteroid* asteroid in asteroidsToDestroy)
//    [asteroid destroy];
}
@end
