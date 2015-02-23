//
//  MainTableViewController.h
//  ViacomAssignment
//
//  Created by Rick Williams on 2/23/15.
//  Copyright (c) 2015 Rick Williams. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MainTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>


@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property(strong, nonatomic)NSMutableArray *dataArray;
@property(strong, nonatomic)NSURL *videoURL;

@end
