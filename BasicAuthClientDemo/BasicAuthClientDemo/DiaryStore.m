//
//  DiaryStore.m
//  BasicAuthClientDemo
//
//  Created by Edward Ruggeri on 9/12/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "DiaryStore.h"

#import "DiaryEntry.h"
#import "RestKit.h"

static RKObjectManager* diaryObjectManager;

@implementation DiaryStore
+(void)setupDiaryStore:(NSString*)userName password:(NSString*)password {
  RKClient* diaryClient = [RKClient clientWithBaseURLString:@"http://localhost:3000"];
  diaryClient.username = userName;
  diaryClient.password = password;
  
  diaryObjectManager = [[RKObjectManager alloc] init];
  diaryObjectManager.client = diaryClient;
  
  diaryObjectManager.objectStore = [RKManagedObjectStore objectStoreWithStoreFilename:@"diaryEntryStore.sqlite3"];
  
  [self setupDiaryEntryMapping];
}

+(void)setupDiaryEntryMapping {
  RKManagedObjectMapping* diaryEntryMapping = [RKManagedObjectMapping mappingForClass:[DiaryEntry class] inManagedObjectStore:diaryObjectManager.objectStore];
  // XXX: OMG, objectClass is set wrong until we specify it.
  // Filing a bug report...
  diaryEntryMapping.objectClass = [DiaryEntry class];
  [diaryEntryMapping mapKeyPath:@"id" toAttribute:@"diaryEntryId"];
  [diaryEntryMapping mapAttributes:@"title", nil];
  diaryEntryMapping.primaryKeyAttribute = @"diaryEntryId";
  
  [diaryObjectManager.mappingProvider addObjectMapping:diaryEntryMapping];
  
  RKObjectMapping* serializationMapping = diaryEntryMapping.inverseMapping;
  serializationMapping.rootKeyPath = @"diary_entry";
  [diaryObjectManager.mappingProvider setSerializationMapping:serializationMapping forClass:[DiaryEntry class]];
  
  [diaryObjectManager.router routeClass:[DiaryEntry class] toResourcePath:@"/diary_entries.json"];
}

+(void)fetchDiaryEntries:(void(^)(void))completionBlock {
  [diaryObjectManager loadObjectsAtResourcePath:@"/diary_entries.json" usingBlock:^(RKObjectLoader *loader) {
    loader.objectMapping = [diaryObjectManager.mappingProvider objectMappingForClass:[DiaryEntry class]];
    
    loader.onDidLoadObjects = ^(NSArray* objects) {
      if (completionBlock)
        completionBlock();
    };
    loader.onDidFailLoadWithError = ^(NSError* err) {
      NSLog(@"%@", err);
    };
  }];
}

+(void)saveDiaryEntry:(DiaryEntry*)diaryEntry {
  [diaryObjectManager postObject:diaryEntry delegate:nil];
}

@end
