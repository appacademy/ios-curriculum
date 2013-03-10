//
//  WorkBikeRouteViewController.m
//  MapKitOverlaysDemo
//
//  Created by Edward Ruggeri on 8/25/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "WorkBikeRouteViewController.h"
#import <MapKit/MapKit.h>

@interface WorkBikeRouteViewController () <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property CLLocationCoordinate2D startLocation;
@property CLLocationCoordinate2D endLocation;
@end

@implementation WorkBikeRouteViewController

-(id)init {
  self = [super init];
  if (!self)
    return nil;
  
  self.startLocation = CLLocationCoordinate2DMake(37.749069, -122.423465);
  self.endLocation = CLLocationCoordinate2DMake(37.777737, -122.400423);

  return self;
}

-(void)viewDidLoad {
  [super viewDidLoad];
  
  self.mapView.delegate = self;
  self.mapView.region = MKCoordinateRegionMake(self.startLocation, MKCoordinateSpanMake(.1, .1));
  
  // A "C style" array is declared like this: Type variableName[]
  // A C style "array literal" (the equivalent of @[@"a", @"b", @"c"]),
  // is given by { 1, 2, 3 }
  // Elements of a C style array do not need to be object pointers
  // See ch35 in BNR Obj-C
  CLLocationCoordinate2D coords[] = { self.startLocation, self.endLocation };
  MKPolyline* crowFliesPath = [MKPolyline polylineWithCoordinates:coords count:2];
  [self.mapView addOverlay:crowFliesPath];
}

-(MKOverlayView*)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay {
  // create a view for the polyline overlay
  MKPolylineView* polylineView = [[MKPolylineView alloc] initWithPolyline:overlay];
  // set the color the polyline gets stroked with
  polylineView.strokeColor = [[UIColor redColor] colorWithAlphaComponent:.5];
  return polylineView;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
