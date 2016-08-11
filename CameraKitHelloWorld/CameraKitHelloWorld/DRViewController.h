//
//  DRViewController.h
//  DoubleBasicHelloWorld
//
//  Created by David Cann on 8/3/13.
//  Copyright (c) 2013 Double Robotics, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DRViewController : UIViewController {
	IBOutlet UIImageView *mainImageView;
	IBOutlet UILabel *connectionStatusLabel;
	IBOutlet UILabel *firmwareLabel;
	IBOutlet UILabel *serialLabel;
}

@end
