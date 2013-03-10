//
//  ViewController.h
//  ParseDemo
//
//  Created by Edward Ruggeri on 8/10/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *messageTextField;

- (IBAction)saveMessage;
- (IBAction)getMessage;

@end
