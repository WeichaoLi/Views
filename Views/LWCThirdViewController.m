//
//  LWCThirdViewController.m
//  Views
//
//  Created by 李伟超 on 14-9-16.
//  Copyright (c) 2014年 LWC. All rights reserved.
//

#import "LWCThirdViewController.h"
#import "LWCFirstViewController.h"
#import "LWCSecondViewController.h"

@interface LWCThirdViewController ()

@end

@implementation LWCThirdViewController

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
    
    if (self.leftViewController == nil) {
        LWCSecondViewController *secondVC = [[LWCSecondViewController alloc] initWithNibName:@"LWCSecondViewController" bundle:nil];
        self.leftViewController = secondVC;
        secondVC.rightViewController = self;
    }
//    if (self.rightViewController == nil) {
//        LWCFirstViewController *firstVC = [[LWCFirstViewController alloc] initWithNibName:@"LWCFirstViewController" bundle:nil];
//        self.rightViewController = firstVC;
//        firstVC.leftViewController = self;
//    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
