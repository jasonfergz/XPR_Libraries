//
//  NSArray+XPR_Additions.m
//
//  Created by Jason Ferguson
//  Copyright (c) 2014 Jason Ferguson. All rights reserved.
//  https://github.com/xpro66

#import "NSArray+XPR_Additions.h"

@implementation NSArray (XPR_Additions)

+ (NSArray*) xprRandomArrayForCount:(int)count {
	NSMutableArray * array = @[].mutableCopy;
	for (int i = 0; i < count; i++) {
		int num = arc4random_uniform(100) + 1;
		[array addObject:@(num)];
	}
	return array.copy;
}

- (NSArray*) xprSortArrayOfNSNumbers {
	NSArray *sortedArray = [self sortedArrayUsingComparator: ^(id obj1, id obj2) {

		if ([obj1 floatValue] > [obj2 floatValue]) {
			return (NSComparisonResult)NSOrderedDescending;
		}

		if ([obj1 floatValue] < [obj2 floatValue]) {
			return (NSComparisonResult)NSOrderedAscending;
		}
		return (NSComparisonResult)NSOrderedSame;
	}];
	return sortedArray;
}

- (NSArray*) xprSortArrayOfNSNumbersDesc {
	NSArray *sortedArray = [self sortedArrayUsingComparator: ^(id obj1, id obj2) {

		if ([obj1 floatValue] < [obj2 floatValue]) {
			return (NSComparisonResult)NSOrderedDescending;
		}

		if ([obj1 floatValue] > [obj2 floatValue]) {
			return (NSComparisonResult)NSOrderedAscending;
		}
		return (NSComparisonResult)NSOrderedSame;
	}];
	return sortedArray;
}

+ (NSArray*) xprArrayOfSortedValuesDescCount:(int)count maxValue:(int)max {
	NSMutableArray * tempArray = @[].mutableCopy;
	for (int i = 0; i < count; i++) {
		[tempArray addObject:@(arc4random_uniform(max) + 1)];
	}
	return [tempArray xprSortArrayOfNSNumbersDesc];
}

+ (NSArray*) xprArrayOfSortedValuesDescScaledCount:(int)count maxValue:(int)max {
	NSMutableArray * tempArray = @[].mutableCopy;
	int start = arc4random_uniform(max*0.33333) + max*0.66666;
	[tempArray addObject:@(start)];
	for (int i = 1; i < count; i++) {
		start = start*0.66;
		[tempArray addObject:@(start)];
	}
	return [tempArray xprSortArrayOfNSNumbersDesc];
}

#pragma mark - Statistical Information methods
- (NSNumber*) xprInstancesInRangeFromLow:(NSNumber*)low high:(NSNumber*)high inclusive:(BOOL)inclusive {
	if(![self count]) return nil;

	int count = 0;
	float max = [high floatValue];
	float min = [low floatValue];
	if (inclusive) {
		for (NSNumber * num in self) {
			if ([num floatValue] >= min && [num floatValue] <= max) {
				count++;
			}
		}
	} else {
		for (NSNumber * num in self) {
			if ([num floatValue] > min && [num floatValue] < max) {
				count++;
			}
		}
	}
	return @(count);
}

- (NSNumber*) xprInstancesAbove:(NSNumber*)number inclusive:(BOOL)inclusive {
	if(![self count]) return nil;

	int count = 0;
	if (inclusive) {
		for (NSNumber * num in self) {
			if ([num floatValue] >= [number floatValue]) {
				count++;
			}
		}
	} else {
		for (NSNumber * num in self) {
			if ([num floatValue] > [number floatValue]) {
				count++;
			}
		}
	}
	return @(count);

}

- (NSNumber*) xprInstancesBelow:(NSNumber*)number inclusive:(BOOL)inclusive {
	if(![self count]) return nil;

	int count = 0;
	if (inclusive) {
		for (NSNumber * num in self) {
			if ([num floatValue] <= [number floatValue]) {
				count++;
			}
		}
	} else {
		for (NSNumber * num in self) {
			if ([num floatValue] < [number floatValue]) {
				count++;
			}
		}
	}
	return @(count);

}


- (NSNumber*) xprMedian {
	if(![self count]) return nil;

	NSArray * sortedArray = [self xprSortArrayOfNSNumbers];
	float median = 0.0;
	int count = (int)sortedArray.count;
	if (count % 2) {
		median = ([sortedArray[count/2] doubleValue] + [sortedArray[count/2 - 1] doubleValue])/2;
	} else {
		median = [sortedArray[count/2 + 1] doubleValue];
	}
	return @(median);
}

- (NSNumber*) xprMean {
	if(![self count]) return nil;

	float total = 0.0;
	int count = (int)self.count;
	for (NSNumber * num in self) {
		total += [num doubleValue];
	}
	return @(total/(count*1.0));
}

- (NSNumber*) xprTrimmedMean:(int)trimByCount {

	if(![self count]) return nil;
	if([self count] <= (trimByCount*2)) return nil;

	NSMutableArray * tempArray = self.mutableCopy;
	for (int i = 0; i < trimByCount; i++) {
		[tempArray removeLastObject];
		[tempArray removeObjectAtIndex:0];
	}
	return [tempArray xprMean];
}

- (NSNumber*) xprStandardDeviation {
	if(![self count]) return nil;

	double mean = [[self xprMean] doubleValue];
	double sumOfSquaredDifferences = 0.0;

	for(NSNumber *number in self)
	{
		double valueOfNumber = [number doubleValue];
		double difference = valueOfNumber - mean;
		sumOfSquaredDifferences += difference * difference;
	}

	return @(sqrt(sumOfSquaredDifferences / [self count]));
}

- (NSNumber*) xprHighestValue {
	NSArray * sortedArray = [self xprSortArrayOfNSNumbers];
	return [sortedArray lastObject];
}

- (NSNumber*) xprLowestValue {
	NSArray * sortedArray = [self xprSortArrayOfNSNumbers];
	return [sortedArray firstObject];
}

@end
