//
//  Question.m
//  QuizApp
//
//  Created by Edward Ruggeri on 7/11/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import "Question.h"

@implementation Question {
  NSString* _prompt;
  NSString* _response;
}

@synthesize prompt = _prompt;
@synthesize response = _response;

+(Question*)withPrompt:(NSString*)prompt andResponse:(NSString*)response {
  Question* q = [Question new];
  q->_prompt = prompt;
  q->_response = response;
  
  return q;
}
@end
