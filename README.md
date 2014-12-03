XPR_Libraries
=============

This library provides an interpretation of the GitHub Identicon for use on iOS. The result is random and is not based on a seed.

Using the Library:

1. Add the XPRBaseClasses, XPRCategories and XPRIdenticon classes to your project.
2. Import the XPRIdenticon class header for the style you intend to use.
3. The class method createIdenticonImageForSize: returns an UIImage* with the dimensions of the size that was passed in.

```objective-c
#import "XPRIdenticonGrid.h"
#import "XPRIdenticonShapes.h"

...
/** 
XPRIdenticonGrid valid types:
	XPRIdenticonTypeGridOneColor,
	XPRIdenticonTypeGridMultiColor,
	XPRIdenticonTypeGridMultiColorRows,
	XPRIdenticonTypeGridMultiColorColumns,
	XPRIdenticonTypeMirroredGridOneColor,
	XPRIdenticonTypeMirroredGridMultiColor,
	XPRIdenticonTypeMirroredGridMultiColorRows,
	XPRIdenticonTypeMirroredGridMultiColorColumns

XPRIdenticonGrid valid shapes:
	XPRShapeRectangle,
	XPRShapeCircle
**/

	self.identiconImageView.image = [XPRIdenticonGrid imageWithSize:self.identiconImageView.frame.size
															   type:XPRIdenticonTypeMirroredGridOneColor
													backgroundColor:[UIColor whiteColor]
															  shape:XPRShapeSquare];

/** 
XPRIdenticonShapes valid shapes:
	XPRShapeRectangle,
	XPRShapeCircle
**/

	self.identiconImageView.image = [XPRIdenticonShapes imageWithSize:self.identiconImageView.frame.size
													  backgroundColor:[UIColor whiteColor]
																shape:XPRShapeCircle
														   shapeCount:7];

```
