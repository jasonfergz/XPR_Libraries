//
//  XPRIdenticonShapes.m
//
//  Created by Jason Ferguson
//  Copyright (c) 2014 Jason Ferguson. All rights reserved.
//  https://github.com/xpro66

#import "XPRIdenticonShapes.h"
#import "NSArray+XPRAdditions.h"
#import "UIColor+XPRAdditions.h"

@implementation XPRIdenticonShapes

+ (UIImage*) imageWithSize:(CGSize)size backgroundColor:(UIColor*)bgColor shape:(XPRShape)shape shapeCount:(int)shapeCount {
	UIGraphicsBeginImageContext(size);
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetFillColorWithColor(context, bgColor.CGColor);
	CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
	switch (shape) {
		case XPRShapeRectangle:
			[self drawColoredSquaresInFrame:size shapeCount:shapeCount];
			break;
		case XPRShapeCircle:
			[self drawColoredCirclesInFrame:size shapeCount:shapeCount];
			break;
		default:
			break;
	}
	return UIGraphicsGetImageFromCurrentImageContext();
}

#pragma mark - Drawing Code

+ (void)drawColoredSquaresInFrame:(CGSize)size shapeCount:(int)shapeCount {
	NSArray * array = [NSArray xprArrayOfSortedValuesDescScaledCount:shapeCount maxValue:[self getshortSide:size]];
	NSArray * colorArray = [UIColor xprArrayOfRelatedColorsForCount:shapeCount];
	for (int i = 0; i < shapeCount; i ++) {

		[self drawSquareFullyInFrame:size withSideLength:[array[i] intValue] color:colorArray[i]];
	}
}

+ (void)drawColoredCirclesInFrame:(CGSize)size shapeCount:(int)shapeCount {
	NSArray * array = [NSArray xprArrayOfSortedValuesDescScaledCount:shapeCount maxValue:[self getshortSide:size]];
	NSArray * colorArray = [UIColor xprArrayOfRelatedColorsForCount:shapeCount];
	for (int i = 0; i < shapeCount; i ++) {

		[self drawCircleFullyInFrame:size radius:[array[i] intValue] color:colorArray[i]];
	}
}

+ (void)drawSquareFullyInFrame:(CGSize)size withSideLength:(float)sideLength color:(UIColor*)color{
	float xPos = [self xPosForSquareWithinFrame:size length:sideLength];
	float yPos = [self yPosForSquareWithinFrame:size length:sideLength];
	CGRect barRect1 = CGRectMake(xPos, yPos, sideLength, sideLength);
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextSetFillColorWithColor(ctx, color.CGColor);
	UIRectFill(barRect1);
}

+ (void)drawCircleFullyInFrame:(CGSize)size radius:(float)radius color:(UIColor*)color {
	float xPos = [self xPosForCircleWithinFrame:size];
	float yPos = [self yPosForCircleWithinFrame:size];
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextSetFillColorWithColor(ctx, color.CGColor);
	[[self drawCircleAtCenterPoint:CGPointMake(xPos, yPos) withRadius:radius] fill];
}

#pragma mark - Helper Methods

+ (float)xPosForSquareWithinFrame:(CGSize)size length:(float)length {
	int maxX = size.width - length;
	return (arc4random_uniform(maxX) + 1) * 1.0;
}

+ (float)yPosForSquareWithinFrame:(CGSize)size length:(float)length {
	int maxY = size.height - length;
	return (arc4random_uniform(maxY) + 1) * 1.0;
}

+ (float)xPosForCircleWithinFrame:(CGSize)size {
	return (arc4random_uniform(size.width) + 1) * 1.0;
}

+ (float)yPosForCircleWithinFrame:(CGSize)size {
	return (arc4random_uniform(size.height) + 1) * 1.0;
}

+ (int)getValidRandomNumberForSquareWithFrame:(CGSize)size {
	return arc4random_uniform([self getshortSide:size]) + 1;
}

+ (int)getValidRandomNumberForCircleWithFrame:(CGSize)size {
	return arc4random_uniform([self getshortSide:size]/2) + 1;
}

+ (int)getshortSide:(CGSize)size {
	if (size.width > size.height) {
		return size.height;
	}
	return size.width;
}

@end
