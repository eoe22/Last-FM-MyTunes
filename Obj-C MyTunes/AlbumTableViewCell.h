//
//  AlbumTableViewCell.h
//  Obj-C MyTunes
//
//  Created by C2QJG01SDRJD on 1/30/19.
//  Copyright © 2019 C2QJG01SDRJD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Album.h"

@interface AlbumTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageViewLabel;
@property (weak, nonatomic) IBOutlet UILabel *albumLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

- (void) configureWith: (Album*) album;

@end
