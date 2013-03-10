//
//  MessageStore.h
//  MessengerApp
//
//  Created by Edward Ruggeri on 8/20/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageStore : NSObject
+(void)initializeMessageStore;
+(NSArray*)messagesForUser:(NSString*)userName;
+(void)sendMessageToUser:(NSString*)toUser fromUser:(NSString*)fromUser title:(NSString*)title body:(NSString*)body;
@end
