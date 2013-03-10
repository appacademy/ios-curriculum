//
//  Deck.h
//  Blackjack
//
//  Created by Edward Ruggeri on 8/14/12.
//  Copyright (c) 2012 Hash Map Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Card;

@interface Deck : NSObject
-(void)returnCard:(Card*)card;
-(void)shuffle;
-(Card*)takeCard;
@end
