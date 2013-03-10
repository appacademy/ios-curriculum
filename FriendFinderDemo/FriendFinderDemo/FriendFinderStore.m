//
//  FriendFinderStore.m
//  FriendFinderDemo
//
//  Created by Edward Ruggeri on 8/30/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "FriendFinderStore.h"
#import <CoreData/CoreData.h>

NSManagedObjectContext* friendFinderContext;
NSManagedObjectModel* friendFinderModel;

@interface FriendFinderStore ()
+(NSManagedObjectContext*)context;
+(NSManagedObjectModel*)model;
@end

@implementation FriendFinderStore
+(NSManagedObjectModel*)model {
  if (!friendFinderModel) {
    friendFinderModel = [NSManagedObjectModel mergedModelFromBundles:nil];
  }
  
  return friendFinderModel;
}

+(NSManagedObjectContext*)context {
  if (!friendFinderContext) {
    NSArray* documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString* documentDirectory = [documentDirectories objectAtIndex:0];
    
    NSURL* storeURL = [NSURL fileURLWithPath:[documentDirectory stringByAppendingString:@"friendFinderStore.data"]];
    
    NSPersistentStoreCoordinator* psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[FriendFinderStore model]];
    
    NSError* err;
    if (![psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&err]) {
      [NSException raise:@"Open failed!"
                  format:@"Reason: %@", [err localizedDescription]];
    } else {
      friendFinderContext = [NSManagedObjectContext new];
      [friendFinderContext setPersistentStoreCoordinator:psc];
      
      // ???
      [friendFinderContext setUndoManager:nil];
    }
  }
  
  return friendFinderContext;
}

+(NSArray*)allFriends {
  NSFetchRequest* req = [NSFetchRequest new];
  req.entity = [[FriendFinderStore model].entitiesByName objectForKey:@"Friend"];
  
  NSError* err;
  NSArray* result = [[FriendFinderStore context] executeFetchRequest:req error:&err];
  if (!result) {
    [NSException raise:@"Fetch failed!"
                format:@"Reason: %@", [err localizedDescription]];
  }
  
  return result;
}

+(Friend*)createFriend {
  Friend* friend = [NSEntityDescription insertNewObjectForEntityForName:@"Friend" inManagedObjectContext:[FriendFinderStore context]];
  
  return friend;
}

+(void)save {
  NSError* err;
  if (![[FriendFinderStore context] save:&err]) {
    [NSException raise:@"Save failed!"
                format:@"Reason: %@", [err localizedDescription]];
  }
}
@end
