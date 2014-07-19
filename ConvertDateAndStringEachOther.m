//
//  ConvertDateAndStringEachOther.m
//  Moovers
//
//  Created by Arthur Wang on 14-4-17.
//  Copyright (c) 2014年 Moovers. All rights reserved.
//

#import "ConvertDateAndStringEachOther.h"

@implementation ConvertDateAndStringEachOther

+ (NSDate *)dateFromString:(NSString *)dateString
{
    if ( nil == dateString )
    {
        return nil;
    }
    
    // Sample: 2014-04-23T12:00:00Z -> yyyy-MM-dd'T'HH:mm:ss'Z'
    // Sample: 2014-04-23T10:47:11.6514Z -> yyyy-MM-dd'T'HH:mm:ss.SSS'Z'
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat: @"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    
    return destDate;
}


+ (NSString *)stringFromDate:(NSDate *)date
{
    if ( nil == date )
    {
        return nil;
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    
    NSString *destDateString = [dateFormatter stringFromDate:date];
    
    return destDateString;
}

//convert the local date to UTC date
+ (NSDate *)getUTCDateFromLocalDate:(NSDate *)date
{
    //time zone
    NSTimeZone *sourceTimeZone      = [NSTimeZone localTimeZone];
    
    //interval
    NSTimeInterval interval         = [sourceTimeZone secondsFromGMT];
    
    
    NSDate *destinationDateNow = [date dateByAddingTimeInterval:-interval];
    
    
    return destinationDateNow;
}


//convert the local date from UTC date
+ (NSDate *)getLocalDateFromUTCDate:(NSDate *)date
{
    //time zone
    NSTimeZone *sourceTimeZone      = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    NSTimeZone *destinationTimeZone = [NSTimeZone localTimeZone];
    
    //offset
    NSInteger sourceGMTOffset       = [sourceTimeZone secondsFromGMTForDate:date];
    NSInteger destinationGMTOffset  = [destinationTimeZone secondsFromGMTForDate:date];
    
    //interval
    NSTimeInterval interval         = destinationGMTOffset - sourceGMTOffset;
    
    
    NSDate *destinationDateNow = [[NSDate alloc] initWithTimeInterval:interval sinceDate:date];
    
    
    return destinationDateNow;
}


@end
