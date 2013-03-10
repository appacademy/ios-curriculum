//
//  ViewController.m
//  ParseDemo
//
//  Created by Edward Ruggeri on 8/10/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import "ViewController.h"

#import <Parse/Parse.h>

@implementation ViewController
@synthesize messageTextField;

-(void)viewDidLoad {
  [[self messageTextField] setDelegate:self];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  
  return YES;
}

- (IBAction)saveMessage {
  NSString* messageText = [[self messageTextField] text];
  
  PFObject* messageObject = [PFObject objectWithClassName:@"Message"];
  [messageObject setObject:messageText forKey:@"message_text"];
  [messageObject setObject:@"unread" forKey:@"did_read"];
  [messageObject save];
}

- (IBAction)getMessage {
  PFQuery* query = [PFQuery queryWithClassName:@"Message"];
  NSArray* messages = [query findObjects];
  
  for (PFObject* obj in messages) {
    if ([[obj objectForKey:@"did_read"] isEqualToString:@"read"])
      continue;
    
    [obj setObject:@"read" forKey:@"did_read"];
    [obj save];
    
    UIAlertView* myAlert = [[UIAlertView alloc] initWithTitle:@"Message"
                                                      message:[obj objectForKey:@"message_text"]
                                                     delegate:nil
                                            cancelButtonTitle:@"Dismiss"
                                            otherButtonTitles:nil];
    [myAlert show];
  }
}
@end
