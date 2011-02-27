//
//  NSDateCalculationsTest.m
//  NSDateCalculations
//
//  Created by Oscar Del Ben on 2/27/11.
//  Copyright 2011 DibiStore. All rights reserved.
//

#import "NSDateCalculationsTest.h"
#import "NSDate+Calculations.h"

@implementation NSDateCalculationsTest

#pragma mark -
#pragma mark Helpers

- (NSDate *)createDate:(int)year month:(int)month day:(int)day hour:(int)hour minute:(int)minute
{
	NSDateComponents *comps = [[[NSDateComponents alloc] init] autorelease];
	[comps setYear:year];
	[comps setMonth:month];
	[comps setDay:day];
	[comps setHour:hour];
	[comps setMinute:minute];
	
	return [[NSCalendar currentCalendar] dateFromComponents:comps];
}

// 2011 06 23 - 10:15
- (NSDate *)defaultDate
{
	return [self createDate:2011 month:6 day:23 hour:10 minute:15];
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
	
	STAssertEqualObjects(result, expected, @"");
}


- (void)testBeginningOfMonth;
{	
	NSString *result = [self formattedDate:[[self defaultDate] beginningOfMonth]];
	NSString *expected = @"2011 06 01 - 00:00:00";
	
	STAssertEqualObjects(result, expected, @"");
}

- (void)testBeginningOfQuarter1
{
	NSDate *date = [self createDate:2011 month:2 day:14 hour:13 minute:12];
	NSString *result = [self formattedDate:[date beginningOfQuarter]];
	NSString *expected = @"2011 01 01 - 00:00:00";
	
	STAssertEqualObjects(result, expected, @"");
}

- (void)testBeginningOfQuarter2
{
	NSDate *date = [self createDate:2011 month:5 day:14 hour:13 minute:12];
	NSString *result = [self formattedDate:[date beginningOfQuarter]];
	NSString *expected = @"2011 04 01 - 00:00:00";
	
	STAssertEqualObjects(result, expected, @"");
}

- (void)testBeginningOfQuarter3
{
	NSDate *date = [self createDate:2011 month:9 day:14 hour:13 minute:12];
	NSString *result = [self formattedDate:[date beginningOfQuarter]];
	NSString *expected = @"2011 07 01 - 00:00:00";
	
	STAssertEqualObjects(result, expected, @"");
}

- (void)testBeginningOfQuarter4
{
	NSDate *date = [self createDate:2011 month:12 day:14 hour:13 minute:12];
	NSString *result = [self formattedDate:[date beginningOfQuarter]];
	NSString *expected = @"2011 10 01 - 00:00:00";
	
	STAssertEqualObjects(result, expected, @"");
}

- (void)testBeginningOfWeek
{
	NSString *result = [self formattedDate:[[self defaultDate] beginningOfWeek]];
	NSString *expected = @"2011 06 19 - 00:00:00";
	
	STAssertEqualObjects(result, expected, @"");
}

- (void)testBeginningOfYear
{
	NSString *result = [self formattedDate:[[self defaultDate] beginningOfYear]];
	NSString *expected = @"2011 01 01 - 00:00:00";
	
	STAssertEqualObjects(result, expected, @"");
}

#pragma mark -
#pragma mark Tests End of

- (void)testEndOfDay
{
	NSString *result = [self formattedDate:[[self defaultDate] endOfDay]];
	NSString *expected = @"2011 06 23 - 23:59:59";
	
	STAssertEqualObjects(result, expected, @"");
}

- (void)testEndOfMonth
{
	NSString *result = [self formattedDate:[[self defaultDate] endOfMonth]];
	NSString *expected = @"2011 06 30 - 23:59:59";
	
	STAssertEqualObjects(result, expected, @"");
}

- (void)testEndOfQuarter1
{
	NSDate *date = [self createDate:2011 month:2 day:14 hour:13 minute:12];
	NSString *result = [self formattedDate:[date endOfQuarter]];
	NSString *expected = @"2011 03 31 - 23:59:59";
	
	STAssertEqualObjects(result, expected, @"");
}

- (void)testEndOfQuarter2
{
	NSDate *date = [self createDate:2011 month:5 day:14 hour:13 minute:12];
	NSString *result = [self formattedDate:[date endOfQuarter]];
	NSString *expected = @"2011 06 30 - 23:59:59";
	
	STAssertEqualObjects(result, expected, @"");
}

- (void)testEndOfQuarter3
{
	NSDate *date = [self createDate:2011 month:9 day:14 hour:13 minute:12];
	NSString *result = [self formattedDate:[date endOfQuarter]];
	NSString *expected = @"2011 09 30 - 23:59:59";
	
	STAssertEqualObjects(result, expected, @"");
}

- (void)testEndOfQuarter4
{
	NSDate *date = [self createDate:2011 month:12 day:14 hour:13 minute:12];
	NSString *result = [self formattedDate:[date endOfQuarter]];
	NSString *expected = @"2011 12 31 - 23:59:59";
	
	STAssertEqualObjects(result, expected, @"");
}

- (void)testEndOfWeek
{
	NSString *result = [self formattedDate:[[self defaultDate] endOfWeek]];
	NSString *expected = @"2011 06 25 - 23:59:59";
	
	STAssertEqualObjects(result, expected, @"");
}

- (void)testEndOfYear
{
	NSString *result = [self formattedDate:[[self defaultDate] endOfYear]];
	NSString *expected = @"2011 12 31 - 23:59:59";
	
	STAssertEqualObjects(result, expected, @"");
}

#pragma mark Tests Days in month

- (void)testDaysInMonth1
{
	NSDate *date = [self createDate:2011 month:8 day:14 hour:13 minute:12];
	int result = [date daysInMonth];
	int expected = 31;
	
	STAssertEquals(result, expected, @"");
}

- (void)testDaysInMonth2
{
	NSDate *date = [self createDate:2011 month:6 day:14 hour:13 minute:12];
	int result = [date daysInMonth];
	int expected = 30;
	
	STAssertEquals(result, expected, @"");
}

@end
