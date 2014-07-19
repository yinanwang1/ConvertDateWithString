//
//  ConvertDateAndStringEachOther.h
//  Moovers
//
//  Created by Arthur Wang on 14-4-17.
//  Copyright (c) 2014年 Moovers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConvertDateAndStringEachOther : NSObject

+ (NSDate *)dateFromString:(NSString *)dateString;
+ (NSString *)stringFromDate:(NSDate *)date;

+ (NSDate *)getUTCDateFromLocalDate:(NSDate *)date;
+ (NSDate *)getLocalDateFromUTCDate:(NSDate *)date;

@end
