//
//  HelloViewController.h
//  MapAnnotationDemo
//
//  Created by Edward Ruggeri on 8/15/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelloViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (strong) NSString* message;
@end
