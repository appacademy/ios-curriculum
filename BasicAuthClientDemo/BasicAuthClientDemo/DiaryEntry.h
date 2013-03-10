//
//  DiaryEntry.h
//  BasicAuthClientDemo
//
//  Created by Edward Ruggeri on 9/13/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DiaryEntry : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * diaryEntryId;

@end
