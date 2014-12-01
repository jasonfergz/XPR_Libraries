//
//  XPR_DrawingBase.h
//
//  Created by Jason Ferguson
//  Copyright (c) 2014 Jason Ferguson. All rights reserved.
//  https://github.com/xpro66

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, XPR_Shape) {
	XPR_ShapeSquare,
	XPR_ShapeRectangle,
	XPR_ShapeCircle,
	XPR_ShapeElipse,
	XPR_ShapeRoundedRect,
	XPR_ShapePill,
	XPR_ShapeTriangleIsosceles,
	XPR_ShapeTriangleLeftSide,
	XPR_ShapeTriangleRightSide,
	XPR_ShapeTearDrop
};

@interface XPR_DrawingBase : NSObject

//Drawing Helpers
+ (UIBezierPath *) drawRectangleInRect:(CGRect)rect;
+ (UIBezierPath *) drawRoundedRectInRect:(CGRect)rect;
+ (UIBezierPath *) drawPillInRect:(CGRect)rect;
+ (UIBezierPath *) drawCircleAtCenterPoint:(CGPoint)centerPoint withRadius:(CGFloat)radius;
+ (UIBezierPath *) drawSliceOfPie:(CGPoint)centerPoint radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle;
+ (UIBezierPath *) drawElipseInRect:(CGRect)rect;
+ (UIBezierPath *) drawTriangleInRect:(CGRect)rect triangleType:(XPR_Shape)shape;
+ (UIBezierPath *) drawTearDropInRect:(CGRect)rect;

//Trig Helpers
+ (CGFloat) degreesFromRadians:(CGFloat)radians;
+ (CGFloat) radiansFromDegrees:(CGFloat)angleInDegrees;

@end
