//
//  ViewController.h
//  MapAnnotationDemo
//
//  Created by Edward Ruggeri on 8/15/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController
- (IBAction)pushHelloController;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
