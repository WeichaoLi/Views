//
//  LWCFirstViewController.m
//  Views
//
//  Created by 李伟超 on 14-9-11.
//  Copyright (c) 2014年 LWC. All rights reserved.
//

#import "LWCFirstViewController.h"
#import "LWCSecondViewController.h"
#import "LWCThirdViewController.h"

@interface LWCFirstViewController ()

@end

@implementation LWCFirstViewController

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
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
//    if (self.rightViewController == nil) {
//        LWCSecondViewController *secondVC = [[LWCSecondViewController alloc] initWithNibName:@"LWCSecondViewController" bundle:nil];
//        [self SetLeftController:nil RightController:secondVC];
//        secondVC.leftViewController = self;
//        secondVC.rightViewController = self;
//        [self.parentViewController addChildViewController:self.rightViewController];
//    }
    
    if (self.rightViewController == nil) {
        LWCSecondViewController *secondVC = [[LWCSecondViewController alloc] initWithNibName:@"LWCSecondViewController" bundle:nil];
        self.rightViewController = secondVC;
        secondVC.leftViewController = self;
        [self.parentViewController addChildViewController:self.rightViewController];
    }
    
//    if (self.leftViewController == nil) {
//        LWCThirdViewController *thirdVC = [[LWCThirdViewController alloc] initWithNibName:@"LWCThirdViewController" bundle:nil];
//        self.leftViewController = thirdVC;
//        thirdVC.rightViewController = self;
//        [self.parentViewController addChildViewController:self.leftViewController];
//    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)TouchButtonEvent:(id)sender {
    NSLog(@"第一个视图");
}
@end
