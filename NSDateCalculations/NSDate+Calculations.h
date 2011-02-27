//
//  NSDate+Calculations.h
//  NSDateCalculations
//
//  Created by Oscar Del Ben on 2/27/11.
//  Copyright 2011 DibiStore. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDate (Calculations)

- (NSDate *)beginningOfDay;
- (NSDate *)beginningOfMonth;
- (NSDate *)beginningOfQuarter;
- (NSDate *)beginningOfWeek;
- (NSDate *)beginningOfYear;

- (NSDate *)endOfDay;
- (NSDate *)endOfMonth;
- (NSDate *)endOfQuarter;
- (NSDate *)endOfWeek;
- (NSDate *)endOfYear;

- (int)daysInMonth;

@end
