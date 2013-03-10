//
//  Hand.h
//  Blackjack
//
//  Created by Edward Ruggeri on 8/14/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Deck;

@interface Hand : NSObject
-(NSString*)hiddenDealerDescription;
-(int)handValue;
-(void)returnCardsToDeck:(Deck*)deck;
-(void)takeCardFromDeck:(Deck*)deck;
@end
