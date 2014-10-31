//
//  MainViewController.m
//  File Reader
//
//  Created by Rajesh on 28/03/14.
//  Copyright (c) 2014 Rajesh. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
{
    NSMutableDictionary *plist_data;
}
@end

@implementation MainViewController
@synthesize filelistcontroller;

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
    
    //-- Read data from plist
    NSString *path = [[NSBundle mainBundle] pathForResource: @"AllFileNames" ofType: @"plist"];
    plist_data =[[NSMutableDictionary alloc] initWithContentsOfFile:path];
}
- (void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title = @"FILE BROWSER";
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)Images:(id)sender
{
    filelistcontroller = [[FileListViewController alloc]initWithNibName:@"FileListViewController" bundle:nil];
    filelistcontroller.FilelistArray = [plist_data objectForKey:@"Images"];
    filelistcontroller.FileType = @"jpg";
    filelistcontroller.MainTitle = @"Images";
    [self.navigationController pushViewController:filelistcontroller animated:YES];
}

- (IBAction)Document:(id)sender
{
    filelistcontroller = [[FileListViewController alloc]initWithNibName:@"FileListViewController" bundle:nil];
    filelistcontroller.FilelistArray = [plist_data objectForKey:@"Document"];
    filelistcontroller.FileType = @"txt";
    filelistcontroller.MainTitle = @"Document Files";
    [self.navigationController pushViewController:filelistcontroller animated:YES];
}

- (IBAction)Html:(id)sender
{
    filelistcontroller = [[FileListViewController alloc]initWithNibName:@"FileListViewController" bundle:nil];
    filelistcontroller.FilelistArray = [plist_data objectForKey:@"Html"];
    filelistcontroller.FileType = @"html";
    filelistcontroller.MainTitle = @"HTML Files";
    [self.navigationController pushViewController:filelistcontroller animated:YES];
}

- (IBAction)Pdf:(id)sender
{
    filelistcontroller = [[FileListViewController alloc]initWithNibName:@"FileListViewController" bundle:nil];
    filelistcontroller.FilelistArray = [plist_data objectForKey:@"Pdf"];
    filelistcontroller.FileType = @"pdf";
    filelistcontroller.MainTitle = @"PDF Files";
    [self.navigationController pushViewController:filelistcontroller animated:YES];
}

- (IBAction)Audio:(id)sender
{
    filelistcontroller = [[FileListViewController alloc]initWithNibName:@"FileListViewController" bundle:nil];
    filelistcontroller.FilelistArray = [plist_data objectForKey:@"Audio"];
    filelistcontroller.FileType = @"mp3";
    filelistcontroller.MainTitle = @"Audio Files";
    [self.navigationController pushViewController:filelistcontroller animated:YES];
}

- (IBAction)Video:(id)sender
{
    filelistcontroller = [[FileListViewController alloc]initWithNibName:@"FileListViewController" bundle:nil];
    filelistcontroller.FilelistArray = [plist_data objectForKey:@"Video"];
    filelistcontroller.FileType = @"m4v";
    filelistcontroller.MainTitle = @"Video Files";
    [self.navigationController pushViewController:filelistcontroller animated:YES];
}


@end
