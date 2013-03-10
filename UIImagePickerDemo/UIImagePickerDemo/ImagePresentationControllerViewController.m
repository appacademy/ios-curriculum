//
//  ImagePresentationControllerViewController.m
//  UIImagePickerDemo
//
//  Created by Edward Ruggeri on 8/24/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "ImagePresentationControllerViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface ImagePresentationControllerViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong) UIImage* backingImage;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UISlider *sepiaSlider;
@end

@implementation ImagePresentationControllerViewController

-(void)viewDidLoad {
  self.sepiaSlider.continuous = NO;
}

-(IBAction)choosePhoto {
  UIImagePickerController* imagePicker = [UIImagePickerController new];
  imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
  imagePicker.mediaTypes = [NSArray arrayWithObject:(NSString*)kUTTypeImage];
  imagePicker.delegate = self;
  
  imagePicker.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
  [self presentModalViewController:imagePicker animated:YES];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
  self.backingImage = [info objectForKey:UIImagePickerControllerOriginalImage];
  
  self.imageView.image = self.backingImage;
  [self dismissModalViewControllerAnimated:YES];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
  [self dismissModalViewControllerAnimated:NO];
}

-(IBAction)drawOnImage {
  CGSize bounds = self.backingImage.size;
  UIGraphicsBeginImageContextWithOptions(bounds, YES, 0);
  CGContextRef ctx = UIGraphicsGetCurrentContext();
  
  [self.backingImage drawInRect:CGRectMake(0, 0, bounds.width, bounds.height)];
  
  CGContextSetLineWidth(ctx, 10);
  [[UIColor blueColor] set];
  CGContextStrokeEllipseInRect(ctx, CGRectMake(0, 0, bounds.width, bounds.height));
  
  self.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
}

- (IBAction)sepiaSliderFinishedChanging:(UISlider *)sender {
  [self makeSepia:sender.value];
}

- (IBAction)makeSepia:(double)intensity {
  CIImage* inputImage = [[CIImage alloc] initWithCGImage:self.backingImage.CGImage];
  
  CIFilter* sepiaFilter = [CIFilter filterWithName:@"CISepiaTone"];
  [sepiaFilter setDefaults];
  [sepiaFilter setValue:inputImage forKey:kCIInputImageKey];
  [sepiaFilter setValue:[NSNumber numberWithDouble:intensity] forKey:@"inputIntensity"];
  CIImage* outputImage = [sepiaFilter outputImage];

  CIContext* context = [CIContext contextWithOptions:nil];
  CGImageRef cgimg = [context createCGImage:outputImage
                                   fromRect:[outputImage extent]];
  self.imageView.image = [UIImage imageWithCGImage:cgimg];
  CGImageRelease(cgimg);
}

- (void)viewDidUnload {
  [self setSepiaSlider:nil];
  [super viewDidUnload];
}
@end
