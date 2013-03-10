//
//  AudioRecordAndPlayViewController.m
//  AudioDemo
//
//  Created by Edward Ruggeri on 9/2/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "AudioRecordAndPlayViewController.h"

#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>

@interface AudioRecordAndPlayViewController () <AVAudioPlayerDelegate, AVAudioRecorderDelegate>
@property (strong) AVAudioRecorder* recorder;
@property (strong) AVAudioPlayer* player;

@property (weak, nonatomic) IBOutlet UIButton *recordingButton;
@property (weak, nonatomic) IBOutlet UIButton *playbackButton;

-(IBAction)toggleRecording;
-(IBAction)togglePlayback;
@end

@implementation AudioRecordAndPlayViewController

-(void)resetPlayingTitles {
  if (self.player.playing) {
    [self.playbackButton setTitle:@"End Playing" forState:UIControlStateNormal];
    [self.playbackButton setTitle:@"End Playing" forState:UIControlStateHighlighted];
  } else {
    [self.playbackButton setTitle:@"Begin Playing" forState:UIControlStateNormal];
    [self.playbackButton setTitle:@"Begin Playing" forState:UIControlStateHighlighted];
  }
}

-(void)resetRecordingTitles {
  if (self.recorder.recording) {
    [self.recordingButton setTitle:@"End Recording" forState:UIControlStateNormal];
    [self.recordingButton setTitle:@"End Recording" forState:UIControlStateHighlighted];
  } else {
    [self.recordingButton setTitle:@"Begin Recording" forState:UIControlStateNormal];
    [self.recordingButton setTitle:@"Begin Recording" forState:UIControlStateHighlighted];
  }
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer*)player
                      successfully:(BOOL)flag {
  [self resetPlayingTitles];
}

-(void)audioRecorderDidFinishRecording:(AVAudioRecorder*)recorder
                          successfully:(BOOL)flag {
  [self resetRecordingTitles];
}

-(void)viewDidLoad {
  [super viewDidLoad];

  NSURL* documentDir = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
  
  NSURL* audioURL = [documentDir URLByAppendingPathComponent:@"audio.wav"];
  
  NSDictionary* options = @{
  AVFormatIDKey : [NSNumber numberWithInt:kAudioFormatLinearPCM],
  AVSampleRateKey : [NSNumber numberWithDouble:48000],
  AVNumberOfChannelsKey : [NSNumber numberWithInt:2]
  };
  
  self.recorder = [[AVAudioRecorder alloc] initWithURL:audioURL settings:options error:nil];
  self.recorder.delegate = self;
  self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:audioURL error:nil];
  self.player.delegate = self;
}

-(IBAction)toggleRecording {
  if (!self.recorder.recording) {
    if (self.player.playing)
      [self togglePlayback];
    
    [self.recorder record];
  } else {
    [self.recorder stop];
  }
  
  [self resetRecordingTitles];
}

-(IBAction)togglePlayback {
  if (!self.player.playing) {
    if (self.recorder.recording)
      [self toggleRecording];
    
    [self.player play];
  } else {
    [self.player stop];
  }
  
  [self resetPlayingTitles];
}

@end
