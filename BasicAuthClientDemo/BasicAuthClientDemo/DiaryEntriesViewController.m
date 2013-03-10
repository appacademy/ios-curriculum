//
//  DiaryEntriesViewController.m
//  BasicAuthClientDemo
//
//  Created by Edward Ruggeri on 9/12/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "DiaryEntriesViewController.h"

#import "DiaryEntry.h"
#import "DiaryStore.h"
#import "RestKit.h"

@interface DiaryEntriesViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong) NSArray* diaryEntries;
@property (weak, nonatomic) UITableView *view;
@end

@implementation DiaryEntriesViewController

-(void)loadView {
  self.view = [UITableView new];
}

-(void)viewDidLoad {
  [super viewDidLoad];
  
  self.diaryEntries = [DiaryEntry allObjects];
  
  if (self.diaryEntries.count == 0) {
    [self refreshEntries];
  };
  
  self.view.dataSource = self;
  self.view.delegate = self;
  
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshEntries)];
}

-(void)refreshEntries {
  NSLog(@"Refreshing!");
  [DiaryStore fetchDiaryEntries:^{
    self.diaryEntries = [DiaryEntry allObjects];
    [self.view reloadData];
  }];
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.diaryEntries.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"DiaryCell"];
  if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DiaryCell"];
  }

  DiaryEntry* de = [self.diaryEntries objectAtIndex:indexPath.row];
  cell.textLabel.text = de.title;
  
  return cell;
}

@end
