//
//  QuizStore.h
//  QuizApp
//
//  Created by Edward Ruggeri on 7/11/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Question;

@interface QuizStore : NSObject
+(Question*)randomQuestion;
@end
