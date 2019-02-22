//
//  Album.m
//  Obj-C MyTunes
//
//  Created by C2QJG01SDRJD on 1/30/19.
//  Copyright © 2019 C2QJG01SDRJD. All rights reserved.
//

#import "Album.h"

@implementation Album

-(id)initWithData:(NSDictionary*) data{
    if (self = [super init]){
        NSString *name = [data objectForKey:@"name"];
        NSString *artist = [data objectForKey:@"artist"];
        
        self.title = name;
        self.artist = artist;
        
        NSArray *images = [data objectForKey:@"image"];
        
        //get 2nd item in array if available
        //if not then 1st image
        int index = 0;
        if (images.count > 0){
            //pick 2nd item if available
            if (images.count >= 2) {
                index = 1;
            }
            
            NSDictionary *imageData = images[index];
            NSString *url = [imageData objectForKey: @"#text"];
            
            self.url = url;
        }
        //        if (images.count > 1){
        //            index = 1;
        //
        //            NSDictionary *imageData = images[index];
        //            NSString *url = [imageData objectForKey: @"#text"];
        //
        //            self.url = url;
        //        }

    }
    return self;
}

@end
