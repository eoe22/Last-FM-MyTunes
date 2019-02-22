//
//  NSURL+SearchURL.m
//  Obj-C MyTunes
//
//  Created by C2QJG01SDRJD on 1/30/19.
//  Copyright © 2019 C2QJG01SDRJD. All rights reserved.
//

#import "NSURL+SearchURL.h"

@implementation NSURL (SearchURL)

+(id)searchFor:(NSString*)text ofKind:(NSString*) searchType{
    
    NSString *urlString = [NSString stringWithFormat: @"https://ws.audioscrobbler.com/2.0/?method=%@.search&%@=%@&api_key=666ec342286977fbceef97f221aed827&format=json", searchType, searchType, text];
    
    return [NSURL URLWithString:urlString];
}

@end
