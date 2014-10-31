//
//  FileListCell.m
//  File Reader
//
//  Created by Rajesh on 28/03/14.
//  Copyright (c) 2014 Rajesh. All rights reserved.
//

#import "FileListCell.h"

@implementation FileListCell
@synthesize CellImage,TitleLabel;
/*
- (void)awakeFromNib
{
    // Initialization code
}
 */
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
