//
//  TableViewController.m
//  quiz5
//
//  Created by Vincent Pillinger on 3/15/14.
//  Copyright (c) 2014 Vincent Pillinger. All rights reserved.
//

#import "TableViewController.h"
#import "DetailedTaskView.h"
#import "Task.h"

@interface TableViewController ()

@end

@implementation TableViewController
@synthesize tasks;

-(id)init{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        tasks = [[NSMutableArray alloc]init];
        
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *components = [NSDateComponents new];
        NSDate *currDate = [NSDate date];
        
        for(int i = 0; i < 10; i++){
            NSString *str = [NSString stringWithFormat:@"Task %d", i];
            components.day = i;
            NSDate *date = [calendar dateByAddingComponents:components toDate:currDate options:0];
            Task *t = [[Task alloc]initWithTaskName:str urgency:i dateDue:date];
            [tasks addObject:t];
        }
        
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSArray *arr = [tasks sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2)
    {
        NSDate *d1 = [obj1 dueDate];
        NSDate *d2 = [obj2 dueDate];
        return [d1 compare:d2];
        

    }];
    tasks = [arr mutableCopy];
    [[self tableView] reloadData];
    
    //sort the task array
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.tableView.dataSource = self;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    int i = [indexPath row];
    Task *t = [tasks objectAtIndex:i];
    
    //set background color (WHY DOES THIS HIGHLIGHT THE TEXT TOO?
    [cell setBackgroundColor:[UIColor colorWithRed:[t urgency]/10.0 green:1-[t urgency]/10.0 blue:0 alpha:0.5]];
    
    //where we can set the cell info
    [[cell textLabel] setText:t.taskName];
    [[cell textLabel] setTextColor:[UIColor blackColor]];
    
    //display date
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateStyle:NSDateFormatterFullStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [[cell detailTextLabel] setText:[dateFormatter stringFromDate:[t dueDate]]];
    [[cell detailTextLabel] setTextColor:[UIColor blackColor]];
    
    //set picture if urgency is greater than 6
    if([t urgency] >= 6){
        cell.imageView.image = [UIImage imageNamed:@"urgent.jpg"];
    }
    else
        cell.imageView.image = NULL;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
      DetailedTaskView *detailViewController = [[DetailedTaskView alloc] initWithNibName:@"DetailedTaskView" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
    [detailViewController setTask:[tasks objectAtIndex:[indexPath row]]];
     [self.navigationController pushViewController:detailViewController animated:YES];
     
}

@end
