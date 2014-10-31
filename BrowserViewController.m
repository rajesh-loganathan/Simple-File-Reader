//
//  BrowserViewController.m
//  File Reader
//
//  Created by Rajesh on 28/03/14.
//  Copyright (c) 2014 Rajesh. All rights reserved.
//

#import "BrowserViewController.h"

@interface BrowserViewController ()
{
    UIActivityIndicatorView *activityIndicator;
    BOOL isGoogle;
}

@end

@implementation BrowserViewController
@synthesize webview,urlText,googleText,searchText;

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
    [self activityIndicator];
    self.navigationController.navigationBar.hidden = YES;
    NSString *googleurl = [NSString stringWithFormat:@"http://www.google.com"];
    NSURL *url = [NSURL URLWithString:googleurl];
    NSURLRequest *requestconn = [NSURLRequest requestWithURL:url];
    [webview loadRequest:requestconn];
}

- (void)viewDidDisappear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = NO;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)activityIndicator
{
    activityIndicator= [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    activityIndicator.layer.cornerRadius = 05;
    activityIndicator.opaque = NO;
    activityIndicator.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.6f];
    activityIndicator.center = self.view.center;
    
    activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [activityIndicator setColor:[UIColor colorWithRed:0.6 green:0.8 blue:1.0 alpha:1.0]];
    [self.webview addSubview: activityIndicator];
    //[self.view addSubview:webview];
}

-(IBAction)goAction
{
    if (isGoogle==YES)
    {
        if(googleText.text.length != 0)
        {
            NSString *googleurl = [NSString stringWithFormat:@"http://www.google.com/search?q=%@",googleText.text];
            NSURL *url = [NSURL URLWithString:googleurl];
            NSURLRequest *requestconn = [NSURLRequest requestWithURL:url];
            [webview loadRequest:requestconn];
            [googleText resignFirstResponder];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"URL Error" message:@"Please Enter Text to search" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [googleText resignFirstResponder];
        }
    }
    else if (urlText.text)
    {
        if(urlText.text.length != 0)
        {
            NSString *googleurl = [NSString stringWithFormat:@"http://%@",urlText.text];
            NSURL *url = [NSURL URLWithString:googleurl];
            NSURLRequest *requestconn = [NSURLRequest requestWithURL:url];
            [webview loadRequest:requestconn];
            [urlText resignFirstResponder];
        }
        else
        {
            UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"URL Error" message:@"Please Enter URL to search" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert2 show];
            [urlText resignFirstResponder];
            
        }
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    if([textField isEqual:urlText])
    {
        isGoogle = NO;
    }
    
    else if ([textField isEqual:googleText])
    {
        isGoogle = YES;
    }
    
}
-(void)textFieldShouldReturn:(UITextField *)textField
{
    if([textField isEqual:urlText])
    {
        if(urlText.text.length != 0)
        {
            [self enterUrlText];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"URL Error" message:@"Please Enter Url" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [urlText resignFirstResponder];
        }
    }
    
    else if ([textField isEqual:googleText])
    {
        if (googleText.text.length != 0)
        {
            [self enterGoogleText];
        }
        
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"URL Error" message:@"Please Enter Url" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [googleText resignFirstResponder];
        }
        
    }
}

-(void)enterUrlText
{
    NSString *googleurl = [NSString stringWithFormat:@"http://%@",urlText.text];
    NSURL *url = [NSURL URLWithString:googleurl];
    NSURLRequest *requestconn = [NSURLRequest requestWithURL:url];
    [webview loadRequest:requestconn];
    [urlText resignFirstResponder];
    
}

-(void)enterGoogleText
{
    NSString *googleurl = [NSString stringWithFormat:@"http://www.google.com/search?q=%@",googleText.text];
    NSURL *url = [NSURL URLWithString:googleurl];
    NSURLRequest *requestconn = [NSURLRequest requestWithURL:url];
    [webview loadRequest:requestconn];
    [googleText resignFirstResponder];
}

- (void)webViewDidStartLoad:(UIWebView *)webView;
{
    [activityIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView;

{
    [activityIndicator stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;
{
    [activityIndicator stopAnimating];
    //UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Check Internet Connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    //alert.tag = 1;
    //[alert show];
}



//-- Alertview Tag Validation------

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        if (alertView.tag == 1)
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}
//--- Alertview tags validation ends----------

- (IBAction)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
