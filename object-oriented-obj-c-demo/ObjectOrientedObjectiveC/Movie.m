//
//  Movie.m
//  ObjectOrientedObjectiveC
//
//  Created by Edward Ruggeri on 7/12/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import "Movie.h"

@implementation Movie 

@synthesize title = _title;
@synthesize director = _director;
@synthesize actors = _actors;
@synthesize releaseYear = _releaseYear;

-(NSString*)creator {
  return self.director;
}

@end
