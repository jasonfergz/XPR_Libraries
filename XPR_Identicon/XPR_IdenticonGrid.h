//
//  XPR_IdenticonGrid.h
//
//  Created by Jason Ferguson
//  Copyright (c) 2014 Jason Ferguson. All rights reserved.
//  https://github.com/xpro66

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import "XPR_DrawingBase.h"

typedef NS_ENUM(NSInteger, XPR_IdenticonType) {
	XPR_IdenticonTypeGridOneColor,
	XPR_IdenticonTypeGridMultiColor,
	XPR_IdenticonTypeGridMultiColorRows,
	XPR_IdenticonTypeGridMultiColorColumns,
	XPR_IdenticonTypeMirroredGridOneColor,
	XPR_IdenticonTypeMirroredGridMultiColor,
	XPR_IdenticonTypeMirroredGridMultiColorRows,
	XPR_IdenticonTypeMirroredGridMultiColorColumns
};

@interface XPR_IdenticonGrid : XPR_DrawingBase

+ (UIImage*) createIdenticonImageForSize:(CGSize)size type:(XPR_IdenticonType)type backgroundColor:(UIColor*)bgColor shape:(XPR_Shape)shape;

@end
