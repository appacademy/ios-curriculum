//
//  MessageStore.m
//  MessengerApp
//
//  Created by Edward Ruggeri on 8/20/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "MessageStore.h"
#import "Message.h"
#import <Parse/Parse.h>

@implementation MessageStore
+(void)initializeMessageStore {
  [Parse setApplicationId:@"ohiq6YmH3jnTQNNdYaweo7QNV7QQvSfjubruUrE7" clientKey:@"wygjocJgntnndgS80aL2BOe7dHbb0emqYmnL4q8B"];
}

+(void)sendMessageToUser:(NSString *)toUser fromUser:(NSString *)fromUser title:(NSString *)title body:(NSString *)body {
  PFObject* obj = [PFObject objectWithClassName:@"Message"];
  [obj setObject:toUser forKey:@"to_user"];
  [obj setObject:fromUser forKey:@"from_user"];
  [obj setObject:title forKey:@"title"];
  [obj setObject:body forKey:@"body"];
  
  [obj save];
}

+(NSArray*)messagesForUser:(NSString *)userName {
  PFQuery* query = [PFQuery queryWithClassName:@"Message"];
  [query whereKey:@"to_user" equalTo:userName];
  NSArray* parseObjects = [query findObjects];

  // XXX equivalent to Ruby's map method?
  NSMutableArray* messages = [NSMutableArray new];
  for (PFObject* parseObject in parseObjects) {
    Message* msg = [Message new];
    msg.fromUser = [parseObject objectForKey:@"from_user"];
    msg.toUser = [parseObject objectForKey:@"to_user"];
    msg.title = [parseObject objectForKey:@"title"];
    msg.body = [parseObject objectForKey:@"body"];
    
    [messages addObject:msg];
  }
  
  return messages;
}
@end
