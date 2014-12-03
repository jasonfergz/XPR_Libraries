//
//  UIColor+XPRAdditions.m
//  IdenticonTest
//
//  Created by Jason Ferguson on 11/27/14.
//  Copyright (c) 2014 Jason Ferguson. All rights reserved.
//

#import "UIColor+XPRAdditions.h"

@implementation UIColor (XPRAdditions)

+ (UIColor*)xprRandomColor {
	CGFloat hue = ( arc4random() % (int)kNumColors / kNumColors );
	CGFloat saturation = ( arc4random() % 128 / kNumColors ) + 0.5;
	CGFloat brightness = ( arc4random() % 128 / kNumColors ) + 0.5;

	UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
	return color;
}

+ (UIColor*)xprColorForHue:(CGFloat)hue {
	CGFloat saturation = 0.6;
	CGFloat brightness = 0.9;

	UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
	return color;
}

+ (NSArray*)xprArrayOfRelatedColorsForCount:(int)count {
	float offset = kColorPalleteOffsetAnalogous;
	switch (count) {
		case 4:
			offset = kColorPalleteOffsetSquare;
			break;
		case 3:
			offset = kColorPalleteOffsetTriad;
			break;
		case 2:
			offset = kColorPalleteOffsetComplimentary;
			break;
		case 1:
			offset = kColorPalleteOffsetAjacent;
			break;
		default:
			break;
	}

	NSMutableArray * colorArray = @[].mutableCopy;
	int startingHueValue = ( arc4random() % (int)kNumColors);
	[colorArray addObject:[self xprColorForHue:startingHueValue/kNumColors]];
	for (int i = 1; i < count; i++) {
		startingHueValue -= offset;
		if (startingHueValue < 0) {
			startingHueValue += kNumColors;
		}
		[colorArray addObject:[self xprColorForHue:startingHueValue/kNumColors]];
	}
	return colorArray.copy;
}

@end
