//
//  Message.h
//  MessengerApp
//
//  Created by Edward Ruggeri on 8/20/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject
@property (strong) NSString* fromUser;
@property (strong) NSString* toUser;
@property (strong) NSString* title;
@property (strong) NSString* body;
@end
