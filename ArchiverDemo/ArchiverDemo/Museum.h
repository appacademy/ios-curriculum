//
//  Pope.h
//  ArchiverDemo
//
//  Created by Edward Ruggeri on 9/4/12.
//  Copyright (c) 2012 Edward Ruggeri. All rights reserved.
//

#import <Foundation/Foundation.h>

// NSCoding tells NSKeyArchiver how to store that raw data.
//encodeWithCoder is the method to implement for it.
@interface Museum : NSObject <NSCoding>
@property (strong) NSString* museumName;

@property (strong) NSString* founderName;
@property int foundingYear;
@end
