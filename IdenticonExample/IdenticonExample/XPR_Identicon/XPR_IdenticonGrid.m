//
//  XPR_IdenticonGrid.m
//
//  Created by Jason Ferguson
//  Copyright (c) 2014 Jason Ferguson. All rights reserved.
//  https://github.com/xpro66

#import "XPR_IdenticonGrid.h"
#import "NSArray+XPR_Additions.h"
#import "UIColor+XPR_Additions.h"

static const int kNumRows			= 8;	//For mirrored versions this should be an even number
static const int kNumColumns		= 8;	//For mirrored versions this should be an even number
static const int kCutOff			= 38;   //1-100. Higher value = fewer colored blocks
static const float kCenterWeighted	= 0.25; //0-1. Larger number makes colored blocks in the corners and edges less likely

@implementation XPR_IdenticonGrid

+ (UIImage*) createIdenticonImageForSize:(CGSize)size type:(XPR_IdenticonType)type backgroundColor:(UIColor*)bgColor shape:(XPR_Shape)shape{
	UIGraphicsBeginImageContext(size);
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetFillColorWithColor(context, bgColor.CGColor);
	CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
	float boxWidth = floorf(size.width/kNumColumns);
	float boxheight = floorf(size.width/kNumRows);
	CGFloat offsetX = (size.width - boxWidth*kNumColumns)/2;
	CGFloat offsetY = (size.height - boxheight*kNumRows)/2;
	CGSize boxSize = CGSizeMake(boxWidth, boxheight);
	CGSize offsetSize = CGSizeMake(offsetX, offsetY);
	switch (type) {
		case XPR_IdenticonTypeMirroredGridOneColor:
		case XPR_IdenticonTypeMirroredGridMultiColor:
		case XPR_IdenticonTypeMirroredGridMultiColorRows:
		case XPR_IdenticonTypeMirroredGridMultiColorColumns:
			[self drawMirroredGridCenterWeightedColors:size boxSize:boxSize offsetSize:offsetSize type:type shape:shape];
			break;
		case XPR_IdenticonTypeGridOneColor:
		case XPR_IdenticonTypeGridMultiColor:
		case XPR_IdenticonTypeGridMultiColorRows:
		case XPR_IdenticonTypeGridMultiColorColumns:
			[self drawGridCenterWeightedColors:size boxSize:boxSize offsetSize:offsetSize type:type shape:shape];
			break;
		default:
			break;
	}
	CGContextSaveGState(context);

	return UIGraphicsGetImageFromCurrentImageContext();
}

#pragma mark - Drawing Methods

+ (void)drawMirroredGridCenterWeightedColors:(CGSize)imageSize boxSize:(CGSize)boxSize offsetSize:(CGSize)offsetSize type:(XPR_IdenticonType)type shape:(XPR_Shape)shape{
	NSArray * colorArray;
	UIColor * color = [UIColor xprRandomColor];
	colorArray = [self colorArrayForIdenticonType:type];
	CGContextRef context = UIGraphicsGetCurrentContext();
	for (int i = 0; i < kNumColumns/2; i++) {
		NSArray * array = [NSArray xprRandomArrayForCount:kNumRows];
		for (int j = 0; j < array.count; j++) {
			int value = [array[j] intValue];
			if (i < 0.5*kNumColumns/2) {
				value = value * (1.0 - kCenterWeighted);
			} else {
				value = value * (1.0 + kCenterWeighted);
			}
			if (j < 0.4*kNumRows || j > 0.6*kNumRows) {
				value = value * (1.0 - kCenterWeighted);
			} else {
				value = value * (1.0 + kCenterWeighted);
			}
			if (value > kCutOff) {
				switch (type) {
					case XPR_IdenticonTypeMirroredGridMultiColor:
						color = colorArray[arc4random_uniform((int)colorArray.count)];
						break;
					case XPR_IdenticonTypeMirroredGridMultiColorRows:
						color = colorArray[j];
						break;
					case XPR_IdenticonTypeMirroredGridMultiColorColumns:
						color = colorArray[i];
						break;
					default:
						break;
				}
				CGFloat farXPos = imageSize.width - i * boxSize.width - boxSize.width - offsetSize.width;
				CGFloat nearXPos = i * boxSize.width + offsetSize.width;
				CGFloat yPos = j * boxSize.height + offsetSize.height;

				UIBezierPath *path;
				CGContextSetFillColorWithColor(context, color.CGColor);
				if (shape == XPR_ShapeCircle) {
					path = [self drawCircleAtCenterPoint:CGPointMake(nearXPos + boxSize.width/2, yPos + boxSize.height/2) withRadius:boxSize.height/2];
					[path fill];
					path = [self drawCircleAtCenterPoint:CGPointMake(farXPos + boxSize.width/2, yPos + boxSize.height/2) withRadius:boxSize.height/2];
					[path fill];
				} else {
					path = [self drawRectangleInRect:CGRectMake(nearXPos, yPos, boxSize.width, boxSize.height)];
					[path fill];
					path = [self drawRectangleInRect:CGRectMake(farXPos, yPos, boxSize.width, boxSize.height)];
					[path fill];
				}
			}
		}
	}
}

+ (void)drawGridCenterWeightedColors:(CGSize)imageSize boxSize:(CGSize)boxSize offsetSize:(CGSize)offsetSize type:(XPR_IdenticonType)type shape:(XPR_Shape)shape{
	NSArray * colorArray;
	UIColor * color = [UIColor xprRandomColor];
	colorArray = [self colorArrayForIdenticonType:type];
	CGContextRef context = UIGraphicsGetCurrentContext();
	for (int i = 0; i < kNumColumns; i++) {
		NSArray * array = [NSArray xprRandomArrayForCount:kNumRows];
		for (int j = 0; j < array.count; j++) {
			int value = [array[j] intValue];
			if (i < 0.4*kNumColumns || i > 0.6*kNumColumns) {
				value = value * (1.0 - kCenterWeighted);
			} else {
				value = value * (1.0 + kCenterWeighted);
			}
			if (j < 0.4*kNumRows || j > 0.6*kNumRows) {
				value = value * (1.0 - kCenterWeighted);
			} else {
				value = value * (1.0 + kCenterWeighted);
			}
			if (value > kCutOff) {
				switch (type) {
					case XPR_IdenticonTypeGridMultiColor:
						color = colorArray[arc4random_uniform((int)colorArray.count)];
						break;
					case XPR_IdenticonTypeGridMultiColorRows:
						color = colorArray[j];
						break;
					case XPR_IdenticonTypeGridMultiColorColumns:
						color = colorArray[i];
						break;
					default:
						break;
				}
				CGFloat xPos = i * boxSize.width + offsetSize.width;
				CGFloat yPos = j * boxSize.height + offsetSize.height;

				UIBezierPath *path;
				CGContextSetFillColorWithColor(context, color.CGColor);
				if (shape == XPR_ShapeCircle) {
					path = [self drawCircleAtCenterPoint:CGPointMake(xPos + boxSize.width/2, yPos + boxSize.height/2) withRadius:boxSize.height/2];
					[path fill];
				} else {
					path = [self drawRectangleInRect:CGRectMake(xPos, yPos, boxSize.width, boxSize.height)];
					[path fill];
				}
			}
		}
	}
}

#pragma mark - Color Methods

+ (NSArray *)colorArrayForIdenticonType:(XPR_IdenticonType)type {
	NSArray *colorArray;
	switch (type) {
		case XPR_IdenticonTypeGridMultiColor:
		case XPR_IdenticonTypeGridMultiColorColumns:
		case XPR_IdenticonTypeMirroredGridMultiColor:
		case XPR_IdenticonTypeMirroredGridMultiColorColumns:
			colorArray = [UIColor xprArrayOfRelatedColorsForCount:5];
			break;
		case XPR_IdenticonTypeGridMultiColorRows:
		case XPR_IdenticonTypeMirroredGridMultiColorRows:
			colorArray = [UIColor xprArrayOfRelatedColorsForCount:kNumRows];
			break;
		default:
			colorArray = [UIColor xprArrayOfRelatedColorsForCount:12];
			break;
	}
	return colorArray;
}

@end
