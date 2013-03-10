//
//  Deck.m
//  Blackjack
//
//  Created by Edward Ruggeri on 8/14/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import "Deck.h"

#import "Card.h"

@interface Deck ()
@property (strong) NSMutableArray* cards;
@end

@implementation Deck
@synthesize cards = _cards;

-(id)init {
  self = [super init];
  
  if (!self)
    return nil;
  
  self.cards = [NSMutableArray new];
  for (Suit s = CLUBS; s <= SPADES; ++s) {
    for (Value v = ACE; v <= KING; ++v) {
      [self.cards addObject:[Card cardWithSuit:s andValue:v]];
    }
  }
  
  return self;
}

-(void)returnCard:(Card*)card {
  [self.cards insertObject:card atIndex:0];
}

-(void)shuffle {
  for (int i = 0; i < self.cards.count; ++i) {
    int swapPos = arc4random() % self.cards.count;
    [self.cards exchangeObjectAtIndex:i withObjectAtIndex:swapPos];
  }
}

-(Card*)takeCard {
  Card* topCard = [self.cards lastObject];
  [self.cards removeLastObject];
  
  return topCard;
}
@end
