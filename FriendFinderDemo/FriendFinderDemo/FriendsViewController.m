//
//  ViewController.m
//  FriendFinderDemo
//
//  Created by Edward Ruggeri on 8/30/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "FriendsViewController.h"
#import "Friend.h"
#import "FriendFinderStore.h"
#import "NewFriendViewController.h"

@interface FriendsViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation FriendsViewController
-(void)viewDidLoad {
  self.title = @"Friends";
  
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addFriend)];
}

-(void)addFriend {
  NewFriendViewController* newFriendVC = [NewFriendViewController new];
  
  newFriendVC.completionBlock = ^{
    [self.tableView reloadData];
  };
  
  [self presentModalViewController:newFriendVC animated:YES];
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [FriendFinderStore allFriends].count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"FriendCell"];
  
  if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FriendCell"];
  }
  
  Friend* friend = [[FriendFinderStore allFriends] objectAtIndex:indexPath.row];
  cell.textLabel.text = friend.name;
  
  return cell;
}

@end
