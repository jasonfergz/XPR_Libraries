//
//  ViewController.m
//  IdenticonExample
//
//  Created by Jason Ferguson on 11/30/14.
//  Copyright (c) 2014 Jason Ferguson. All rights reserved.
//

#import "ViewController.h"
#import "XPR_IdenticonGrid.h"
#import "XPR_IdenticonShapes.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *identiconImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)gridOneColorPressed:(id)sender {
	UIImage * image = [XPR_IdenticonGrid createIdenticonImageForSize:CGSizeMake(self.identiconImageView.frame.size.width, self.identiconImageView.frame.size.height)
																type:XPR_IdenticonTypeMirroredGridOneColor
													 backgroundColor:[UIColor whiteColor]
															   shape:XPR_ShapeSquare];

	self.identiconImageView.image = image;

}

- (IBAction)gridMultiColorPressed:(id)sender {
	UIImage * image = [XPR_IdenticonGrid createIdenticonImageForSize:CGSizeMake(self.identiconImageView.frame.size.width, self.identiconImageView.frame.size.height)
																type:XPR_IdenticonTypeMirroredGridMultiColor
													 backgroundColor:[UIColor whiteColor]
															   shape:XPR_ShapeSquare];

	self.identiconImageView.image = image;

}

- (IBAction)gridMultiColoredRowsPressed:(id)sender {
	UIImage * image = [XPR_IdenticonGrid createIdenticonImageForSize:CGSizeMake(self.identiconImageView.frame.size.width, self.identiconImageView.frame.size.height)
																type:XPR_IdenticonTypeMirroredGridMultiColorRows
													 backgroundColor:[UIColor whiteColor]
															   shape:XPR_ShapeSquare];

	self.identiconImageView.image = image;

}

- (IBAction)gridMultiColorColumnsPressed:(id)sender {
	UIImage * image = [XPR_IdenticonGrid createIdenticonImageForSize:CGSizeMake(self.identiconImageView.frame.size.width, self.identiconImageView.frame.size.height)
																type:XPR_IdenticonTypeMirroredGridMultiColorColumns
													 backgroundColor:[UIColor whiteColor]
															   shape:XPR_ShapeSquare];

	self.identiconImageView.image = image;

}

- (IBAction)shapesCirclesPressed:(id)sender {
	self.identiconImageView.image = [XPR_IdenticonShapes createIdenticonImageForSize:CGSizeMake(self.identiconImageView.frame.size.width, self.identiconImageView.frame.size.height)
																		backgroundColor:[UIColor whiteColor]
																				  shape:XPR_ShapeCircle];

}

- (IBAction)shapesSquaresPressed:(id)sender {
	self.identiconImageView.image = [XPR_IdenticonShapes createIdenticonImageForSize:CGSizeMake(self.identiconImageView.frame.size.width, self.identiconImageView.frame.size.height)
																		backgroundColor:[UIColor whiteColor]
																				  shape:XPR_ShapeRectangle];


}






@end
