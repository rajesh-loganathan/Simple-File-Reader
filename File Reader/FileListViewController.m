//
//  FileListViewController.m
//  File Reader
//
//  Created by Rajesh on 28/03/14.
//  Copyright (c) 2014 Rajesh. All rights reserved.
//

#import "FileListViewController.h"
#import "FileListCell.h"
#import "WebViewController.h"
#import "MediaPlayerViewController.h"
#import "BrowserViewController.h"

@interface FileListViewController ()

@end

@implementation FileListViewController
@synthesize FilelistArray,FileType,FileListTable,MainTitle;

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
    self.navigationItem.title = MainTitle;

    NSLog(@"File Name = %@ \n File Type = %@",FilelistArray,FileType);
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title = MainTitle;
    self.navigationController.navigationBar.hidden = NO;
    if ([FileType isEqualToString:@"html"])
    {
        UIBarButtonItem *BrowserButton = [[UIBarButtonItem alloc]
                                          initWithTitle:@"Browser"
                                          style:UIBarButtonItemStyleBordered
                                          target:self
                                          action:@selector(WebBrowser)];
        self.navigationItem.rightBarButtonItem = BrowserButton;
    }
}

- (void)WebBrowser
{
    BrowserViewController *browser = [[BrowserViewController alloc]initWithNibName:@"BrowserViewController" bundle:nil];
    [self.navigationController pushViewController:browser animated:YES];
}

//--------- Table View properties starts -----------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [FilelistArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"Cell";
    FileListCell *cell = (FileListCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    FileListTable.separatorStyle = UITableViewCellSelectionStyleGray;
    FileListTable.separatorColor = [UIColor clearColor];
    UIView *separatorView = [[UIView alloc] initWithFrame:CGRectMake(0, 60, 1024, 1)];
    separatorView.layer.borderColor = [UIColor grayColor].CGColor;
    separatorView.layer.borderWidth = 1.0;
    [cell.contentView addSubview:separatorView];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"FileListCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    //cell.imageView.image = [UIImage imageNamed:@"folder.png"];
    cell.TitleLabel.text = [FilelistArray objectAtIndex:indexPath.row];
    
    if ([FileType isEqualToString:@"jpg"])
    {
		cell.CellImage.image =[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",[FilelistArray objectAtIndex:indexPath.row]]];
	}
    else if ([FileType isEqualToString:@"txt"])
    {
        cell.CellImage.image = [UIImage imageNamed:@"doc-icon.png"];
    }
    else if ([FileType isEqualToString:@"html"])
    {
        cell.CellImage.image = [UIImage imageNamed:@"html-icon.png"];
    }

    else if ([FileType isEqualToString:@"pdf"])
    {
        cell.CellImage.image = [UIImage imageNamed:@"pdf-icon.png"];
    }

    else if ([FileType isEqualToString:@"m4v"])
    {
        cell.CellImage.image = [UIImage imageNamed:@"video-icon.png"];
    }

    else if ([FileType isEqualToString:@"mp3"])
    {
        cell.CellImage.image = [UIImage imageNamed:@"music-icon.png"];
    }

    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}


-(void)tableView:(UITableView *)tableview didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([FileType isEqualToString:@"m4v"] || [FileType isEqualToString:@"mp3"])
    {
        MediaPlayerViewController *viewcontroller = [[MediaPlayerViewController alloc]initWithNibName:@"MediaPlayerViewController" bundle:nil];
        viewcontroller.FileName = [FilelistArray objectAtIndex:indexPath.row];
        viewcontroller.FileType = FileType;
        [self.navigationController pushViewController:viewcontroller animated:YES];
    }
    else
    {
        WebViewController *viewcontroller = [[WebViewController alloc]initWithNibName:@"WebViewController" bundle:nil];
        viewcontroller.FileName = [FilelistArray objectAtIndex:indexPath.row];
        viewcontroller.FileType = FileType;
        [self.navigationController pushViewController:viewcontroller animated:YES];
    }
}


//--------- Table View properties ends-----------------


@end
