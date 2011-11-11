//
//  cowsaysViewController.h
//  cowsays
//
//  Created by Shabda Raaj on 10/11/11.
//  Copyright 2011 Agiliq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cowsaysViewController : UIViewController {
    UITextView *original;
    UITextView *withCow;
}

- (IBAction)tuxSay:(id)sender;
- (IBAction)cowSay:(id)sender;
- (IBAction)randomSay:(id)sender;

@property (nonatomic, retain) IBOutlet UITextView *original;
@property (nonatomic, retain) IBOutlet UITextView *withCow;

@end
