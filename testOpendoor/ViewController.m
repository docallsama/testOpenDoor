//
//  ViewController.m
//  testOpendoor
//
//  Created by John doe on 13-4-16.
//  Copyright (c) 2013年 John doe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    _leftDoor = [CALayer layer];
    _leftDoor.contents = (id)[UIImage imageNamed:@"leftDoor.png"].CGImage;
    _leftDoor.anchorPoint = CGPointMake(0.0, 0.5);
    _leftDoor.frame = ibLeftDoorImg.frame;
    [[self.view layer] addSublayer:_leftDoor];
    
    _rightDoor = [CALayer layer];
    _rightDoor.contents = (id)[UIImage imageNamed:@"rightDoor.png"].CGImage;
    _rightDoor.anchorPoint = CGPointMake(1.0, 0.5);
    _rightDoor.frame = ibRightDoorImg.frame;
    [[self.view layer] addSublayer:_rightDoor];
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchWithGesture:)];
    [self.view addGestureRecognizer:pinch];
}

- (void)pinchWithGesture:(UIPinchGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan) {
        
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClickOpenButton:(id)sender {
    
    
}

- (IBAction)onSlideBar:(id)sender {
    _leftDoor.transform = CATransform3DIdentity;
    _leftDoor.transform = makePerspectiveTransform();
    
    _rightDoor.transform = CATransform3DIdentity;
    _rightDoor.transform = makePerspectiveTransform();
    
    float scale = ibSlider.value > 0.48 ? ibSlider.value : 0.48;
    scale = scale < 1.0 ? scale : 1.0;
    
    [CATransaction begin];
    [CATransaction setAnimationDuration:1.0];
    [CATransaction setDisableActions:YES];
    
    CATransform3D scaleChange = CATransform3DMakeScale(2.0f - scale, 2.0f - scale, 2.0f);
    CATransform3D leftDoorRotate = CATransform3DRotate(_leftDoor.transform, (1.0 - scale) * M_PI, 0, 1.0, 0);
    CATransform3D rightDoorRotate = CATransform3DRotate(_rightDoor.transform, -(1.0 - scale) * M_PI, 0, 1.0, 0);
    
//    _leftDoor.transform = CATransform3DRotate(_leftDoor.transform, (1.0 - scale) * M_PI, 0, 1.0, 0);
//    _rightDoor.transform = CATransform3DRotate(_rightDoor.transform, -(1.0 - scale) * M_PI, 0, 1.0, 0);
    
    CATransform3D leftDoorCombine = CATransform3DConcat(scaleChange, leftDoorRotate);
    CATransform3D RightDoorCombine = CATransform3DConcat(scaleChange, rightDoorRotate);
    
    [_leftDoor setPosition:CGPointMake(-100 * (1.0f - scale), _leftDoor.frame.size.height / 2)];
    [_rightDoor setPosition:CGPointMake(_leftDoor.frame.size.width * 2 + 100 * (1.0f - scale), _rightDoor.frame.size.height / 2)];
    
    [_leftDoor setTransform:leftDoorCombine];
    [_rightDoor setTransform:RightDoorCombine];
    
    [CATransaction commit];
}

CATransform3D makePerspectiveTransform()
{
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = 1.0 / -2000;
    return transform;
}

- (void)viewDidUnload {
    ibRightDoorImg = nil;
    ibSlider = nil;
    [super viewDidUnload];
}
@end
