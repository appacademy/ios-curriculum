//
//  Hand.m
//  Blackjack
//
//  Created by Edward Ruggeri on 8/14/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import "Hand.h"

#import "Card.h"
#import "Deck.h"

@interface Hand ()
@property (strong) NSMutableArray* cards;
@end

@implementation Hand
@synthesize cards = _cards;

-(id)init {
  self = [super init];
  
  if (!self)
    return nil;
  
  self.cards = [NSMutableArray new];
  return self;
}

-(NSString*)description {
  return [self.cards componentsJoinedByString:@""];
}

-(int)handValue {
  int totalValue = 0;
  for (Card* c in self.cards) {
    if (c.value == ACE)
      ; // skip for now
    else if (c.value == KING || c.value == QUEEN || c.value == JACK)
      totalValue += 10;
    else {
      totalValue += 2 + (c.value - DEUCE);
    }
  }
  
  for (Card* c in self.cards) {
    if (c.value == ACE) {
      if ((totalValue + 11) <= 21)
        totalValue += 11;
      else {
        totalValue += 1;
      }
    }
  }

  return totalValue;
}

-(NSString*)hiddenDealerDescription {
  return [NSString stringWithFormat:@"%@__", [self.cards objectAtIndex:0]];
}

-(void)takeCardFromDeck:(Deck*)deck {
  [self.cards addObject:[deck takeCard]];
}

-(void)returnCardsToDeck:(Deck*)deck {
  for (Card* card in self.cards) {
    [deck returnCard:card];
  }
  
  self.cards = [NSMutableArray new];
}
@end
