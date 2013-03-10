//
//  Friend.h
//  FriendFinderDemo
//
//  Created by Edward Ruggeri on 8/30/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Friend : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSData * photoData;

@property (nonatomic, strong) UIImage* photo;

@end
