//
//  DisplayMessageViewController.m
//  MessengerApp
//
//  Created by Edward Ruggeri on 8/20/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "DisplayMessageViewController.h"
#import "Message.h"

@interface DisplayMessageViewController ()
@property (weak, nonatomic) IBOutlet UILabel *fromLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@end

@implementation DisplayMessageViewController
-(void)viewDidLoad {
  self.fromLabel.text = self.msg.fromUser;
  self.titleLabel.text = self.msg.title;
  self.bodyLabel.text = self.msg.body;
}
@end
