//
//  RecordVideoViewController.m
//  VideoDemo
//
//  Created by Edward Ruggeri on 9/1/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "RecordVideoViewController.h"

#import <AssetsLibrary/AssetsLibrary.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/UTCoreTypes.h>

@interface RecordVideoViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
-(IBAction)recordVideo;
@end

@implementation RecordVideoViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (!self)
    return self;
  
  self.title = @"Record Video";
  
  return self;
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
  NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];

  [self dismissViewControllerAnimated:YES completion:^{
    if (![mediaType isEqualToString:(NSString*)kUTTypeMovie])
      return;
    
    NSString *moviePath = [[info objectForKey:UIImagePickerControllerMediaURL] path];
    if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(moviePath)) {
      UISaveVideoAtPathToSavedPhotosAlbum(moviePath, nil, nil, nil);
    }
  }];
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
}

- (IBAction)recordVideo {
  if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
    return;
  }
  
  UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];
  cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera;
  cameraUI.mediaTypes = [NSArray arrayWithObjects:(NSString*)kUTTypeMovie, nil];
  cameraUI.videoQuality = UIImagePickerControllerQualityTypeHigh;
  
  cameraUI.allowsEditing = NO;
  cameraUI.delegate = self;
  
  [self presentModalViewController:cameraUI animated:YES];
}

@end
