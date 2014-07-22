//
//  RWHomeViewController.m
//  RWWordJumble
//
//  Created by Robert Wagstaff on 7/20/14.
//  Copyright (c) 2014 Robert Wagstaff. All rights reserved.
//

#import "RWHomeViewController.h"
#import "RWWordsManager.h"

@interface RWHomeViewController ()

@end

@implementation RWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.inputTextField.delegate = self;
    [self.outputTextView setContentSize:CGSizeMake(self.outputTextView.frame.size.width, self.outputTextView.frame.size.height)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSArray*anagrams = [RWWordsManager anagramsForInput:textField.text];
    self.outputTextView.text = [self outputTextForAnagrams:anagrams];
    return YES;
}

-(NSString*) outputTextForAnagrams:(NSArray*)anagrams {
    
    NSString* outputText = @"";
    for (NSString *anagram in anagrams) {
        outputText = [NSString stringWithFormat:@"%@, %@", outputText, anagram];
    }
    return [outputText substringFromIndex:2];
}

@end
