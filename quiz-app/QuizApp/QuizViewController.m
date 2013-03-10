//
//  QuizViewController.m
//  QuizApp
//
//  Created by Edward Ruggeri on 7/11/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import "QuizViewController.h"
#import "Question.h"
#import "QuizStore.h"

@implementation QuizViewController {
  Question* _currentQuestion;
}

@synthesize answerTextField;
@synthesize questionTextField;

- (IBAction)showQuestion {
  _currentQuestion = [QuizStore randomQuestion];
  questionTextField.text = _currentQuestion.prompt;
  answerTextField.text = @"???";
}

- (IBAction)showAnswer {
  answerTextField.text = _currentQuestion.response;
}
@end
