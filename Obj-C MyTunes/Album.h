//
//  Album.h
//  Obj-C MyTunes
//
//  Created by C2QJG01SDRJD on 1/30/19.
//  Copyright © 2019 C2QJG01SDRJD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Album : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *artist;
@property (nonatomic, strong) NSString *url;

-(id)initWithData:(NSDictionary*) data;

@end
