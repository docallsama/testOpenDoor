//
//  ViewController.h
//  testOpendoor
//
//  Created by John doe on 13-4-16.
//  Copyright (c) 2013年 John doe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController {
    CALayer *_leftDoor;
    CALayer *_rightDoor;
    __weak IBOutlet UIImageView *ibLeftDoorImg;
    __weak IBOutlet UIImageView *ibRightDoorImg;
    __weak IBOutlet UISlider *ibSlider;
    
}
- (IBAction)onClickOpenButton:(id)sender;

- (IBAction)onSlideBar:(id)sender;
@end
