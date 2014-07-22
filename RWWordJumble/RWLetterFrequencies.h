//
//  RWLetterFrequencies.h
//  RWWordJumble
//
//  Created by Robert Wagstaff on 7/21/14.
//  Copyright (c) 2014 Robert Wagstaff. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RWLetterFrequencies : NSObject

@property (nonatomic, strong) NSString* word;
@property(nonatomic, strong) NSMutableArray*letterFrequencies;

-(id)initWithWord:(NSString*)word;
-(BOOL)isSubAnagramOf:(RWLetterFrequencies *)letterFrequencies;

@end
