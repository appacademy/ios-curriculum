//
//  ItemsViewController.m
//  TablesDemo
//
//  Created by Edward Ruggeri on 8/17/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import "PresidentsTableViewController.h"

@interface PresidentsTableViewController () <UITableViewDataSource, UITableViewDelegate>
@property (readonly) NSArray* favoritePresidents;
@end

@implementation PresidentsTableViewController
@synthesize itemsView;

-(NSArray*)favoritePresidents {
  return [NSArray arrayWithObjects:@"Burr", @"Goldwater", @"Munskie", nil];
}

-(void)viewDidLoad {
  [super viewDidLoad];
  self.itemsView.delegate = self;
  self.itemsView.dataSource = self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.favoritePresidents.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
  cell.textLabel.text = [self.favoritePresidents objectAtIndex:indexPath.row];
  
  return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  NSString* selectedPresident = [self.favoritePresidents objectAtIndex:indexPath.row];
  UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Selected President!" message:selectedPresident delegate:nil cancelButtonTitle:@"Yay!" otherButtonTitles:nil];
  [alert show];
}

@end
