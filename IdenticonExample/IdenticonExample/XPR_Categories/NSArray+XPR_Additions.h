//
//  NSArray+XPR_Additions.h
//
//  Created by Jason Ferguson
//  Copyright (c) 2014 Jason Ferguson. All rights reserved.
//  https://github.com/xpro66

#import <Foundation/Foundation.h>

@interface NSArray (XPR_Additions)

+ (NSArray*) xprRandomArrayForCount:(int)count;
- (NSArray*) xprSortArrayOfNSNumbers;
- (NSArray*) xprSortArrayOfNSNumbersDesc;
+ (NSArray*) xprArrayOfSortedValuesDescCount:(int)count maxValue:(int)max;
+ (NSArray*) xprArrayOfSortedValuesDescScaledCount:(int)count maxValue:(int)max;

//Statistical Information methods
- (NSNumber*) xprInstancesInRangeFromLow:(NSNumber*)low high:(NSNumber*)high inclusive:(BOOL)inclusive;
- (NSNumber*) xprInstancesAbove:(NSNumber*)number inclusive:(BOOL)inclusive;
- (NSNumber*) xprInstancesBelow:(NSNumber*)number inclusive:(BOOL)inclusive;
- (NSNumber*) xprMedian;
- (NSNumber*) xprMean;
- (NSNumber*) xprTrimmedMean:(int)trimByCount;
- (NSNumber*) xprStandardDeviation;
- (NSNumber*) xprHighestValue;
- (NSNumber*) xprLowestValue;

@end
