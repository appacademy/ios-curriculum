//
//  Asteroid.h
//  Asteroids
//
//  Created by Edward Ruggeri on 8/23/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Asteroid : NSObject
@property (readonly) CGRect frame;

+(Asteroid*)asteroidAtPos:(CGPoint)pos withView:(UIView*)view;

-(void)beginMove;
-(void)destroy;
@end
