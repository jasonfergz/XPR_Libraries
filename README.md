XPR_Libraries
=============

This library provides an interpretation of the GitHub Identicon for use on iOS.

Using the Library:

1. Add the XPR_BaseClasses, XPR_Categories and XPR_Identicon classes to your project.
2. Import the XPR_Identicon class header for the style you intend to use.
3. The class method createIdenticonImageForSize: returns an UIImage* with the dimensions of the size that was passed in.

```objective-c
#import "XPR_IdenticonGrid.h"
#import "XPR_IdenticonShapes.h"

...
/** 
XPR_IdenticonGrid valid types:
	XPR_IdenticonTypeGridOneColor,
	XPR_IdenticonTypeGridMultiColor,
	XPR_IdenticonTypeGridMultiColorRows,
	XPR_IdenticonTypeGridMultiColorColumns,
	XPR_IdenticonTypeMirroredGridOneColor,
	XPR_IdenticonTypeMirroredGridMultiColor,
	XPR_IdenticonTypeMirroredGridMultiColorRows,
	XPR_IdenticonTypeMirroredGridMultiColorColumns

XPR_IdenticonGrid valid shapes:
	XPR_ShapeRectangle,
	XPR_ShapeCircle
**/

	self.identiconImageView.image = [XPR_IdenticonGrid createIdenticonImageForSize:CGSizeMake(self.identiconImageView.frame.size.width, self.identiconImageView.frame.size.height)
																type:XPR_IdenticonTypeMirroredGridOneColor
													 backgroundColor:[UIColor whiteColor]
															   shape:XPR_ShapeSquare];

/** 
XPR_IdenticonGrid valid shapes:
	XPR_ShapeRectangle,
	XPR_ShapeCircle
**/

	self.identiconImageView.image = [XPR_IdenticonShapes createIdenticonImageForSize:CGSizeMake(self.identiconImageView.frame.size.width, self.identiconImageView.frame.size.height)
																		backgroundColor:[UIColor whiteColor]
																				  shape:XPR_ShapeRectangle];

```
