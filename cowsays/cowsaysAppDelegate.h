//
//  cowsaysAppDelegate.h
//  cowsays
//
//  Created by Shabda Raaj on 10/11/11.
//  Copyright 2011 Agiliq. All rights reserved.
//

#import <UIKit/UIKit.h>

@class cowsaysViewController;

@interface cowsaysAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet cowsaysViewController *viewController;

@end
