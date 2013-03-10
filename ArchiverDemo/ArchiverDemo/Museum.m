//
//  Pope.m
//  ArchiverDemo
//
//  Created by Edward Ruggeri on 9/4/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//
/******************
    Notes

To send a lot of data (like an array of line objects), 
NSKeyArchiver & NSKeyUncharvier can work out of the box with:
1. Pirmatives
2. NSString
3. NSDictionary
4. NSArray

Our lines are none of those. 

The NSKeyArchiver is a serializer like JSON to send data bit by bit.

*******************/

#import "Museum.h"

@implementation Museum

// How to encode data sent through NSKeyArchiver
-(void)encodeWithCoder:(NSCoder *)aCoder {
    // The key doesn't matter, but it has to be the same on both ends.
    // of encode and decode.
  [aCoder encodeObject:self.museumName forKey:@"museumName"];
  [aCoder encodeObject:self.founderName forKey:@"founderName"];
  // Integers can't conform to a protocol because it's a primitive.
  [aCoder encodeInt:self.foundingYear forKey:@"foundingYear"];
}

// This only gets called when it's decoded.
-(id)initWithCoder:(NSCoder *)aDecoder {
    // super init like any ol' init.
  self = [super init];
  
  if (self) {
      
    self.museumName = [aDecoder decodeObjectForKey:@"museumName"];
    self.founderName = [aDecoder decodeObjectForKey:@"founderName"];
    self.foundingYear = [aDecoder decodeIntForKey:@"foundingYear"];
  }
  
  return self;
}

-(NSString*)description {
  return [NSString stringWithFormat:@"<%@, %@, %d>", self.museumName, self.founderName, self.foundingYear];
}
@end
