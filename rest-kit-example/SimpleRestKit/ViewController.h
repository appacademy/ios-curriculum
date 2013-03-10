//
//  ViewController.h
//  SimpleRestKit
//
//  Created by Edward Ruggeri on 8/14/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *twitterHandleField;
- (IBAction)fetchTweets;

@end
