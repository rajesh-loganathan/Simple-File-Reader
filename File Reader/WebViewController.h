//
//  WebViewController.h
//  File Reader
//
//  Created by Rajesh on 28/03/14.
//  Copyright (c) 2014 Rajesh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *FileWebView;
@property (weak, nonatomic) NSString *FileName;
@property (weak, nonatomic) NSString *FileType;

@end
