//
//  BasicViewController.m
//  Views
//
//  Created by 李伟超 on 14-9-11.
//  Copyright (c) 2014年 LWC. All rights reserved.
//

#import "BasicViewController.h"

@interface BasicViewController (){
    CGFloat _CenterBeginX;
    CGFloat _LeftBeginX;
    CGFloat _RightBeginX;
}

@end

@implementation BasicViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    panGestureRecognizer.delegate = self;
    [self.view addGestureRecognizer:panGestureRecognizer];
}

- (void)handleGesture:(UIPanGestureRecognizer *)panGestureRecognizer {

    CGPoint currentPoint = [panGestureRecognizer locationInView:[[UIApplication sharedApplication] keyWindow]];
    switch (panGestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:
            _startPoint = currentPoint;

            if (_leftViewController) {
                _leftViewController.view.frame = CGRectMake(-self.parentViewController.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
                [self.parentViewController.view insertSubview:_leftViewController.view belowSubview:self.view];
            }
            if (_rightViewController) {
                _rightViewController.view.frame = CGRectMake(self.parentViewController.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
                [self.parentViewController.view insertSubview:_rightViewController.view belowSubview:self.view];
                NSLog(@"%@",self.parentViewController.childViewControllers);
            }
            
            _CenterBeginX = self.view.transform.tx;
            _LeftBeginX  = _leftViewController.view.transform.tx;
            _RightBeginX = _rightViewController.view.transform.tx;
            
            break;
            
        case UIGestureRecognizerStateChanged:
            [self MovedTheView:(currentPoint.x - _startPoint.x)];
            break;
            
        case UIGestureRecognizerStateEnded: {
            CGFloat Xdistant = currentPoint.x -_startPoint.x;
            
            if (Xdistant >= 120) { // 向右滑
                
                [UIView animateWithDuration:0.3 animations:^{
                    if (_leftViewController) {
                        [self MovedTheView:320];
                    }else {
                        [self MovedTheView:0];
                    }
                    
                }completion:^(BOOL finished){}];
                
            }else if (Xdistant < -120) { // 向左滑
                
                    [UIView animateWithDuration:0.3 animations:^{
                        if (_rightViewController) {
                            [self MovedTheView:-320];
                        }else {
                            [self MovedTheView:0];
                        }
                        
                    }completion:^(BOOL finished){}];
                
            }else {  //滑动距离太小，恢复原位
                
                [UIView animateWithDuration:0.2 animations:^{
                    [self MovedTheView:0];
                }completion:^(BOOL finished){}];
                
            }
        }
            break;
            
        case UIGestureRecognizerStateCancelled: {
            [UIView animateWithDuration:0.4 animations:^{
                [self MovedTheView:0];
            } completion:^(BOOL finished) {

            }];
            return;
        }
            break;
            
        default:
            break;
    }
}

//移动位置
- (void)MovedTheView:(CGFloat)XD {
    self.view.transform = CGAffineTransformMakeTranslation(_CenterBeginX + XD, 0);
    
    _leftViewController.view.transform = CGAffineTransformMakeTranslation(_LeftBeginX + XD, 0);
    _rightViewController.view.transform = CGAffineTransformMakeTranslation(_RightBeginX + XD, 0);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)SetLeftController:(BasicViewController *)leftController RightController:(BasicViewController *)rightController {
    _leftViewController = leftController;
    _rightViewController = rightController;
    
    _leftViewController.rightViewController = self;
    _rightViewController.leftViewController = self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
