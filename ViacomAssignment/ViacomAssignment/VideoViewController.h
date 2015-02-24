//
//  VideoViewController.h
//  ViacomAssignment
//
//  Created by Rick Williams on 2/23/15.
//  Copyright (c) 2015 Rick Williams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property(strong, nonatomic)MPMoviePlayerViewController *moviePlayer;

@property(strong, nonatomic)NSURL *url;


@end
