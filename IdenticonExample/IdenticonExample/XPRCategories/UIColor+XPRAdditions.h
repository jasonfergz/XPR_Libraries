//
//  UIColor+XPRAdditions.h
//  IdenticonTest
//
//  Created by Jason Ferguson on 11/27/14.
//  Copyright (c) 2014 Jason Ferguson. All rights reserved.
//

#import <UIKit/UIKit.h>

static const float kNumColors							= 255.0;
static const float kColorPalleteOffsetAjacent			= (kNumColors/(7*6.0));
static const float kColorPalleteOffsetAnalogous			= (kNumColors/(12.0));
static const float kColorPalleteOffsetSquare			= (kNumColors/(4.0));
static const float kColorPalleteOffsetTriad				= (kNumColors/(3.0));
static const float kColorPalleteOffsetComplimentary		= (kNumColors/(2.0));

@interface UIColor (XPRAdditions)

+ (UIColor*)xprRandomColor;
+ (UIColor*)xprColorForHue:(CGFloat)hue;
+ (NSArray*)xprArrayOfRelatedColorsForCount:(int)count;

@end
