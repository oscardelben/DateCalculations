//
//  NSDateCalculationsTest.m
//  NSDateCalculations
//
//  Created by Oscar Del Ben on 2/27/11.
//  Copyright 2011 DibiStore. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>
#import "NSDate+Calculations.h"


@interface NSDateCalculationsTest : SenTestCase
@end

@implementation NSDateCalculationsTest

#pragma mark -
#pragma mark Helpers

- (NSDate *)createDate:(int)year month:(int)month day:(int)day hour:(int)hour minute:(int)minute second:(int)second
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

// 2011 06 23 - 10:15:00
- (NSDate *)defaultDate
{
	return [self createDate:2011 month:6 day:23 hour:10 minute:15 second:0];
}

- (NSString *)formattedDate:(NSDate *)date
{
	NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];

	[formatter setDateFormat:@"yyyy MM dd - HH:mm:ss"];
	
	return [formatter stringFromDate:date];
}

#pragma mark -
#pragma mark Tests Beginning of

- (void)testBeginningOfDay;
{	
	NSString *result = [self formattedDate:[[self defaultDate] beginningOfDay]];
	NSString *expected = @"2011 06 23 - 00:00:00";
	
	STAssertEqualObjects(result, expected, nil);
}


- (void)testBeginningOfMonth;
{	
	NSString *result = [self formattedDate:[[self defaultDate] beginningOfMonth]];
	NSString *expected = @"2011 06 01 - 00:00:00";
	
	STAssertEqualObjects(result, expected, nil);
}

- (void)testBeginningOfQuarter1
{
	NSDate *date = [self createDate:2011 month:2 day:14 hour:13 minute:12 second:0];
	NSString *result = [self formattedDate:[date beginningOfQuarter]];
	NSString *expected = @"2011 01 01 - 00:00:00";
	
	STAssertEqualObjects(result, expected, nil);
}

- (void)testBeginningOfQuarter2
{
	NSDate *date = [self createDate:2011 month:5 day:14 hour:13 minute:12 second:0];
	NSString *result = [self formattedDate:[date beginningOfQuarter]];
	NSString *expected = @"2011 04 01 - 00:00:00";
	
	STAssertEqualObjects(result, expected, nil);
}

- (void)testBeginningOfQuarter3
{
	NSDate *date = [self createDate:2011 month:9 day:14 hour:13 minute:12 second:0];
	NSString *result = [self formattedDate:[date beginningOfQuarter]];
	NSString *expected = @"2011 07 01 - 00:00:00";
	
	STAssertEqualObjects(result, expected, nil);
}

- (void)testBeginningOfQuarter4
{
	NSDate *date = [self createDate:2011 month:12 day:14 hour:13 minute:12 second:0];
	NSString *result = [self formattedDate:[date beginningOfQuarter]];
	NSString *expected = @"2011 10 01 - 00:00:00";
	
	STAssertEqualObjects(result, expected, nil);
}

- (void)testBeginningOfWeek
{
	NSString *result = [self formattedDate:[[self defaultDate] beginningOfWeek]];
	NSString *expected = @"2011 06 19 - 00:00:00";
	
	STAssertEqualObjects(result, expected, nil);
}

- (void)testBeginningOfYear
{
	NSString *result = [self formattedDate:[[self defaultDate] beginningOfYear]];
	NSString *expected = @"2011 01 01 - 00:00:00";
	
	STAssertEqualObjects(result, expected, nil);
}

#pragma mark -
#pragma mark Tests End of

- (void)testEndOfDay
{
	NSString *result = [self formattedDate:[[self defaultDate] endOfDay]];
	NSString *expected = @"2011 06 23 - 23:59:59";
	
	STAssertEqualObjects(result, expected, nil);
}

- (void)testEndOfMonth
{
	NSString *result = [self formattedDate:[[self defaultDate] endOfMonth]];
	NSString *expected = @"2011 06 30 - 23:59:59";
	
	STAssertEqualObjects(result, expected, nil);
}

- (void)testEndOfQuarter1
{
	NSDate *date = [self createDate:2011 month:2 day:14 hour:13 minute:12 second:0];
	NSString *result = [self formattedDate:[date endOfQuarter]];
	NSString *expected = @"2011 03 31 - 23:59:59";
	
	STAssertEqualObjects(result, expected, nil);
}

- (void)testEndOfQuarter2
{
	NSDate *date = [self createDate:2011 month:5 day:14 hour:13 minute:12 second:0];
	NSString *result = [self formattedDate:[date endOfQuarter]];
	NSString *expected = @"2011 06 30 - 23:59:59";
	
	STAssertEqualObjects(result, expected, nil);
}

- (void)testEndOfQuarter3
{
	NSDate *date = [self createDate:2011 month:9 day:14 hour:13 minute:12 second:0];
	NSString *result = [self formattedDate:[date endOfQuarter]];
	NSString *expected = @"2011 09 30 - 23:59:59";
	
	STAssertEqualObjects(result, expected, nil);
}

- (void)testEndOfQuarter4
{
	NSDate *date = [self createDate:2011 month:12 day:14 hour:13 minute:12 second:0];
	NSString *result = [self formattedDate:[date endOfQuarter]];
	NSString *expected = @"2011 12 31 - 23:59:59";
	
	STAssertEqualObjects(result, expected, nil);
}

- (void)testEndOfWeek
{
	NSString *result = [self formattedDate:[[self defaultDate] endOfWeek]];
	NSString *expected = @"2011 06 25 - 23:59:59";
	
	STAssertEqualObjects(result, expected, nil);
}

- (void)testEndOfYear
{
	NSString *result = [self formattedDate:[[self defaultDate] endOfYear]];
	NSString *expected = @"2011 12 31 - 23:59:59";
	
	STAssertEqualObjects(result, expected, nil);
}

#pragma mark Tests Days in month

- (void)testAdvance
{
	NSString *result = [self formattedDate:[[self defaultDate] 
											advance:0 months:0 weeks:2 days:1 hours:3 minutes:10 seconds:45]];
	NSString *expected = @"2011 07 08 - 13:25:45";
	
	STAssertEqualObjects(result, expected, nil);
}

- (void)testAgo
{
	NSString *result = [self formattedDate:[[self defaultDate] 
											ago:1 months:1 weeks:0 days:1 hours:2 minutes:10 seconds:0]];
	NSString *expected = @"2010 05 22 - 08:05:00";
	
	STAssertEqualObjects(result, expected, nil);
}

- (void)testChange
{
	NSDictionary *changes = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
																 [NSNumber numberWithInt:2009], 
																 [NSNumber numberWithInt:4], 
																 nil] 
														forKeys:[NSArray arrayWithObjects:@"year", @"month", nil]];
	
	NSString *result = [self formattedDate:[[self defaultDate] change:changes]];
	NSString *expected = @"2009 04 23 - 10:15:00";
	
	STAssertEqualObjects(result, expected, nil);
}

- (void)testDaysInMonth
{
	NSDate *date = [self createDate:2011 month:8 day:14 hour:13 minute:12 second:0];
	int result = [date daysInMonth];
	int expected = 31;
	
	STAssertEquals(result, expected, nil);
}

- (void)testMonthsSince
{
	NSString *result = [self formattedDate:[[self defaultDate] monthsSince:4]];
	NSString *expected = @"2011 10 23 - 10:15:00";
	
	STAssertEqualObjects(result, expected, nil);
}

- (void)testNextMonth
{
	NSDate *date = [self createDate:2011 month:8 day:31 hour:13 minute:12 second:0];
	NSString *result = [self formattedDate:[date nextMonth]];
	NSString *expected = @"2011 09 30 - 13:12:00";
	
	STAssertEqualObjects(result, expected, nil);
}

- (void)testNextWeek
{
	NSString *result = [self formattedDate:[[self defaultDate ] nextWeek]];
	NSString *expected = @"2011 06 30 - 10:15:00";
	
	STAssertEqualObjects(result, expected, nil);
}

- (void)testNextYear
{
	NSString *result = [self formattedDate:[[self defaultDate ] nextYear]];
	NSString *expected = @"2012 06 23 - 10:15:00";
	
	STAssertEqualObjects(result, expected, nil);
}

- (void)testPrevMonth
{
	NSString *result = [self formattedDate:[[self defaultDate ] prevMonth]];
	NSString *expected = @"2011 05 23 - 10:15:00";
	
	STAssertEqualObjects(result, expected, nil);
}

- (void)testPrevYear
{
	NSString *result = [self formattedDate:[[self defaultDate ] prevYear]];
	NSString *expected = @"2010 06 23 - 10:15:00";
	
	STAssertEqualObjects(result, expected, nil);
}

- (void)testTomorrow
{
	NSString *result = [self formattedDate:[[self defaultDate ] tomorrow]];
	NSString *expected = @"2011 06 24 - 10:15:00";
	
	STAssertEqualObjects(result, expected, nil);
}

- (void)testFuture1
{
	NSDate *date = [self createDate:2001 month:8 day:31 hour:13 minute:12 second:0];
	BOOL result = [date future];
	BOOL expected = FALSE;
	
	STAssertEquals(result, expected, nil);
}

- (void)testFuture2
{
	NSDate *date = [self createDate:2111 month:8 day:31 hour:13 minute:12 second:0];
	BOOL result = [date future];
	BOOL expected = TRUE;
	
	STAssertEquals(result, expected, nil);
}

- (void)testPast1
{
	NSDate *date = [self createDate:2001 month:8 day:31 hour:13 minute:12 second:0];
	BOOL result = [date past];
	BOOL expected = TRUE;
	
	STAssertEquals(result, expected, nil);
}

- (void)testPast2
{
	NSDate *date = [self createDate:2111 month:8 day:31 hour:13 minute:12 second:0];
	BOOL result = [date past];
	BOOL expected = FALSE;
	
	STAssertEquals(result, expected, nil);
}

- (void)testToday1
{
	BOOL result = [[NSDate date] today];
	BOOL expected = TRUE;
	
	STAssertEquals(result, expected, nil);
}

- (void)testToday2
{
	BOOL result = [[[NSDate date] nextWeek] today];
	BOOL expected = FALSE;
	
	STAssertEquals(result, expected, nil);
}



@end
