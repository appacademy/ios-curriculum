//
//  Question.h
//  QuizApp
//
//  Created by Edward Ruggeri on 7/11/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject
@property (readonly, strong) NSString* prompt;
@property (readonly, strong) NSString* response;

+(Question*)withPrompt:(NSString*)prompt andResponse:(NSString*)response;
@end
