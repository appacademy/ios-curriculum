//
//  ViewController.m
//  Blackjack
//
//  Created by Edward Ruggeri on 8/14/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import "ViewController.h"

#import "Deck.h"
#import "Hand.h"

@interface ViewController ()
@property (strong) Deck* deck;

@property (strong) Hand* dealerHand;
@property (strong) Hand* playerHand;

-(void)alertLose;
-(void)alertWin;
-(void)playDealerHand;
-(void)updateDisplay:(BOOL)hideDealerHand;
@end

@implementation ViewController
@synthesize dealerHandLabel = _dealerHandLabel;
@synthesize playerHandLabel = _playerHandLabel;
@synthesize deck = _deck;
@synthesize playerHand = _playerHand;
@synthesize playerScoreLabel = _playerScoreLabel;
@synthesize hitButton = _hitButton;
@synthesize dealerHand = _dealerHand;
@synthesize dealerScoreLabel = _dealerScoreLabel;

- (void)viewDidLoad {
  [super viewDidLoad];
  self.deck = [Deck new];
  [self.deck shuffle];
  self.playerHand = [Hand new];
  self.dealerHand = [Hand new];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)deal {
  [self.playerHand returnCardsToDeck:self.deck];
  [self.dealerHand returnCardsToDeck:self.deck];
  
  [self.playerHand takeCardFromDeck:self.deck];
  [self.playerHand takeCardFromDeck:self.deck];
  
  [self.dealerHand takeCardFromDeck:self.deck];
  [self.dealerHand takeCardFromDeck:self.deck];

  // enable user to hit again
  self.hitButton.hidden = NO;
  [self updateDisplay:YES];
}

- (IBAction)hit {
  [self.playerHand takeCardFromDeck:self.deck];
  [self updateDisplay:YES];
  
  if ([self.playerHand handValue] > 21) {
    self.hitButton.hidden = YES;
  }
}

- (IBAction)stand {
  if ([self.playerHand handValue] > 21) {
    [self alertLose];
  } else {
    [self playDealerHand];
    [self updateDisplay:NO];
    
    int dealerHandValue = [self.dealerHand handValue];
    int playerHandValue = [self.playerHand handValue];
    
    if ((dealerHandValue > 21) || (playerHandValue > dealerHandValue)) {
      [self alertWin];
    } else {
      [self alertLose];
    }
  }
}

-(void)playDealerHand {
  while ([self.dealerHand handValue] < 16) {
    [self.dealerHand takeCardFromDeck:self.deck];
  }
}

-(void)updateDisplay:(BOOL)hideDealer {
  if (hideDealer) {
    self.dealerHandLabel.text = [self.dealerHand hiddenDealerDescription];
    self.dealerScoreLabel.text = @"??";
  } else {
    self.dealerHandLabel.text = [self.dealerHand description];
    self.dealerScoreLabel.text = [NSString stringWithFormat:@"%d", [self.dealerHand handValue]];
  }
  
  self.playerHandLabel.text = [self.playerHand description];
  self.playerScoreLabel.text = [NSString stringWithFormat:@"%d", [self.playerHand handValue]];
}

-(void)alertLose {
  UIAlertView* loseView = [[UIAlertView alloc] initWithTitle:@"You Lose!" message:nil delegate:nil cancelButtonTitle:@"Try again!" otherButtonTitles:nil];
  [loseView show];
}

-(void)alertWin {
  UIAlertView* winView = [[UIAlertView alloc] initWithTitle:@"You Win!" message:nil delegate:nil cancelButtonTitle:@"Try again!" otherButtonTitles:nil];
  [winView show];
}

- (void)viewDidUnload {
  [self setHitButton:nil];
  [super viewDidUnload];
}
@end
