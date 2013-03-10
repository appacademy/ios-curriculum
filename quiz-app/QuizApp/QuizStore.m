//
//  QuizStore.m
//  QuizApp
//
//  Created by Edward Ruggeri on 7/11/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import "QuizStore.h"

#import "Question.h"

@implementation QuizStore

+(Question*)randomQuestion {
  NSMutableArray* arr = [NSMutableArray new];
  
  [arr addObject:[Question withPrompt:@"Who are you?" andResponse:@"Ned am I!"]];
  [arr addObject:[Question withPrompt:@"Where is Coit Tower?" andResponse:@"San Francisco!"]];
  
  return [arr objectAtIndex:(random() % arr.count)];
}
@end
