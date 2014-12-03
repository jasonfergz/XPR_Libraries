//
//  XPRIdenticonGrid.h
//
//  Created by Jason Ferguson
//  Copyright (c) 2014 Jason Ferguson. All rights reserved.
//  https://github.com/xpro66

#import "XPRDrawingBase.h"

typedef NS_ENUM(NSInteger, XPRIdenticonType) {
	XPRIdenticonTypeGridOneColor,
	XPRIdenticonTypeGridMultiColor,
	XPRIdenticonTypeGridMultiColorRows,
	XPRIdenticonTypeGridMultiColorColumns,
	XPRIdenticonTypeMirroredGridOneColor,
	XPRIdenticonTypeMirroredGridMultiColor,
	XPRIdenticonTypeMirroredGridMultiColorRows,
	XPRIdenticonTypeMirroredGridMultiColorColumns
};

@interface XPRIdenticonGrid : XPRDrawingBase

+ (UIImage*) imageWithSize:(CGSize)size type:(XPRIdenticonType)type backgroundColor:(UIColor*)bgColor shape:(XPRShape)shape;

@end
