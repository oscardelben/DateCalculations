//
//  NSDateCalculationsAppDelegate.h
//  NSDateCalculations
//
//  Created by Oscar Del Ben on 2/27/11.
//  Copyright 2011 DibiStore. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NSDateCalculationsViewController;

@interface NSDateCalculationsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    NSDateCalculationsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet NSDateCalculationsViewController *viewController;

@end

