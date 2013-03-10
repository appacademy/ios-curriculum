//
//  Critic.m
//  ObjectOrientedObjectiveC
//
//  Created by Edward Ruggeri on 7/12/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import "Critic.h"

@implementation Critic {
  NSMutableDictionary* _ratings;
}

@synthesize name = _name;

-(void)rateMovie:(Movie *)m numStars:(int)stars {
  [_ratings setObject:[NSNumber numberWithInt:stars] forKey:[m title]];
}

-(int)movieRating:(Movie*)m {
  NSNumber* rating = [_ratings objectForKey:[m title]];
  if (!rating)
    return -1;
  else
    return [rating intValue];
}

-(void)praiseArtwork:(id<Artwork>)a {
  NSLog(@"%@ is a great artist; %@ is her masterpiece!", [a creator], [a title]);
}

-(void)trashArtwork:(id<Artwork>)a {
  NSLog(@"%@ is a fraud; %@ is despicable!", [a creator], [a title]);
}
@end
