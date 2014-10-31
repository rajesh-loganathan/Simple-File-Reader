//
//  MediaPlayerViewController.h
//  Folder App
//
//  Created by Rajesh on Dec,26.
//  Copyright (c) 2013 Rajesh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface MediaPlayerViewController : UIViewController<MPMediaPlayback>
@property (retain, nonatomic) NSString *fileLocation;
@property (weak, nonatomic) NSString *FileName;
@property (weak, nonatomic) NSString *FileType;
@end
