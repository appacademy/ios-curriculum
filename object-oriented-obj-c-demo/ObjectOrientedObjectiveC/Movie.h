//
//  Movie.h
//  ObjectOrientedObjectiveC
//
//  Created by Edward Ruggeri on 7/12/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Artwork.h"

@interface Movie : NSObject <Artwork>
@property (strong) NSString* title;
@property (strong) NSString* director;
@property (strong) NSArray* actors;
@property int releaseYear;
@end
