//
//  ListMessagesViewController.m
//  MessengerApp
//
//  Created by Edward Ruggeri on 8/20/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "ListMessagesViewController.h"
#import "DisplayMessageViewController.h"
#import "Message.h"
#import "MessageStore.h"

#define USER_NAME @"ruggeri"

@interface ListMessagesViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *messagesTable;

@property (strong) Message* currentMessage;
@end

@implementation ListMessagesViewController

-(id)init {
  self = [super self];
  if (!self)
    return nil;
  
  self.title = @"Messages";
  
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.messagesTable.dataSource = self;
  self.messagesTable.delegate = self;
}

-(Message*)messageForIndexPath:(NSIndexPath*)indexPath {
  return [[MessageStore messagesForUser:USER_NAME] objectAtIndex:indexPath.row];
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [MessageStore messagesForUser:USER_NAME].count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  Message* msg = [self messageForIndexPath:indexPath];
  
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MessageCell"];
  if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MessageCell"];
  }
  
  cell.textLabel.text = msg.title;
  cell.detailTextLabel.text = msg.fromUser;
  
  return cell;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  Message* msg = [self messageForIndexPath:indexPath];

  DisplayMessageViewController* messageVC = [DisplayMessageViewController new];
  messageVC.msg = msg;
  
  [self.navigationController pushViewController:messageVC animated:YES];
}

@end
