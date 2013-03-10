//
//  Card.h
//  Blackjack
//
//  Created by Edward Ruggeri on 8/14/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
  CLUBS,
  DIAMONDS,
  HEARTS,
  SPADES
} Suit;

typedef enum {
  ACE,
  DEUCE,
  THREE,
  FOUR,
  FIVE,
  SIX,
  SEVEN,
  EIGHT,
  NINE,
  TEN,
  JACK,
  QUEEN,
  KING
} Value;

@interface Card : NSObject
@property Suit suit;
@property Value value;

+(Card*)cardWithSuit:(Suit)suit andValue:(Value)value;
@end
