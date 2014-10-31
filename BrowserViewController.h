//
//  BrowserViewController.h
//  File Reader
//
//  Created by Rajesh on 28/03/14.
//  Copyright (c) 2014 Rajesh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrowserViewController : UIViewController<UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webview;
@property (strong, nonatomic) IBOutlet UITextField *googleText;
@property (strong, nonatomic) IBOutlet UITextField *urlText;
@property (strong, nonatomic) NSMutableString *searchText;

- (IBAction)goAction;
- (IBAction)back;
@end
