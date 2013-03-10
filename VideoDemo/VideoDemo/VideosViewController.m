//
//  VideosViewController.m
//  VideoDemo
//
//  Created by Edward Ruggeri on 9/1/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "VideosViewController.h"

#import "MusicViewController.h"
#import "ParseVideoViewController.h"
#import "PlayVideoViewController.h"
#import "RecordVideoViewController.h"

@interface VideosViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *optionsTable;
@end

@implementation VideosViewController

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 5;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
  
  switch (indexPath.row) {
    case 0:
      cell.textLabel.text = @"Select and Play Video";
      break;
    case 1:
      cell.textLabel.text = @"Record and Save Video";
      break;
    case 2:
      cell.textLabel.text = @"Merge Video";
      break;
    case 3:
      cell.textLabel.text = @"Play Music";
      break;
    case 4:
      cell.textLabel.text = @"Play/Upload from Parse";
  }
  
  return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  switch (indexPath.row) {
    case 0:
    {
      UIViewController* videosVC = [PlayVideoViewController new];
      [self.navigationController pushViewController:videosVC animated:YES];
    }
      break;
    case 1:
    {
      UIViewController* videosVC = [RecordVideoViewController new];
      [self.navigationController pushViewController:videosVC animated:YES];
    }
      break;
    case 2:
    {
    }
      break;
    case 3:
    {
      UIViewController* musicController = [MusicViewController new];
      [self.navigationController pushViewController:musicController animated:YES];
    }
      break;
    case 4:
    {
      UIViewController* parseVideoController = [ParseVideoViewController new];
      [self.navigationController pushViewController:parseVideoController animated:YES];
    }
      break;
  }

  [tableView cellForRowAtIndexPath:indexPath].selected = NO;
}

-(void)viewDidLoad {
  [super viewDidLoad];
  
  self.optionsTable.dataSource = self;
  self.optionsTable.delegate = self;
}

@end
