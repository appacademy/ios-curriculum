//
//  QuizViewController.h
//  QuizApp
//
//  Created by Edward Ruggeri on 7/11/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuizViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *questionTextField;
- (IBAction)showQuestion;
@property (weak, nonatomic) IBOutlet UILabel *answerTextField;
- (IBAction)showAnswer;

@end
