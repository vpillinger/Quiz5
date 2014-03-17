//
//  TableViewController.h
//  quiz5
//
//  Created by Vincent Pillinger on 3/15/14.
//  Copyright (c) 2014 Vincent Pillinger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>

@property NSMutableArray *tasks;

@end
