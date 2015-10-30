//
//  NSDateCalculationsTests.m
//  NSDateCalculations
//
//  Created by Oscar Del Ben on 2/27/11.
//  Copyright 2011 DibiStore. All rights reserved.
//
//  Adapted to XCTest by Ricardo Ruiz Lopez on 10/30/15
//

#import <XCTest/XCTest.h>
#import "NSDate+Calculations.h"

@interface DateCalculationsTests : XCTestCase

@end

@implementation DateCalculationsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark -
#pragma mark Helpers

// 2011 06 23 - 10:15:00
- (NSDate *)defaultDate
{
	return [NSDate dateWithYear:2011 month:6 day:23 hour:10 minute:15 second:0];
}

- (NSString *)formattedDate:(NSDate *)date
{
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];

	[formatter setDateFormat:@"yyyy MM dd - HH:mm:ss"];
	
	return [formatter stringFromDate:date];
}

#pragma mark -
#pragma mark Tests Beginning of

- (void)testBeginningOfDay;
{	
	NSString *result = [self formattedDate:[[self defaultDate] beginningOfDay]];
	NSString *expected = @"2011 06 23 - 00:00:00";
	
	XCTAssertEqualObjects(result, expected);
}


- (void)testBeginningOfMonth;
{	
	NSString *result = [self formattedDate:[[self defaultDate] beginningOfMonth]];
	NSString *expected = @"2011 06 01 - 00:00:00";
	
	XCTAssertEqualObjects(result, expected);
}

- (void)testBeginningOfQuarter1
{
	NSDate *date = [NSDate dateWithYear:2011 month:2 day:14 hour:13 minute:12 second:0];
	NSString *result = [self formattedDate:[date beginningOfQuarter]];
	NSString *expected = @"2011 01 01 - 00:00:00";
	
	XCTAssertEqualObjects(result, expected);
}

- (void)testBeginningOfQuarter2
{
	NSDate *date = [NSDate dateWithYear:2011 month:5 day:14 hour:13 minute:12 second:0];
	NSString *result = [self formattedDate:[date beginningOfQuarter]];
	NSString *expected = @"2011 04 01 - 00:00:00";
	
	XCTAssertEqualObjects(result, expected);
}

- (void)testBeginningOfQuarter3
{
	NSDate *date = [NSDate dateWithYear:2011 month:9 day:14 hour:13 minute:12 second:0];
	NSString *result = [self formattedDate:[date beginningOfQuarter]];
	NSString *expected = @"2011 07 01 - 00:00:00";
	
	XCTAssertEqualObjects(result, expected);
}

- (void)testBeginningOfQuarter4
{
	NSDate *date = [NSDate dateWithYear:2011 month:12 day:14 hour:13 minute:12 second:0];
	NSString *result = [self formattedDate:[date beginningOfQuarter]];
	NSString *expected = @"2011 10 01 - 00:00:00";
	
	XCTAssertEqualObjects(result, expected);
}

- (void)testBeginningOfWeek
{
	NSString *result = [self formattedDate:[[self defaultDate] beginningOfWeek]];
	NSString *expected = @"2011 06 19 - 00:00:00";
	
	XCTAssertEqualObjects(result, expected);
}

- (void)testBeginningOfYear
{
	NSString *result = [self formattedDate:[[self defaultDate] beginningOfYear]];
	NSString *expected = @"2011 01 01 - 00:00:00";
	
	XCTAssertEqualObjects(result, expected);
}

#pragma mark -
#pragma mark Tests End of

- (void)testEndOfDay
{
	NSString *result = [self formattedDate:[[self defaultDate] endOfDay]];
	NSString *expected = @"2011 06 23 - 23:59:59";
	
	XCTAssertEqualObjects(result, expected);
}

- (void)testEndOfMonth
{
	NSString *result = [self formattedDate:[[self defaultDate] endOfMonth]];
	NSString *expected = @"2011 06 30 - 23:59:59";
	
	XCTAssertEqualObjects(result, expected);
}

- (void)testEndOfQuarter1
{
	NSDate *date = [NSDate dateWithYear:2011 month:2 day:14 hour:13 minute:12 second:0];
	NSString *result = [self formattedDate:[date endOfQuarter]];
	NSString *expected = @"2011 03 31 - 23:59:59";
	
	XCTAssertEqualObjects(result, expected);
}

- (void)testEndOfQuarter2
{
	NSDate *date = [NSDate dateWithYear:2011 month:5 day:14 hour:13 minute:12 second:0];
	NSString *result = [self formattedDate:[date endOfQuarter]];
	NSString *expected = @"2011 06 30 - 23:59:59";
	
	XCTAssertEqualObjects(result, expected);
}

- (void)testEndOfQuarter3
{
	NSDate *date = [NSDate dateWithYear:2011 month:9 day:14 hour:13 minute:12 second:0];
	NSString *result = [self formattedDate:[date endOfQuarter]];
	NSString *expected = @"2011 09 30 - 23:59:59";
	
	XCTAssertEqualObjects(result, expected);
}

- (void)testEndOfQuarter4
{
	NSDate *date = [NSDate dateWithYear:2011 month:12 day:14 hour:13 minute:12 second:0];
	NSString *result = [self formattedDate:[date endOfQuarter]];
	NSString *expected = @"2011 12 31 - 23:59:59";
	
	XCTAssertEqualObjects(result, expected);
}

- (void)testEndOfWeek
{
	NSString *result = [self formattedDate:[[self defaultDate] endOfWeek]];
	NSString *expected = @"2011 06 25 - 23:59:59";
	
	XCTAssertEqualObjects(result, expected);
}

- (void)testEndOfYear
{
	NSString *result = [self formattedDate:[[self defaultDate] endOfYear]];
	NSString *expected = @"2011 12 31 - 23:59:59";
	
	XCTAssertEqualObjects(result, expected);
}

#pragma mark Tests Days in month

- (void)testAdvance
{
	NSString *result = [self formattedDate:[[self defaultDate] 
											advance:0 months:0 weeks:2 days:1 hours:3 minutes:10 seconds:45]];
	NSString *expected = @"2011 07 08 - 13:25:45";
	
	XCTAssertEqualObjects(result, expected);
}

- (void)testAgo
{
	NSString *result = [self formattedDate:[[self defaultDate] 
											ago:1 months:1 weeks:0 days:1 hours:2 minutes:10 seconds:0]];
	NSString *expected = @"2010 05 22 - 08:05:00";
	
	XCTAssertEqualObjects(result, expected);
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
	
	XCTAssertEqualObjects(result, expected);
}

- (void)testDaysInMonth
{
	NSDate *date = [NSDate dateWithYear:2011 month:8 day:14 hour:13 minute:12 second:0];
	NSUInteger result = [date daysInMonth];
	NSUInteger expected = 31;
	
	XCTAssertEqual(result, expected);
}

- (void)testMonthsSince
{
	NSString *result = [self formattedDate:[[self defaultDate] monthsSince:4]];
	NSString *expected = @"2011 10 23 - 10:15:00";
	
	XCTAssertEqualObjects(result, expected);
}

- (void)testYearsSince
{
	NSString *result = [self formattedDate:[[self defaultDate] yearsSince:4]];
	NSString *expected = @"2015 06 23 - 10:15:00";
	
	XCTAssertEqualObjects(result, expected);
}

- (void)testNextMonth
{
	NSDate *date = [NSDate dateWithYear:2011 month:8 day:31 hour:13 minute:12 second:0];
	NSString *result = [self formattedDate:[date nextMonth]];
	NSString *expected = @"2011 09 30 - 13:12:00";
	
	XCTAssertEqualObjects(result, expected);
}

- (void)testNextWeek
{
	NSString *result = [self formattedDate:[[self defaultDate ] nextWeek]];
	NSString *expected = @"2011 06 30 - 10:15:00";
	
	XCTAssertEqualObjects(result, expected);
}

- (void)testNextYear
{
	NSString *result = [self formattedDate:[[self defaultDate ] nextYear]];
	NSString *expected = @"2012 06 23 - 10:15:00";
	
	XCTAssertEqualObjects(result, expected);
}

- (void)testPrevMonth
{
	NSString *result = [self formattedDate:[[self defaultDate ] prevMonth]];
	NSString *expected = @"2011 05 23 - 10:15:00";
	
	XCTAssertEqualObjects(result, expected);
}

- (void)testPrevYear
{
	NSString *result = [self formattedDate:[[self defaultDate ] prevYear]];
	NSString *expected = @"2010 06 23 - 10:15:00";
	
	XCTAssertEqualObjects(result, expected);
}

- (void)testYearsAgo
{
	NSString *result = [self formattedDate:[[self defaultDate ] yearsAgo:3]];
	NSString *expected = @"2008 06 23 - 10:15:00";
	
	XCTAssertEqualObjects(result, expected);
}

- (void)testYesterday
{
	NSString *result = [self formattedDate:[[self defaultDate ] yesterday]];
	NSString *expected = @"2011 06 22 - 10:15:00";
	
	XCTAssertEqualObjects(result, expected);
}

- (void)testTomorrow
{
	NSString *result = [self formattedDate:[[self defaultDate ] tomorrow]];
	NSString *expected = @"2011 06 24 - 10:15:00";
	
	XCTAssertEqualObjects(result, expected);
}

- (void)testFuture1
{
    NSDate *date = [NSDate dateWithYear:2001 month:8 day:31 hour:13 minute:12 second:0];
    XCTAssertFalse([date future]);
}

- (void)testFuture2
{
	NSDate *date = [NSDate dateWithYear:2111 month:8 day:31 hour:13 minute:12 second:0];
	XCTAssertTrue([date future]);
}

- (void)testPast1
{
	NSDate *date = [NSDate dateWithYear:2001 month:8 day:31 hour:13 minute:12 second:0];
    XCTAssertTrue([date past]);
}

- (void)testPast2
{
	NSDate *date = [NSDate dateWithYear:2111 month:8 day:31 hour:13 minute:12 second:0];
    XCTAssertFalse([date past]);
}

- (void)testToday1
{
    XCTAssertTrue([[NSDate date] today]);
}

- (void)testToday2
{
    XCTAssertFalse([[[NSDate date] nextWeek] today]);
}

@end
