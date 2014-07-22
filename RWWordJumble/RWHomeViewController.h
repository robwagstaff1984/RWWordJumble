//
//  RWHomeViewController.h
//  RWWordJumble
//
//  Created by Robert Wagstaff on 7/20/14.
//  Copyright (c) 2014 Robert Wagstaff. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RWHomeViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField* inputTextField;
@property (nonatomic, weak) IBOutlet UITextView* outputTextView;

@end
