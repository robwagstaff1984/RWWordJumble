//
//  RWLetterFrequencies.m
//  RWWordJumble
//
//  Created by Robert Wagstaff on 7/21/14.
//  Copyright (c) 2014 Robert Wagstaff. All rights reserved.
//

#define LETTERS_IN_THE_ALPHABET 26
#define ASCII_CODE_OFFSET 97

#import "RWLetterFrequencies.h"

@implementation RWLetterFrequencies

/*
 Discussion:
 This algorithm creates an int array of length 26 to represent the frequency of letters occuring for a particular word. A word is a 'sub-anagram' of another word if the letter frequencies for the first word are less than or equal to the letter frequencies of another word. e.g. kite is a sub-anagram of kitten
 
 Word source: A deduplicated and lowercased version of the words file available on all unix like machines.
 (note: single letters are valid words in this word source)
 
 Performance: O(N)
 Each time a word is entered the algorithm visits every item in the Array of valid words and compares letter frequencies.
 
 Performance improvements if given more time:
 Preprocess the Array of valid words to create a directed acyclic graph of sub-anagram relationship.
 Each node will contain a list of exact letter count anagagrams and children who are sub-anagrams of the parent.
 
 Then finding all the anagrams would be as quick as searching for the top node and recursively printing all the sub-anagrams
 
 The comparison check between LetterFrequency arrays could also be optimised further.
 */

- (RWLetterFrequencies*)initWithWord:(NSString*)word
{
    self = [super init];
    if (self) {
        self.word = [word lowercaseString];
        self.letterFrequencies = [NSMutableArray arrayWithArray:@[@(0),@(0),@(0),@(0),@(0),@(0),@(0),@(0),@(0),@(0),@(0),@(0),@(0),@(0),@(0),@(0),@(0),@(0),@(0),@(0),@(0),@(0),@(0),@(0),@(0),@(0)]];
        [self setCurrentLetterFrequencies];
    }
    return self;
}


-(void) setCurrentLetterFrequencies
{
    NSUInteger wordLength = [self.word length];
    unichar buffer[wordLength+1];
    
    [self.word getCharacters:buffer range:NSMakeRange(0, wordLength)];
    for(int i = 0; i < wordLength; i++) {
        int letterPositionInAlphabet = buffer[i] - ASCII_CODE_OFFSET;
        
        if ([self isValidLetterPosition:letterPositionInAlphabet]) {
            [self incrementLetterFrequencyAtLetterPosition:letterPositionInAlphabet];
        }
    }
}

-(BOOL) isValidLetterPosition:(int)letterPositionInAlphabet {
    return letterPositionInAlphabet >= 0 && letterPositionInAlphabet <= LETTERS_IN_THE_ALPHABET;
}

-(void) incrementLetterFrequencyAtLetterPosition:(int)letterPositionInAlphabet {
    
    NSNumber* currentLetterFrequency = (NSNumber*)[self.letterFrequencies objectAtIndex:letterPositionInAlphabet];
    currentLetterFrequency = @(currentLetterFrequency.integerValue+1);
    
    [self.letterFrequencies setObject:currentLetterFrequency atIndexedSubscript:letterPositionInAlphabet];
}



-(BOOL)isSubAnagramOf:(RWLetterFrequencies *)otherLetterFrequencies {
    
    for (int letterNumber=0; letterNumber < LETTERS_IN_THE_ALPHABET; letterNumber++) {
        int currentLetterFrequencyOfSelf = [((NSNumber*)self.letterFrequencies[letterNumber]) intValue];
        int currentLetterFrequencyOfComparison = [((NSNumber*)otherLetterFrequencies.letterFrequencies[letterNumber]) intValue];
        
        if(currentLetterFrequencyOfSelf > currentLetterFrequencyOfComparison ) {
            return NO;
        }
    }
    return YES;
}

@end
