//
//  FriendFinderStore.h
//  FriendFinderDemo
//
//  Created by Edward Ruggeri on 8/30/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Friend;

@interface FriendFinderStore : NSObject
+(NSArray*)allFriends;
+(Friend*)createFriend;
+(void)save;
@end
