//
//  AlbumService.h
//  Obj-C MyTunes
//
//  Created by C2QJG01SDRJD on 1/29/19.
//  Copyright © 2019 C2QJG01SDRJD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlbumService : NSObject

+(instancetype)sharedInstance;

- (void)searchAlbums:(NSString*)text completion:(void (^)(NSArray<NSString*>*))completion;

@end
