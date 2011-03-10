//
//  NSDate+Calculations.m
//  NSDateCalculations
//
//  Created by Oscar Del Ben on 2/27/11.
//  Copyright 2011 DibiStore. All rights reserved.
//

#import "NSDate+Calculations.h"


@implementation NSDate (Calculations)

+ (NSDate *)dateWithYear:(int)year month:(int)month day:(int)day hour:(int)hour minute:(int)minute second:(int)second
{
	NSDateComponents *comps = [[[NSDateComponents alloc] init] autorelease];
	[comps setYear:year];
	[comps setMonth:month];
	[comps setDay:day];
	[comps setHour:hour];
	[comps setMinute:minute];
	[comps setSecond:second];
	
	return [[NSCalendar currentCalendar] dateFromComponents:comps];
}

+ (NSDate *)createDate:(int)year month:(int)month day:(int)day hour:(int)hour minute:(int)minute second:(int)second
{
	NSLog(@"createDate:month:day:hour:minute:second has been deprecated. Use dateWithYear:month:day:hour:minute:second");
	return [self dateWithYear:year month:month day:day hour:hour minute:minute second:second];
}


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
#pragma mark Other Calculations

- (NSDate *)advance:(int)years months:(int)months weeks:(int)weeks days:(int)days 
			  hours:(int)hours minutes:(int)minutes seconds:(int)seconds
{
	NSDateComponents *comps = [[[NSDateComponents alloc] init] autorelease];
	[comps setYear:years];
	[comps setMonth:months];
	[comps setWeek:weeks];
	[comps setDay:days];
	[comps setHour:hours];
	[comps setMinute:minutes];
	[comps setSecond:seconds];
	
	return [[NSCalendar currentCalendar] dateByAddingComponents:comps toDate:self options:0];
}

- (NSDate *)ago:(int)years months:(int)months weeks:(int)weeks days:(int)days 
		  hours:(int)hours minutes:(int)minutes seconds:(int)seconds
{
	NSDateComponents *comps = [[[NSDateComponents alloc] init] autorelease];
	[comps setYear:-years];
	[comps setMonth:-months];
	[comps setWeek:-weeks];
	[comps setDay:-days];
	[comps setHour:-hours];
	[comps setMinute:-minutes];
	[comps setSecond:-seconds];
	
	return [[NSCalendar currentCalendar] dateByAddingComponents:comps toDate:self options:0];
}

- (NSDate *)change:(NSDictionary *)changes
{
	NSCalendar *currentCalendar = [NSCalendar currentCalendar];
	
	int calendarComponents = (NSEraCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit |
							  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit |
							  NSWeekCalendarUnit | NSWeekdayCalendarUnit |  NSWeekdayOrdinalCalendarUnit |
							  NSQuarterCalendarUnit);
	
	NSDateComponents *comps = [currentCalendar components:calendarComponents fromDate:self];
	
	for (id key in changes) {
		SEL selector = NSSelectorFromString([NSString stringWithFormat:@"set%@:", [key capitalizedString]]);
		int value = [[changes valueForKey:key] intValue];
		
		NSInvocation *inv = [NSInvocation invocationWithMethodSignature:[comps methodSignatureForSelector:selector]];
		[inv setSelector:selector];
		[inv setTarget:comps];
		[inv setArgument:&value atIndex:2]; //arguments 0 and 1 are self and _cmd respectively, automatically set by NSInvocation
		[inv invoke];
	}

	return [currentCalendar dateFromComponents:comps];
}

- (int)daysInMonth
{
	NSCalendar *currentCalendar = [NSCalendar currentCalendar];
	NSRange days = [currentCalendar rangeOfUnit:NSDayCalendarUnit
										 inUnit:NSMonthCalendarUnit
										forDate:self];
	return days.length;
}

- (NSDate *)monthsSince:(int)months
{
	return [self advance:0 months:months weeks:0 days:0 hours:0 minutes:0 seconds:0];
}

- (NSDate *)yearsSince:(int)years
{
	return [self advance:years months:0 weeks:0 days:0 hours:0 minutes:0 seconds:0];
}

- (NSDate *)nextMonth
{
	return [self monthsSince:1];
}

- (NSDate *)nextWeek
{
	return [self advance:0 months:0 weeks:1 days:0 hours:0 minutes:0 seconds:0];
}

- (NSDate *)nextYear
{
	return [self advance:1 months:0 weeks:0 days:0 hours:0 minutes:0 seconds:0];
}

- (NSDate *)prevMonth
{
	return [self monthsSince:-1];
}

- (NSDate *)prevYear
{
	return [self yearsAgo:1];
}

- (NSDate *)yearsAgo:(int)years
{
	return [self advance:-years months:0 weeks:0 days:0 hours:0 minutes:0 seconds:0];
}

- (NSDate *)yesterday
{
	return [self advance:0 months:0 weeks:0 days:-1 hours:0 minutes:0 seconds:0];
}

- (NSDate *)tomorrow
{
	return [self advance:0 months:0 weeks:0 days:1 hours:0 minutes:0 seconds:0];
}

- (BOOL)future
{
	return self == [self laterDate:[NSDate date]];
}

- (BOOL)past
{
	return self == [self earlierDate:[NSDate date]];
}

- (BOOL)today
{
	return self == [self laterDate:[[NSDate date] beginningOfDay]] &&
		self == [self earlierDate:[[NSDate date] endOfDay]];
}

@end
