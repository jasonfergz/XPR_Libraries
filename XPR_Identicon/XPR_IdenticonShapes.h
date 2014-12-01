//
//  XPR_IdenticonShapes.h
//
//  Created by Jason Ferguson
//  Copyright (c) 2014 Jason Ferguson. All rights reserved.
//  https://github.com/xpro66

#import "XPR_DrawingBase.h"

@interface XPR_IdenticonShapes : XPR_DrawingBase

+ (UIImage*) createIdenticonImageForSize:(CGSize)size backgroundColor:(UIColor*)bgColor shape:(XPR_Shape)shape;

@end
