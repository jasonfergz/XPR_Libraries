//
//  XPRDrawingBase.m
//
//  Created by Jason Ferguson
//  Copyright (c) 2014 Jason Ferguson. All rights reserved.
//  https://github.com/xpro66

#import "XPRDrawingBase.h"

@implementation XPRDrawingBase

#pragma mark - Drawing Helpers

+ (UIBezierPath *) drawRectangleInRect:(CGRect)rect {
	UIBezierPath *rectangle = [UIBezierPath bezierPathWithRect:rect];
	return rectangle;
}

+ (UIBezierPath *) drawRoundedRectInRect:(CGRect)rect {
	UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height) cornerRadius: rect.size.width/4];
	return roundedRect;
}

+ (UIBezierPath *) drawPillInRect:(CGRect)rect {
	CGFloat radius = rect.size.width/2;
	if (rect.size.width > rect.size.height) {
		radius = rect.size.height/2;
	}
	UIBezierPath *pill = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height) cornerRadius: radius];
	return pill;
}

+ (UIBezierPath *) drawCircleAtCenterPoint:(CGPoint)centerPoint withRadius:(CGFloat)radius {
	return [self drawSliceOfPie:centerPoint radius:radius startAngle:0 endAngle:2*M_PI];
}

+ (UIBezierPath *) drawSliceOfPie:(CGPoint)centerPoint radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle {
	UIBezierPath *arc = [UIBezierPath bezierPath];
	[arc moveToPoint:centerPoint];
	CGPoint next;
	next.x = centerPoint.x + radius * cos(startAngle);
	next.y = centerPoint.y + radius * sin(startAngle);
	[arc addLineToPoint:next];

	[arc addArcWithCenter:centerPoint radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
	[arc addLineToPoint:centerPoint];

	return arc;
}

+ (UIBezierPath *) drawElipseInRect:(CGRect)rect {
	UIBezierPath *elipse = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)];
	return elipse;
}

+ (UIBezierPath *) drawTriangleInRect:(CGRect)rect triangleType:(XPRShape)shape {
	CGPoint point1 = CGPointMake(rect.origin.x, rect.origin.y + rect.size.height);
	CGPoint point2 = CGPointMake(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height);
	CGPoint point3 = CGPointMake(rect.origin.x + rect.size.width/2, rect.origin.y);

	switch (shape) {
		case XPRShapeTriangleLeftSide:
			point3 = CGPointMake(rect.origin.x, rect.origin.y);
			break;
		case XPRShapeTriangleRightSide:
			point3 = CGPointMake(rect.origin.x + rect.size.width, rect.origin.y);
			break;
		default:
			break;
	}

	UIBezierPath * path = [UIBezierPath bezierPath];

	[path moveToPoint:point1];
	[path addLineToPoint:point2];
	[path addLineToPoint:point3];

	return path;
}

+ (UIBezierPath *) drawTearDropInRect:(CGRect)rect {
	UIBezierPath * path = [UIBezierPath bezierPath];

	CGFloat radius = rect.size.width/2;
	CGPoint centerPoint = CGPointMake(rect.origin.x + rect.size.width/2, rect.origin.y + rect.size.height - rect.size.width);
	CGPoint point1 = CGPointMake(rect.origin.x, rect.origin.y + rect.size.height - rect.size.width);
	CGPoint point2 = CGPointMake(rect.origin.x + rect.size.width/2, rect.origin.y);
	CGPoint point3 = CGPointMake(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height - rect.size.width);

	[path moveToPoint:point1];
	[path addLineToPoint:point2];
	[path addLineToPoint:point3];
	[path addArcWithCenter:centerPoint radius:radius startAngle:0 endAngle:M_PI clockwise:YES];

	return path;
}

#pragma mark - Trig Helpers

+ (CGFloat) degreesFromRadians:(CGFloat)radians {
	return radians * 180.0 / M_PI;
}

+ (CGFloat) radiansFromDegrees:(CGFloat)angleInDegrees {
	return angleInDegrees / 180.0 * M_PI;
}

@end
