//
//  MainTableViewController.m
//  ViacomAssignment
//
//  Created by Rick Williams on 2/23/15.
//  Copyright (c) 2015 Rick Williams. All rights reserved.
//

#import "MainTableViewController.h"
#import "Record.h"
#import "Prototype.h"



static NSString *CellIdentifier = @"Cell";

@implementation MainTableViewController

-(void)viewDidLoad{
    
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

-(void)viewWillAppear:(BOOL)animated{
    
    [self configureData];
    
}
    
#pragma mark - Helper Methods
    - (void)configureData{
        
        
        NSURLResponse * response = nil;
        NSError * error = nil;
        
        NSURL *url = [NSURL URLWithString:@"https://vine.co/api/timelines/users/918753190470619136"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        
        NSData * data = [NSURLConnection sendSynchronousRequest:request
                                              returningResponse:&response
                                                          error:&error];
        if (error == nil)
        {
            // Parse data here
            NSDictionary *object = [ NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSDictionary *data = [object objectForKey:@"data"];
            NSArray *records = [data objectForKey:@"records"];
            
            self.dataArray = [[NSMutableArray alloc]init];//this is for the tableview
            
            for(int i=0;i<records.count;i++){
                
                NSDictionary *dictionary = [records objectAtIndex:i];
                
                
                NSLog(@"%@", dictionary);
                Record *recordData = [self createRecord:dictionary];
                
                
                [_dataArray addObject:recordData];
                
            }
            
            
        }
        
        [self.tableView reloadData];
        
    }

- (Record *)createRecord:(NSDictionary *)info{
        if (info == nil) {return nil;}
        
        
        Record *newRecord =[[Record alloc]init];
        if (newRecord ) {
            newRecord.username = [info objectForKey:@"username"];
            newRecord.thumbNail = [info objectForKey:@"thumbnailUrl"];
            newRecord.videoLowURL = [info objectForKey:@"videoLowURL"];
            
            
        }
    return newRecord;
    
}

#pragma mark - TableView Delegate Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        
        if (self.dataArray) {
            return [self.dataArray count];
            
        }
        return 1;
    }

    -(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
        
        return 1;
    }
    - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
        //send record to detail view
        self.videoURL = [NSURL URLWithString:((Record*)[self.dataArray objectAtIndex:indexPath.row]).videoLowURL];
        if (self.videoURL){
            [self performSegueWithIdentifier:@"toVideo" sender:self];
        }
        
    }
    -(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        
    
        
        Prototype * cell = (Prototype*) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (!cell) {
            cell = [[Prototype alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        
        //get username from the Record in the array
        cell.userName.text = ((Record*)[self.dataArray objectAtIndex:indexPath.row]).username;
        
        //image from url
        cell.imageView.image =[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:((Record*)[self.dataArray objectAtIndex:indexPath.row]).thumbNail] ]];
        
        return cell;
    }
    



@end
