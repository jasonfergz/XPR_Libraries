//
//  ViewController.m
//  IdenticonExample
//
//  Created by Jason Ferguson on 11/30/14.
//  Copyright (c) 2014 Jason Ferguson. All rights reserved.
//

#import "ViewController.h"
#import "XPRIdenticonGrid.h"
#import "XPRIdenticonShapes.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *identiconImageView;
@property (nonatomic) CGSize imageSize;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	//self.imageSize = CGSizeMake(self.identiconImageView.frame.size.width, self.identiconImageView.frame.size.height);
	self.imageSize = CGSizeMake(1024, 1024);
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)gridOneColorPressed:(id)sender {
	self.identiconImageView.image = [XPRIdenticonGrid imageWithSize:self.imageSize
															   type:XPRIdenticonTypeMirroredGridOneColor
													backgroundColor:[UIColor whiteColor]
															  shape:XPRShapeSquare];

}

- (IBAction)gridMultiColorPressed:(id)sender {
	self.identiconImageView.image = [XPRIdenticonGrid imageWithSize:self.imageSize
															   type:XPRIdenticonTypeMirroredGridMultiColor
													backgroundColor:[UIColor whiteColor]
															  shape:XPRShapeSquare];

}

- (IBAction)gridMultiColoredRowsPressed:(id)sender {
	self.identiconImageView.image = [XPRIdenticonGrid imageWithSize:self.imageSize
															   type:XPRIdenticonTypeMirroredGridMultiColorRows
													backgroundColor:[UIColor whiteColor]
															  shape:XPRShapeSquare];

}

- (IBAction)gridMultiColorColumnsPressed:(id)sender {
	self.identiconImageView.image = [XPRIdenticonGrid imageWithSize:self.imageSize
															   type:XPRIdenticonTypeMirroredGridMultiColorColumns
													backgroundColor:[UIColor whiteColor]
															  shape:XPRShapeSquare];

}

- (IBAction)shapesCirclesPressed:(id)sender {
	self.identiconImageView.image = [XPRIdenticonShapes imageWithSize:self.imageSize
													  backgroundColor:[UIColor whiteColor]
																shape:XPRShapeCircle
														   shapeCount:7];
}

- (IBAction)shapesSquaresPressed:(id)sender {
	self.identiconImageView.image = [XPRIdenticonShapes imageWithSize:self.imageSize
													  backgroundColor:[UIColor whiteColor]
																shape:XPRShapeRectangle
														   shapeCount:7];
}

- (IBAction)saveImagePressed:(id)sender {
	[self writeImageToFile];
}

#pragma mark - Write file

- (void) writeImageToFile {
	//make a file name to write the data to using the documents directory:
	int timestamp = [[NSDate date] timeIntervalSince1970];
	NSString *fileName = [NSString stringWithFormat:@"%@/Identicon-%d.png",
						  [self documentsDirectory],timestamp];

	NSData *imageData = UIImagePNGRepresentation(self.identiconImageView.image);
	if ([imageData writeToFile:fileName atomically:NO]) {
		NSLog(@"Image Saved");
	} else {
		NSLog(@"Image Failed To Save");
	}
}

#pragma mark - List Files

- (NSArray*)listOfFiles {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];

	NSArray *filesArray = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:documentsDirectory  error:nil];

	NSLog(@"List of files:\n%@", filesArray);
	return filesArray;
}

#pragma mark - Documents Directory

- (NSString *)documentsDirectory {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	return documentsDirectory;
}




@end
