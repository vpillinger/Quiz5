//
//  Quiz5ViewController.m
//  Quiz5
//
//  Created by Vincent Pillinger on 3/17/14.
//  Copyright (c) 2014 Vincent Pillinger. All rights reserved.
//

#import "Quiz5ViewController.h"

@interface Quiz5ViewController ()

@end

@implementation Quiz5ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
   } else {
        return YES;
    }
}

@end
