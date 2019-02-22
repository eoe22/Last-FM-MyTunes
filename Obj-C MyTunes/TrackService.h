//
//  TrackService.h
//  Obj-C MyTunes
//
//  Created by C2QJG01SDRJD on 1/29/19.
//  Copyright © 2019 C2QJG01SDRJD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TrackService : NSObject

+(instancetype)sharedInstance;

- (void)searchTracks:(NSString*)text completion:(void (^)(NSArray<NSString*>*))completion;

@end
