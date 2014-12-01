//
//  UIColor+XPR_Additions.h
//  IdenticonTest
//
//  Created by Jason Ferguson on 11/27/14.
//  Copyright (c) 2014 Jason Ferguson. All rights reserved.
//

#import <UIKit/UIKit.h>

static const float kColorPalleteOffsetAjacent			= (256/(7*6.3));
static const float kColorPalleteOffsetAnalogous			= (256/(12.0));
static const float kColorPalleteOffsetSquare			= (256/(4.0));
static const float kColorPalleteOffsetTriad				= (256/(3.0));
static const float kColorPalleteOffsetComplimentary		= (256/(2.0));

@interface UIColor (XPR_Additions)

+ (UIColor*)xprRandomColor;
+ (UIColor*)xprColorForHue:(CGFloat)hue;
+ (NSArray*)xprArrayOfRelatedColorsForCount:(int)count;

@end
