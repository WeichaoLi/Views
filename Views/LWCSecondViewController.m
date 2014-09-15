//
//  LWCSecondViewController.m
//  Views
//
//  Created by 李伟超 on 14-9-11.
//  Copyright (c) 2014年 LWC. All rights reserved.
//

#import "LWCSecondViewController.h"
#import "LWCFirstViewController.h"

@interface LWCSecondViewController ()

@end

@implementation LWCSecondViewController

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
    self.view.backgroundColor = [UIColor redColor];
    
    if (self.leftViewController == nil) {
        LWCFirstViewController *firstVC = [[LWCFirstViewController alloc] initWithNibName:@"LWCFirstViewController" bundle:nil];
        [self SetLeftController:firstVC RightController:nil];
        [self.parentViewController addChildViewController:self.leftViewController];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)TouchButtonEvent:(id)sender {
        NSLog(@"第二个视图");
}

@end
