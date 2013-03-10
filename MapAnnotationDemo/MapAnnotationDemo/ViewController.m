//
//  ViewController.m
//  MapAnnotationDemo
//
//  Created by Edward Ruggeri on 8/15/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "HelloViewController.h"
#import "SimpleAnnotation.h"

@interface ViewController () <MKMapViewDelegate>
@end

@implementation ViewController
@synthesize mapView;

-(void)viewDidLoad
{
  [super viewDidLoad];
  
  self.title = @"Map view!";

  // set the view controller as delegate to mapView; the mapView will call methods on the view controller when it needs help
  self.mapView.delegate = self;

  // show the user's location on the map
  self.mapView.showsUserLocation = YES;
  
  
  // create an annotation that is located at center of earth:
  SimpleAnnotation* annotation = [SimpleAnnotation new];
  annotation.coordinate = CLLocationCoordinate2DMake(0, 0);
  annotation.title = @"Center of Earth!";
  
  // add the annotation to the map:
  [self.mapView addAnnotation:annotation];
}

-(MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
  if ([annotation isMemberOfClass:[SimpleAnnotation class]]) {
    // only display this kind of annotation view for SimpleAnnotations
    
    // ignore reuseIdentifier for now; I'll talk about it tomorrow
    MKAnnotationView* annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:nil];
    
    // bring up the gray box when clicked:
    annotationView.canShowCallout = YES;
    
    // show a blue button in the callout:
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    return annotationView;
  } else {
    // returning nil displays the default annotation view for other annotation types
    return nil;
  }
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
  // delegate method that gets called if the user presses the callout accessory
  [self pushHelloController];
}

- (IBAction)pushHelloController {
  // create a new view controller that will hold our next view
  HelloViewController* helloViewController = [HelloViewController new];
  helloViewController.message = @"Hello there!";
  
  // push the view controller onto the navigationController's stack
  // if the user hits the back button later, this view will get popped off the stack
  [self.navigationController pushViewController:helloViewController animated:YES];
}
@end
