//
//  AlbumTableViewCell.m
//  Obj-C MyTunes
//
//  Created by C2QJG01SDRJD on 1/30/19.
//  Copyright © 2019 C2QJG01SDRJD. All rights reserved.
//

#import "AlbumTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation AlbumTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) configureWith: (Album*) album {
    
    //set text labels
    self.albumLabel.text = album.title;
    self.titleLabel.text = album.artist;
    
    //set image
    NSLog(@"%@", album.url);
    [self.imageViewLabel sd_setImageWithURL:
     [NSURL URLWithString: album.url]
                           placeholderImage: nil];
}

@end
