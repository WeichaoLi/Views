//
//  BasicViewController.h
//  Views
//
//  Created by 李伟超 on 14-9-11.
//  Copyright (c) 2014年 LWC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicViewController : UIViewController<UIGestureRecognizerDelegate> {
    CGPoint _startPoint;
    
}

@property (nonatomic, retain) BasicViewController *leftViewController;
@property (nonatomic, retain) BasicViewController *rightViewController;

- (void)SetLeftController:(BasicViewController *)leftController RightController:(BasicViewController *)rightController;

@end
