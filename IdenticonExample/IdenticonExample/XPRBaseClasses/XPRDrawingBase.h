//
//  XPRDrawingBase.h
//
//  Created by Jason Ferguson
//  Copyright (c) 2014 Jason Ferguson. All rights reserved.
//  https://github.com/xpro66

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>

typedef NS_ENUM(NSInteger, XPRShape) {
	XPRShapeSquare,
	XPRShapeRectangle,
	XPRShapeCircle,
	XPRShapeElipse,
	XPRShapeRoundedRect,
	XPRShapePill,
	XPRShapeTriangleIsosceles,
	XPRShapeTriangleLeftSide,
	XPRShapeTriangleRightSide,
	XPRShapeTearDrop
};

@interface XPRDrawingBase : NSObject

//Drawing Helpers
+ (UIBezierPath *) drawRectangleInRect:(CGRect)rect;
+ (UIBezierPath *) drawRoundedRectInRect:(CGRect)rect;
+ (UIBezierPath *) drawPillInRect:(CGRect)rect;
+ (UIBezierPath *) drawCircleAtCenterPoint:(CGPoint)centerPoint withRadius:(CGFloat)radius;
+ (UIBezierPath *) drawSliceOfPie:(CGPoint)centerPoint radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle;
+ (UIBezierPath *) drawElipseInRect:(CGRect)rect;
+ (UIBezierPath *) drawTriangleInRect:(CGRect)rect triangleType:(XPRShape)shape;
+ (UIBezierPath *) drawTearDropInRect:(CGRect)rect;

//Trig Helpers
+ (CGFloat) degreesFromRadians:(CGFloat)radians;
+ (CGFloat) radiansFromDegrees:(CGFloat)angleInDegrees;

@end
