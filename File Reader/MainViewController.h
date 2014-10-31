//
//  MainViewController.h
//  File Reader
//
//  Created by Rajesh on 28/03/14.
//  Copyright (c) 2014 Rajesh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FileListViewController.h"


@interface MainViewController : UIViewController

@property (strong, nonatomic) FileListViewController *filelistcontroller;


- (IBAction)Images:(id)sender;
- (IBAction)Document:(id)sender;
- (IBAction)Html:(id)sender;
- (IBAction)Pdf:(id)sender;
- (IBAction)Audio:(id)sender;
- (IBAction)Video:(id)sender;

@end
