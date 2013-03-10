//
//  ViewController.m
//  SimpleRestKit
//
//  Created by Edward Ruggeri on 8/14/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import "ViewController.h"
#import "RestKit.h"

@interface ViewController () <RKRequestDelegate>
@end

@implementation ViewController
@synthesize twitterHandleField;

-(void)viewDidLoad {
  [RKClient clientWithBaseURLString:@"http://api.twitter.com/1"];
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)fetchTweets {
  RKClient* client = [RKClient sharedClient];
  
  NSDictionary* params = [NSDictionary dictionaryWithKeysAndObjects:@"screen_name", self.twitterHandleField.text, nil];
  
  [client get:@"/statuses/user_timeline.json" queryParameters:params delegate:self];
}

-(void)request:(RKRequest *)request didLoadResponse:(RKResponse *)response {
  NSLog(@"%@", [request.response parsedBody:nil]);
}

@end
