//
//  VideoViewController.m
//  ViacomAssignment
//
//  Created by Rick Williams on 2/23/15.
//  Copyright (c) 2015 Rick Williams. All rights reserved.
//

#import "VideoViewController.h"

@implementation VideoViewController


-(void)viewDidLoad{
    
    [super viewDidLoad];
    
   self.moviePlayerViewController = [[MPMoviePlayerViewController alloc]initWithContentURL:self.url];
    
    
     self.moviePlayerViewController.moviePlayer.shouldAutoplay = YES;

    [self.view addSubview:self.moviePlayerViewController.view];
   
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    self.moviePlayerViewController = nil;
    
}


- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.navigationController.navigationBarHidden = NO;
    
}



@end
