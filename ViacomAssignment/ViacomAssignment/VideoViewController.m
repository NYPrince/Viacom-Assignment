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
    
    self.moviePlayerViewController = [[MPMoviePlayerViewController alloc]initWithContentURL:_url];
    
    
    //[[self.moviePlayerViewController view] setFrame:[self.view.window bounds]];
    self.moviePlayerViewController.moviePlayer.shouldAutoplay = YES;

    [self.view addSubview:self.moviePlayerViewController.view];
    
    //[self.moviePlayerViewController.moviePlayer prepareToPlay];
    
    
    
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
