//
//  PlayVideoViewController.m
//  VideoDemo
//
//  Created by Edward Ruggeri on 9/1/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "PlayVideoViewController.h"

#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/UTCoreTypes.h>

@interface PlayVideoViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong) MPMoviePlayerController* playerController;
@property (weak, nonatomic) IBOutlet UIView *videoSubview;
-(IBAction)playVideo;
@end

@implementation PlayVideoViewController
@synthesize videoSubview;
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (!self)
    return self;
  
  self.title = @"Play Video";
  
  return self;
}

-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary*)info {
  NSString* mediaType = [info objectForKey:UIImagePickerControllerMediaType];

  [self dismissViewControllerAnimated:YES completion:^{
    // just being safe
    if (![mediaType isEqualToString:(NSString*)kUTTypeMovie])
      return;
    
    [self.playerController.view removeFromSuperview];
    
    self.playerController =
    [[MPMoviePlayerController alloc]
     initWithContentURL:[info objectForKey:UIImagePickerControllerMediaURL]];
    self.playerController.shouldAutoplay = YES;
    self.playerController.repeatMode = MPMovieRepeatModeOne;
    [self.playerController prepareToPlay];
    
    UIView* playerView = self.playerController.view;
    playerView.frame = self.videoSubview.bounds;
    playerView.bounds = CGRectMake(0, 0, playerView.frame.size.width, playerView.frame.size.height);
    [self.videoSubview addSubview:self.playerController.view];
    
    [self.playerController play];
  }];
}

-(IBAction)playVideo {
  if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum] == NO) {
    return;
  }
  
  UIImagePickerController* mediaUI = [UIImagePickerController new];
  mediaUI.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
  mediaUI.mediaTypes = [[NSArray alloc] initWithObjects:(NSString*)kUTTypeMovie, nil];
  mediaUI.videoQuality = UIImagePickerControllerQualityTypeHigh;
  mediaUI.allowsEditing = NO;
  mediaUI.delegate = self;
  
  [self presentModalViewController:mediaUI animated:YES];
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidUnload {
  [self setVideoSubview:nil];
  [super viewDidUnload];
}
@end
