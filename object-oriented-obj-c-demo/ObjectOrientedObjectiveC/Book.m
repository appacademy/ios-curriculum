//
//  Book.m
//  ObjectOrientedObjectiveC
//
//  Created by Edward Ruggeri on 7/12/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import "Book.h"

@implementation Book
@synthesize title = _title;
@synthesize author = _author;

-(NSString*)creator {
  return self.author;
}
@end
