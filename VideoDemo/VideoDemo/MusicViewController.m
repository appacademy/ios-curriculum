//
//  MusicViewController.m
//  VideoDemo
//
//  Created by Edward Ruggeri on 9/1/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "MusicViewController.h"

#import <MediaPlayer/MediaPlayer.h>

@interface MusicViewController () <MPMediaPickerControllerDelegate>
@property (strong) MPMusicPlayerController* musicPlayer;
@property (weak, nonatomic) IBOutlet MPVolumeView *volumeSlider;
-(void)beginPlay:(MPMediaItemCollection*)itemCollection;
-(IBAction)pickMusic;
@end

@implementation MusicViewController
@synthesize volumeSlider = _volumeSlider;

-(id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (!self)
    return self;
  
  self.title = @"Play Music";
  self.musicPlayer = [MPMusicPlayerController applicationMusicPlayer];
  
  return self;
}

-(void)beginPlay:(MPMediaItemCollection*)itemCollection {
  [self.musicPlayer setQueueWithItemCollection:itemCollection];
  
  [self.musicPlayer play];
  MPVolumeSettingsAlertShow();
}

-(void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection {
  [self dismissViewControllerAnimated:YES completion:^{
    [self beginPlay:mediaItemCollection];
  }];
}

-(void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker {
  [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)pickMusic {
  MPMediaPickerController* pickerController = [[MPMediaPickerController alloc] initWithMediaTypes:MPMediaTypeAnyAudio];
  
  pickerController.delegate = self;
  
  [self presentViewController:pickerController animated:YES completion:nil];
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
