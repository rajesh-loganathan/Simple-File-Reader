//
//  MediaPlayerViewController.m
//  Folder App
//
//  Created by Rajesh  on Dec,26.
//  Copyright (c) 2013 Rajesh . All rights reserved.
//

#import "MediaPlayerViewController.h"

@interface MediaPlayerViewController ()

@end

@implementation MediaPlayerViewController
@synthesize fileLocation,FileType,FileName;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *vedioURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:FileName ofType:FileType]];
    MPMoviePlayerViewController *videoPlayerView = [[MPMoviePlayerViewController alloc] initWithContentURL:vedioURL];
    [self presentMoviePlayerViewControllerAnimated:videoPlayerView];
    //videoPlayerView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    //[self.view addSubview:videoPlayerView.view];
    [videoPlayerView.moviePlayer play];
}

-(void)endSeeking
{
    [self.navigationController popViewControllerAnimated:NO];
}

-(void)stop
{
    [self.navigationController popViewControllerAnimated:NO];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidDisappear:(BOOL)animated
{
    [self.navigationController popViewControllerAnimated:NO];
}

@end
