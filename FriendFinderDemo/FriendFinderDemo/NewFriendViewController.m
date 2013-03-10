//
//  NewFriendViewController.m
//  FriendFinderDemo
//
//  Created by Edward Ruggeri on 8/30/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "NewFriendViewController.h"
#import "Friend.h"
#import "FriendFinderStore.h"

@interface NewFriendViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@end

@implementation NewFriendViewController
@synthesize cancelButton = _cancelButton;

-(void)viewDidLoad {
  self.doneButton.target = self;
  self.doneButton.action = @selector(createFriend);
  
  self.cancelButton.target = self;
  self.cancelButton.action = @selector(cancelFriend);
}

-(void)cancelFriend {
  [self dismissModalViewControllerAnimated:YES];
}

-(void)createFriend {
  Friend* friend = [FriendFinderStore createFriend];
  friend.name = self.nameField.text;
  [FriendFinderStore save];
  
  [self dismissViewControllerAnimated:YES completion:self.completionBlock];
}

@end
