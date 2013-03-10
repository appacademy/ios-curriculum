//
//  main.m
//  ObjectOrientedObjectiveC
//
//  Created by Edward Ruggeri on 7/12/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Artwork.h"
#import "Critic.h"
#import "Book.h"
#import "Movie.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    Critic* c = [Critic new];
    c.name = @"Roger Ebert";
    
    Movie* m = [Movie new];
    m.title = @"Transformers";
    m.director = @"Michael Bay";
    Book* b = [Book new];
    b.title = @"A Farewell to Arms";
    b.author = @"Ernest Hemmingway";
    
    [c trashArtwork:m];
    [c praiseArtwork:b];
  }
  return 0;
}

