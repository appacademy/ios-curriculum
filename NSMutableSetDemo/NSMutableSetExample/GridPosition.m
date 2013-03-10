//
//  GridPosition.m
//  NSMutableSetExample
//
//  Created by Edward Ruggeri on 9/6/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import "GridPosition.h"

@implementation GridPosition
-(NSString*)description {
  return [NSString stringWithFormat:@"(%d, %d)", self.row, self.col];
}

//-(BOOL)isEqual:(id)object {
//  if ([object isMemberOfClass:[GridPosition class]]) {
//    GridPosition* otherPos = object;
//    return (otherPos.row == self.row) && (otherPos.col == self.col);
//  } else {
//    return false;
//  }
//}
//
//-(NSUInteger)hash {
//  return @{
//    @"row" : @(self.row),
//    @"col" : @(self.col)
//  }.hash;
//}
@end
