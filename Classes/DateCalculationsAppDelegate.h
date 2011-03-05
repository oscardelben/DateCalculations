//
//  NSDateCalculationsAppDelegate.h
//  NSDateCalculations
//
//  Created by Oscar Del Ben on 2/27/11.
//  Copyright 2011 DibiStore. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DateCalculationsViewController;

@interface DateCalculationsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    DateCalculationsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet DateCalculationsViewController *viewController;

@end

