//
//  DetailedTaskView.m
//  quiz5
//
//  Created by Vincent Pillinger on 3/15/14.
//  Copyright (c) 2014 Vincent Pillinger. All rights reserved.
//

#import "DetailedTaskView.h"

@interface DetailedTaskView ()

@end

@implementation DetailedTaskView
@synthesize urgencyLabel;
@synthesize nameField;
@synthesize urgencyField;
@synthesize dateField;
@synthesize task;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.nameField.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [nameField setText:[task taskName]];
    [urgencyField setValue:[task urgency]];
    [urgencyLabel setText:[NSString stringWithFormat: @"%.2f", [task urgency]]];
    [dateField setDate:[task dueDate]];
    
    
}

- (void)viewDidUnload
{
    [self setNameField:nil];
    [self setUrgencyField:nil];
    [self setDateField:nil];
    [self setUrgencyLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)saveTask:(id)sender {
    [task setDueDate:[dateField date]];
    [task setTaskName:[nameField text]];
    [task setUrgency:[urgencyField value]];
    //go back to main menu on save
    [[self navigationController] popToRootViewControllerAnimated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)urgencySlider:(id)sender {
    [urgencyLabel setText:[NSString stringWithFormat: @"%.2f", [urgencyField value]]];
}
- (IBAction)backgroundTapped:(id)sender {
    [[self view] endEditing:YES];
}
@end
