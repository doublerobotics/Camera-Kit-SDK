//
//  DRViewController.m
//  DoubleBasicHelloWorld
//
//  Created by David Cann on 8/3/13.
//  Copyright (c) 2013 Double Robotics, Inc. All rights reserved.
//

#import "DRViewController.h"
#import <CameraKitSDK/CameraKitSDK.h>

@interface DRViewController () <DRCameraKitImageDelegate, DRCameraKitConnectionDelegate>
@end

@implementation DRViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[DRCameraKit sharedCameraKit].connectionDelegate = self;
	[DRCameraKit sharedCameraKit].imageDelegate = self;
	NSLog(@"SDK Version: %@", kCameraKitSDKVersion);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	return UIInterfaceOrientationIsPortrait(toInterfaceOrientation);
}

#pragma mark - Actions

- (IBAction)low:(id)sender {
	[[DRCameraKit sharedCameraKit] setCameraSettingsWithArray:(cameraSetting *)kCameraSettings640x480_15FPS_ISP];
}

- (IBAction)medium:(id)sender {
	[[DRCameraKit sharedCameraKit] setCameraSettingsWithArray:(cameraSetting *)kCameraSettings1280x960_30FPS];
}

- (IBAction)high:(id)sender {
	[[DRCameraKit sharedCameraKit] setCameraSettingsWithArray:(cameraSetting *)kCameraSettingsFullRes_15FPS];
}

#pragma mark - DRCameraKitConnectionDelegate

- (void)cameraKitConnectionStatusDidChange:(DRCameraKit *)theKit {
	connectionStatusLabel.text = (theKit.isConnected) ? @"Connected" : @"Not Connected";
	firmwareLabel.text = (theKit.isConnected) ? [NSString stringWithFormat:@"%ld", (long)theKit.firmwareVersion] : @"-";
	serialLabel.text = (theKit.isConnected) ? theKit.iAPSerialNumber : @"-";
}

#pragma mark - DRCameraKitImageDelegate

- (void)cameraKit:(DRCameraKit *)theKit didReceiveImage:(UIImage *)theImage sizeInBytes:(NSInteger)length {
	mainImageView.image = theImage;
}

@end
