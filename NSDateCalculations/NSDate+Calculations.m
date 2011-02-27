//
//  NSDate+Calculations.m
//  NSDateCalculations
//
//  Created by Oscar Del Ben on 2/27/11.
//  Copyright 2011 DibiStore. All rights reserved.
//

#import "NSDate+Calculations.h"


@implementation NSDate (Calculations)

#pragma mark -
#pragma mark Beginning of

- (NSDate *)beginningOfDay
{
	NSCalendar *currentCalendar = [NSCalendar currentCalendar];
	int calendarComponents = (NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit);
	NSDateComponents *comps = [currentCalendar components:calendarComponents fromDate:self];
	
	[comps setHour:0];
	[comps setMinute:0];
	[comps setSecond:0];
	
	return [currentCalendar dateFromComponents:comps];
}

- (NSDate *)beginningOfMonth
{
	NSCalendar *currentCalendar = [NSCalendar currentCalendar];
	int calendarComponents = (NSYearCalendarUnit | NSMonthCalendarUnit);
	NSDateComponents *comps = [currentCalendar components:calendarComponents fromDate:self];
	
	[comps setDay:1];
	[comps setHour:0];
	[comps setMinute:00];
	[comps setSecond:00];
	
	return [currentCalendar dateFromComponents:comps];
}

// 1st of january, april, july, october
- (NSDate *)beginningOfQuarter
{
	NSCalendar *currentCalendar = [NSCalendar currentCalendar];
	int calendarComponents = (NSYearCalendarUnit | NSMonthCalendarUnit);
	NSDateComponents *comps = [currentCalendar components:calendarComponents fromDate:self];
	
	int month = [comps month];
	
	if (month < 4)
		[comps setMonth:1];
	else if (month < 7)
		[comps setMonth:4];
	else if (month < 10)
		[comps setMonth:7];
	else
		[comps setMonth:10];
		
	[comps setDay:1];
	[comps setHour:0];
	[comps setMinute:00];
	[comps setSecond:00];
	
	return [currentCalendar dateFromComponents:comps];
}

// Week starts on sunday for the gregorian calendar
- (NSDate *)beginningOfWeek
{
	NSCalendar *currentCalendar = [NSCalendar currentCalendar];
	int calendarComponents = (NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekCalendarUnit | NSWeekdayCalendarUnit);
	NSDateComponents *comps = [currentCalendar components:calendarComponents fromDate:self];
	
	[comps setWeekday:1];
	[comps setHour:0];
	[comps setMinute:0];
	[comps setSecond:0];
	
	return [currentCalendar dateFromComponents:comps];
}
			  
- (NSDate *)beginningOfYear
{
	NSCalendar *currentCalendar = [NSCalendar currentCalendar];
	int calendarComponents = (NSYearCalendarUnit);
	NSDateComponents *comps = [currentCalendar components:calendarComponents fromDate:self];
	
	[comps setMonth:1];
	[comps setDay:1];
	[comps setHour:0];
	[comps setMinute:0];
	[comps setSecond:0];
	
	return [currentCalendar dateFromComponents:comps];
}

#pragma mark -
#pragma mark End of

- (NSDate *)endOfDay
{
	NSCalendar *currentCalendar = [NSCalendar currentCalendar];
	int calendarComponents = (NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit);
	NSDateComponents *comps = [currentCalendar components:calendarComponents fromDate:self];
	
	[comps setHour:23];
	[comps setMinute:59];
	[comps setSecond:59];
	
	return [currentCalendar dateFromComponents:comps];
}

- (NSDate *)endOfMonth
{
	NSCalendar *currentCalendar = [NSCalendar currentCalendar];
	int calendarComponents = (NSYearCalendarUnit | NSMonthCalendarUnit);
	NSDateComponents *comps = [currentCalendar components:calendarComponents fromDate:self];
	
	[comps setDay:[self daysInMonth]];
	[comps setHour:23];
	[comps setMinute:59];
	[comps setSecond:59];
	
	return [currentCalendar dateFromComponents:comps];
}

// 1st of january, april, july, october
- (NSDate *)endOfQuarter
{
	NSCalendar *currentCalendar = [NSCalendar currentCalendar];
	int calendarComponents = (NSYearCalendarUnit | NSMonthCalendarUnit);
	NSDateComponents *comps = [currentCalendar components:calendarComponents fromDate:self];
	
	int month = [comps month];
	
	if (month < 4)
	{
		[comps setMonth:3];
		[comps setDay:31];
	}
	else if (month < 7)
	{
		[comps setMonth:6];
		[comps setDay:30];
	}
	else if (month < 10)
	{
		[comps setMonth:9];
		[comps setDay:30];
	}
	else
	{
		[comps setMonth:12];
		[comps setDay:31];
	}
	
	[comps setHour:23];
	[comps setMinute:59];
	[comps setSecond:59];
	
	return [currentCalendar dateFromComponents:comps];
}

- (NSDate *)endOfWeek
{
	NSCalendar *currentCalendar = [NSCalendar currentCalendar];
	int calendarComponents = (NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekCalendarUnit | NSWeekdayCalendarUnit);
	NSDateComponents *comps = [currentCalendar components:calendarComponents fromDate:self];
	
	[comps setWeekday:7];
	[comps setHour:23];
	[comps setMinute:59];
	[comps setSecond:59];
	
	return [currentCalendar dateFromComponents:comps];
}

- (NSDate *)endOfYear
{
	NSCalendar *currentCalendar = [NSCalendar currentCalendar];
	int calendarComponents = (NSYearCalendarUnit);
	NSDateComponents *comps = [currentCalendar components:calendarComponents fromDate:self];
	
	[comps setMonth:12];
	[comps setDay:31];
	[comps setHour:23];
	[comps setMinute:59];
	[comps setSecond:59];
	
	return [currentCalendar dateFromComponents:comps];
}

#pragma mark -
#pragma mark Days in month

- (int)daysInMonth
{
	NSCalendar *currentCalendar = [NSCalendar currentCalendar];
	NSRange days = [currentCalendar rangeOfUnit:NSDayCalendarUnit
										 inUnit:NSMonthCalendarUnit
										forDate:self];
	return days.length;
}

@end
