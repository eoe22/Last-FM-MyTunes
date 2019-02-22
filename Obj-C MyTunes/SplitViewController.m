//
//  SplitViewController.m
//  Obj-C MyTunes
//
//  Created by C2QJG01SDRJD on 2/1/19.
//  Copyright © 2019 C2QJG01SDRJD. All rights reserved.
//

#import "SplitViewController.h"

@interface SplitViewController ()

@end

@implementation SplitViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
    self.delegate = self;
}

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController{
    
    return YES;
}

@end
