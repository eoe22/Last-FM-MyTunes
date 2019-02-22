//
//  ArtistService.h
//  Obj-C MyTunes
//
//  Created by C2QJG01SDRJD on 1/28/19.
//  Copyright © 2019 C2QJG01SDRJD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Album.h"

@interface ArtistService : NSObject

+(instancetype)sharedInstance;

- (void)searchArtists:(NSString*)text completion:(void (^)(NSArray<NSString*>*))completion;

- (void)searchAlbums:(NSString*)text completion:(void (^)(NSArray<Album*>*))completion;

//- (void)searchArtists:(void (^)(NSArray<NSString*>*))completion;

@end
