//
//  RWWordsManager.m
//  RWWordJumble
//
//  Created by Robert Wagstaff on 7/21/14.
//  Copyright (c) 2014 Robert Wagstaff. All rights reserved.
//

#import "RWWordsManager.h"
#import "NSString+SortExtension.h"
#import "RWLetterFrequencies.h"

@implementation RWWordsManager

+(RWWordsManager*) sharedWordsManager {
    
    static RWWordsManager* _sharedWordsManager;
    if(!_sharedWordsManager) {
        _sharedWordsManager = [self new];
        [_sharedWordsManager loadWordsFile];
    }
    return _sharedWordsManager;
}

-(void)loadWordsFile {
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"deDuplicatedWords" ofType:@"txt"];
    NSError *error;
    NSString *fileContents = [NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:&error];
    
    if (error) {
        NSLog(@"Error reading file: %@", error.localizedDescription);
    }
    self.englishWords = [fileContents componentsSeparatedByString:@"\n"];
}


+(NSArray*) anagramsForInput:(NSString*)input {
    RWLetterFrequencies* inputLetterFrequencies = [[RWLetterFrequencies alloc] initWithWord:input];
    NSMutableArray* anagarms = [[NSMutableArray alloc] init];
    
    for (int count = 0; count < [[RWWordsManager sharedWordsManager].englishWords count]; count++) {
        RWLetterFrequencies* currentLetterFrequencies = [self letterFrequenciesForWordNumber:count];
        
        if ([currentLetterFrequencies isSubAnagramOf:inputLetterFrequencies]) {
            [anagarms addObject:currentLetterFrequencies.word];
        }
    }
    NSLog(@"anagarms of %@: %@", inputLetterFrequencies.word, anagarms);
    return anagarms;
}

+(RWLetterFrequencies*) letterFrequenciesForWordNumber:(int)wordNumber {
    NSString* currentWord = [RWWordsManager sharedWordsManager].englishWords[wordNumber];
    RWLetterFrequencies* currentLetterFrequencies = [[RWLetterFrequencies alloc] initWithWord:currentWord];
    return currentLetterFrequencies;
}

// [RWLetterFrequencies alloc] initW
//    RWLetterFrequencies* word1 =  [[RWLetterFrequencies alloc] initWithWord:@"dog"];
//    RWLetterFrequencies* word2 =  [[RWLetterFrequencies alloc] initWithWord:@"god"];
//    RWLetterFrequencies* word3 =  [[RWLetterFrequencies alloc] initWithWord:@"go"];
//    RWLetterFrequencies* word4 =  [[RWLetterFrequencies alloc] initWithWord:@"abcde"];
////    RWLetterFrequencies* word2 =  [self letterFrequenciesFor:@"god"];
////    RWLetterFrequencies* word3 =  [self letterFrequenciesFor:@"go"];
////    RWLetterFrequencies* word4 =  [self letterFrequenciesFor:@"abcde"];
//
//    BOOL test = [word3 isSubAnagramOf:word1]; // Y
//    BOOL test2 = [word1 isSubAnagramOf:word3]; // N
//    BOOL test3 = [word1 isSubAnagramOf:word1]; // Y
//
//    BOOL test4 = [word4 isSubAnagramOf:word1]; // N
//    BOOL test5 = [word1 isSubAnagramOf:word4]; // N
//





@end
