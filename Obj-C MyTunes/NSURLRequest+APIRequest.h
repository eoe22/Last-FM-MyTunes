//
//  NSURLRequest+APIRequest.h
//  Obj-C MyTunes
//
//  Created by C2QJG01SDRJD on 1/30/19.
//  Copyright © 2019 C2QJG01SDRJD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLRequest (APIRequest)

-(void)makeAPIRequestAt:(NSURL*)url completion:(void (^)(NSDictionary*))completion;

@end
