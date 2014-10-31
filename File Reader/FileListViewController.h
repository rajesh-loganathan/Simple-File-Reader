//
//  FileListViewController.h
//  File Reader
//
//  Created by Rajesh on 28/03/14.
//  Copyright (c) 2014 Rajesh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FileListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
}
@property (weak, nonatomic) IBOutlet UITableView *FileListTable;
@property (weak, nonatomic) NSArray *FilelistArray;
@property (weak, nonatomic) NSString *FileType;
@property (weak, nonatomic) NSString *MainTitle;
@end
