//
//  WebViewController.m
//  File Reader
//
//  Created by Rajesh on 28/03/14.
//  Copyright (c) 2014 Rajesh. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController
@synthesize FileWebView,FileName,FileType;

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
    [self FileLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)FileLoad
{
    if ([FileType isEqualToString:@"jpg"])
    {
        UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(self.FileWebView.frame.origin.x, self.FileWebView.frame.origin.y, self.FileWebView.frame.size.width, self.FileWebView.frame.size.height)];
        imageview.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",FileName]];
        imageview.contentMode = UIViewContentModeScaleAspectFit;
        [FileWebView removeFromSuperview];
        [self.view addSubview:imageview];
    }
                           
    else
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:FileName ofType:FileType];
        NSURL *targetURL = [NSURL fileURLWithPath:path];
        NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
        FileWebView.delegate = self;
        [FileWebView setScalesPageToFit:YES];
        CGFloat contentHeight = FileWebView.scrollView.contentSize.height;
        [FileWebView loadRequest:request];
        [self.view addSubview:FileWebView];
    }
    
}


@end
