//
//  Friend.m
//  FriendFinderDemo
//
//  Created by Edward Ruggeri on 8/30/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "Friend.h"

@interface Friend ()
@end

@implementation Friend

@dynamic name;
@dynamic photoData;
@dynamic photo;

-(void)awakeFromFetch {
  [super awakeFromFetch];
  UIImage* photo = [UIImage imageWithData:self.photoData];
  [self setPrimitiveValue:photo forKey:@"photo"];
}

-(void)awakeFromInsert {
  [super awakeFromInsert];
}

@end
