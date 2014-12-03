//
//  XPRIdenticonShapes.h
//
//  Created by Jason Ferguson
//  Copyright (c) 2014 Jason Ferguson. All rights reserved.
//  https://github.com/xpro66

#import "XPRDrawingBase.h"

@interface XPRIdenticonShapes : XPRDrawingBase

+ (UIImage*) imageWithSize:(CGSize)size backgroundColor:(UIColor*)bgColor shape:(XPRShape)shape shapeCount:(int)shapeCount;

@end
