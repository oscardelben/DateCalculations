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

- (NSDate *)advance:(int)years months:(int)months weeks:(int)weeks days:(int)days 
			  hours:(int)hours minutes:(int)minutes seconds:(int)seconds;

- (NSDate *)ago:(int)years months:(int)months weeks:(int)weeks days:(int)days 
			  hours:(int)hours minutes:(int)minutes seconds:(int)seconds;

- (NSDate *)change:(NSDictionary *)changes;

- (int)daysInMonth;

- (NSDate *)monthsSince:(int)months;

- (NSDate *)nextMonth;
- (NSDate *)nextWeek;
- (NSDate *)nextYear;

- (NSDate *)prevMonth;
- (NSDate *)prevYear;
- (NSDate *)yearsAgo:(int)years;

- (NSDate *)tomorrow;

- (BOOL)future;
- (BOOL)past;
- (BOOL)today;

@end
