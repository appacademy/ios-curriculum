//
//  Card.m
//  Blackjack
//
//  Created by Edward Ruggeri on 8/14/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import "Card.h"

@implementation Card
@synthesize suit = _suit;
@synthesize value = _value;

-(NSString*)description {
  NSString* suitString;
  NSString* valueString;
  
  if (self.suit == CLUBS)
    suitString = @"C";
  else if (self.suit == DIAMONDS)
    suitString = @"D";
  else if (self.suit == HEARTS)
    suitString = @"H";
  else if (self.suit == SPADES)
    suitString = @"S";
  
  if (self.value == ACE)
    valueString = @"A";
  else if (self.value == TEN)
    valueString = @"10";
  else if (self.value == JACK)
    valueString = @"J";
  else if (self.value == QUEEN)
    valueString = @"Q";
  else if (self.value == KING)
    valueString = @"K";
  else {
    valueString = [NSString stringWithFormat:@"%c", '2' + (self.value - DEUCE)];
  }
  
  return [NSString stringWithFormat:@"%@%@", suitString, valueString];
}

+(Card*)cardWithSuit:(Suit)suit andValue:(Value)value {
  Card* c = [Card new];
  c.suit = suit;
  c.value = value;
  
  return c;
}
@end
