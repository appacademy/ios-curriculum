//
//  ParseVideoViewController.m
//  VideoDemo
//
//  Created by Edward Ruggeri on 9/2/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "ParseVideoViewController.h"

#import <AssetsLibrary/AssetsLibrary.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import <Parse/Parse.h>

@interface ParseVideoViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@end

@implementation ParseVideoViewController

-(id)init {
  self = [super initWithClassName:@"VideoUpload"];
  if (!self)
    return nil;
    
  return self;
}

-(void)viewDidLoad {
  [super viewDidLoad];
  
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addVideo)];
}

-(PFTableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
  PFTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"VideoCell"];
  if (!cell) {
    cell = [[PFTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"VideoCell"];
  }
  
  PFFile* videoFile = [object valueForKey:@"videoFile"];
  cell.textLabel.text = videoFile.name;
  return cell;
}

-(void)addVideo {
  UIImagePickerController* imagePicker = [UIImagePickerController new];
  imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
  imagePicker.mediaTypes = [NSArray arrayWithObjects:(NSString*)kUTTypeMovie, nil];
  imagePicker.videoQuality = UIImagePickerControllerQualityTypeHigh;
  imagePicker.delegate = self;
  
  [self presentViewController:imagePicker animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
  NSURL* videoAssetUrl = [info valueForKey:UIImagePickerControllerMediaURL];
  
  // XXX this loads the whole file in memory!
  NSData* videoData = [NSData dataWithContentsOfURL:videoAssetUrl];
  
  PFFile* videoFile = [PFFile fileWithName:videoAssetUrl.pathComponents.lastObject data:videoData];
  
  [videoFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
    PFObject* videoUpload = [PFObject objectWithClassName:@"VideoUpload"];
    [videoUpload setValue:videoFile forKey:@"videoFile"];

    [videoUpload saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
      [self loadObjects];
    }];
  } progressBlock:^(int percentDone) {
    NSLog(@"Percent done: %d", percentDone);
  }];
  
  [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  PFObject* uploadedVideo = [self objectAtIndexPath:indexPath];
  PFFile* videoFile = [uploadedVideo valueForKey:@"videoFile"];
  NSURL* videoURL = [NSURL URLWithString:videoFile.url];
  
  MPMoviePlayerViewController* playerVC = [[MPMoviePlayerViewController alloc] initWithContentURL:videoURL];
  
  [self presentMoviePlayerViewControllerAnimated:playerVC];
  [tableView cellForRowAtIndexPath:indexPath].selected = NO;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
