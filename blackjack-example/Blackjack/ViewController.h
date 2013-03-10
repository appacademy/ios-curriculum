//
//  ViewController.h
//  Blackjack
//
//  Created by Edward Ruggeri on 8/14/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *dealerHandLabel;
@property (weak, nonatomic) IBOutlet UILabel *dealerScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerHandLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerScoreLabel;

@property (weak, nonatomic) IBOutlet UIButton *hitButton;

- (IBAction)deal;
- (IBAction)hit;
- (IBAction)stand;
@end
