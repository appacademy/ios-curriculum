//
//  FriendsViewController.m
//  FacebookLogin
//
//  Created by Edward Ruggeri on 9/18/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "FriendsViewController.h"

#import "FacebookSDK.h"
#import "LoginController.h"

@interface FriendsViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak) UITableView* tableView;
@property (strong) NSDictionary* facebookProperties;
@end

@implementation FriendsViewController

-(void)loadView {
  self.view = [UIView new];
  self.view.frame = [[UIScreen mainScreen] applicationFrame];
  
  UIToolbar* toolbar = [UIToolbar new];
  toolbar.items = @[
    [[UIBarButtonItem alloc] initWithTitle:@"Logout!" style:UIBarButtonItemStyleBordered target:self action:@selector(logout)],
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh)]
  ];
  
  [toolbar sizeToFit];
  [self.view addSubview:toolbar];

  UITableView* tableView = [UITableView new];
  self.tableView = tableView; // careful; tableView is weak!
  self.tableView.dataSource = self;
  self.tableView.delegate = self;
  
  CGRect tableViewFrame;
  tableViewFrame.size = self.view.bounds.size;
  CGFloat toolbarHeight = toolbar.frame.size.height;
  tableViewFrame.origin.y += toolbarHeight;
  tableViewFrame.size.height -= toolbarHeight;
  self.tableView.frame = tableViewFrame;
  [self.view addSubview:self.tableView];
}

-(void)refresh {
  [LoginController loginWithViewController:self
                             andCompletion:^{
    [FBRequestConnection startWithGraphPath:@"me" completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
      if (error) {
        NSLog(@"%@", error);
      } else {
        self.facebookProperties = result;
        [self.tableView reloadData];
      }
    }];
  }];
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  if (self.facebookProperties) {
    return self.facebookProperties.count;
  } else {
    return 0;
  }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"FacebookCell"];
  if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"FacebookCell"];
  }
  
  id key = [[self.facebookProperties allKeys] objectAtIndex:indexPath.row];
  cell.textLabel.text = [key description];
  cell.detailTextLabel.text = [[self.facebookProperties objectForKey:key] description];
  
  return cell;
}

-(void)logout {
  [FBSession.activeSession closeAndClearTokenInformation];
  
  self.facebookProperties = nil;
  [self.tableView reloadData];
}
@end
