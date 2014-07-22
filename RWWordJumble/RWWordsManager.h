//
//  RWWordsManager.h
//  RWWordJumble
//
//  Created by Robert Wagstaff on 7/21/14.
//  Copyright (c) 2014 Robert Wagstaff. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RWWordsManager : NSObject

@property (nonatomic, strong) NSArray* englishWords;
+(NSArray*) anagramsForInput:(NSString*)input;

@end
