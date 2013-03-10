//
//  Critic.h
//  ObjectOrientedObjectiveC
//
//  Created by Edward Ruggeri on 7/12/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Artwork.h"
#import "Movie.h"

@interface Critic : NSObject
@property (strong) NSString* name;

-(void)rateMovie:(Movie*)m numStars:(int)stars;
-(int)movieRating:(Movie*)m;

-(void)praiseArtwork:(id<Artwork>)a;
-(void)trashArtwork:(id<Artwork>)a;
@end
